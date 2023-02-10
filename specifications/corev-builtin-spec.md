### CORE-V builtin names

## Index

- [History](#history)
- [Executive Summary](#executive-summary)
- [Design principles](#design-principles)
  - [Using vector types](#using-vector-types)
  - [Support for 64-bit and 32-bit](#support-for-64-bit-and-32-bit)
  - [Existing builtin functions](#existing-builtin-functions)
  - [Ordering of arguments](#ordering-of-arguments)
- [Listing of hardware loop builtins (`xcvhwlp`)](#listing-of-hardware-loop-builtins-xcvhwlp)
- [Listing of multiply-accumulate builtins (`xcvmac`)](#listing-of-multiply-accumulate-builtins-xcvmac)
  - [32-bit x 32-bit (32-bit cores)](#32-bit-x-32-bit-32-bit-cores)
  - [64-bit x 64-bit multiply-accumulate](#64-bit-x-64-bit-multiply-accumulate)
  - [16-bit x 16-bit multiplication](#16-bit-x-16-bit-multiplication)
  - [32-bit x 32-bit multiplication (64-bit cores)](#32-bit-x-32-bit-multiplication-64-bit-cores)
  - [16-bit x 16-bit multiply-accumulate](#16-bit-x-16-bit-multiply-accumulate)
  - [32-bit x 32-bit multiply-accumulate (64-bit cores)](#32-bit-x-32-bit-multiply-accumulate-64-bit-cores)
- [Listing of immediate branch builtins (`xcvbi`)](#listing-of-immediate-branch-builtins-xcvbi)
- [Listing of post-indexed and register-indexed memory access builtins (`xcvmem`)](#listing-of-post-indexed-and-register-indexed-memory-access-builtins-xcvmem)
- [Listing of miscellaneous ALU builtins (`xcvalu`)](#listing-of-miscellaneous-alu-builtins-xcvalu)
  - [ALU builtins for 32-bit cores](#alu-builtins-for-32-bit-cores)
  - [ALU builtins for 64-bit cores](#alu-builtins-for-64-bit-cores)
- [Listing of PULP 8/16-bit SIMD builtins (`xcvsimd`)](#listing-of-pulp-816-bit-simd-builtins-xcvsimd)
  - [SIMD ALU operations (32-bit)](#simd-alu-operations-32-bit)
  - [SIMD ALU operations (64-bit)](#simd-alu-operations-64-bit)
  - [SIMD bit manipulation operations (32-bit)](#simd-bit-manipulation-operations-32-bit)
  - [SIMD bit manipulation operations (64-bit)](#simd-bit-manipulation-operations-64-bit)
  - [SIMD dot product operations (32-bit)](#simd-dot-product-operations-32-bit)
  - [SIMD dot product operations (64-bit)](#simd-dot-product-operations-64-bit)
  - [SIMD shuffle and pack operations (32-bit)](#simd-shuffle-and-pack-operations-32-bit)
  - [SIMD shuffle and pack operations (64-bit)](#simd-shuffle-and-pack-operations-64-bit)
  - [SIMD comparison operations (32-bit)](#simd-comparison-operations-32-bit)
  - [SIMD comparison operations (64-bit)](#simd-comparison-operations-64-bit)
  - [SIMD complex number operations (32-bit)](#simd-complex-number-operations-32-bit)
  - [SIMD complex number operations (64-bit)](#simd-complex-number-operations-64-bit)
- [Listing of PULP bit manipulation builtins (`xcvbitmanip`)](#pulp-bit-manipulation-builtins-for-32-bit-cores)
  - [PULP bit manipulation builtins for 32-bit cores](#pulp-bit-manipulation-builtins-for-32-bit-cores)
  - [PULP bit manipulation builtins for 64-bit cores](#pulp-bit-manipulation-builtins-for-64-bit-cores)
- [Listing of event load word builtins (`xcvelw`)](#listing-of-event-load-word-builtins-xcvelw)
  - [Event load word builtins for 32-bit cores](#event-load-word-builtins-for-32-bit-cores)
  - [Event load word builtins for 64-bit cores](#event-load-word-builtins-for-64-bit-cores)

## History

| Date        | Version | Notes                                                 |
| :---------- | :------ | :---------------------------------------------------- |
| 15 Dec 2022 | 0.1     | First draft for review.                               |
| 22 Jan 2023 | 0.2     | Second draft after view and Software TG discussion.   |
|             |         | - naming to match upstream convention;                |
|             |         | - naming to include the ISA extension name;           |
|             |         | - pass by reference only when loading a value;        |
|             |         | - pseudo-overloading to allow 32- and 64-bit support; |
| 13 Feb 2023 | 0.3     | Third draft after feedback from the GCC               |
|             |         | implementation team.                                  |

## Executive Summary

We need to define our builtin names for the 200+ instructions in the various CORE-V ISA extensions.  For each builtin,  we give its prototype and relate the arguments to the semantics of the instruction as described in the CV32E40P architecture manual.

## Design principles

Standard RISC-V builtin functions use the following naming convention.
```
__builtin_riscv_<name>
```

The Clang/LLVM project has also established the naming convention for vendor specific builtin functions.

The general naming follows the RISC-V convention and is:
```
__builtin_riscv_<vendor>_<name>
```

OpenHW CORE-V processors, will therefore use the general prefix
```
__builtin_riscv_cv_<name>
```

At the time of writing, OpenHW defines eight instruction set extensions, some with large numbers of instructions.  To avoid congestion and confusion, CORE-V will also included the ISA extension name in the builtin name.
```
__builtin_riscv_cv_<isaext>_<name>
```

Where instructions completely rewrite the destination register, that value is returned as a result.  Where instructions only partially modify the destination register, the value to be modified is passed as an argument and the modified value returned as a result.

In their basic form, the builtin names need to be suitable for C and C++, which means we cannot use overloading of function names.  For some instructions there is a simple one-to-one mapping. So the SIMD instruction to add two vectors of half words:
```
cv.add.h     rd, rs1, rs2
```
maps to the builtin function
```
uint32_t __builtin_riscv_cv_simd_add_h (uint32_t, uint32_t)
```

However we can use GCC to sort out between short and long forms of instructions to reduce the number of builtin functions we need.  For example to add a scalar to  a vector of half words we have in the SIMD ISA extension the general purpose instruction:
```
cv.add.sc.h   rd, rs1, rs2
```
but where rs2 is a small (6 bit) constant, we also have
```
cv.add.sci.h  rd, rs1, imm6
```
We do not need two builtins for these instructions, instead we can have:
```
uint32_t __builtin_riscv_cv_simd_add_sc_h (uint32_t, int16_t)
```

GCC can work out whether the second argument is a constant which fits in 6 bits, and if so generate the `sci` version of the opcode, otherwise it can generate the `sc` version.

We use this general approach to create the basic set of SIMD builtin functions.

### Using vector types

For the SIMD extension, this could be an alternative for the basic set of builtins.  C and C++ allow you to define explicit vector types, and this can make for cleaner builtins.  We can define
```C
typedef int16_t v2hi __attribute__ ((vector_size (4)))
typedef int8_t  v4qi __attribute__ ((vector_size (4)))
```
for vectors of half words and vectors bytes respectively.  We can then make the types or arguments and results explicit, so our two functions above become:
```
v2hi __builtin_riscv_cv_add_h (v2hi, v2hi)
v2hi __builtin_riscv_cv_add_sc_h (v2hi, int16_t)
```

While this is cleaner semantically, it makes no difference to the number of functions needed, or code generated. A second issue is if future SIMD instructions were to support vectors of 4-bit of 2-bit values, this scheme would not work, since it cannot go smaller than the minimal addressable unit, which for RISC-V in general is 8-bits.

Our recommendation is therefore that we do not adopt this.

### Support for 64-bit and 32-bit

There is no problem reusing the same names for 64-bit variants, for example
```
int32_t __builtin_riscv_cv_mac_mac (int32_t x, int32_t y, int32_t z)
int64_t __builtin_riscv_cv_mac_mac (int64_t x, int64_t y, int64_t z)
```
This is not _overloading_ in the C++ space, since for any particular compilation, only one will be defined according to whether the compilation target is 32- or 64-bit.

This document gives a detailed description of the 32-bit variants, and then a simple list of the 64-bit variants.

### Existing builtin functions

Where an existing generic GCC builtin function exists, this is reused for CORE-V.  This is the standard arrangement for GCC, which we must follow if we are to be upstreamed in the future.

### Ordering of arguments

The ordering of arguments to builtin functions draws on equivalent standard C library functions.  Thus we have
```
int32_t __builtin_riscv_cv_mac_mac (int32_t x, int32_t y, int32_t z)
```

to compute `x * y + z`, mirroring the argument/result format of the standard C `fma` function.

## Listing of hardware loop builtins (`xcvhwlp`)

There are no builtin functions for hardware loops.

## Listing of multiply-accumulate builtins (`xcvmac`)

### 32-bit x 32-bit (32-bit cores)

**Applicability.** 32-bit cores.

The ordering of arguments mirrors the standard C function `fma`

For 32-bit architectures, we have the following instructions providing 32-bit x 32-bit multiply-accumulate.

#### `int32_t __builtin_riscv_cv_mac_mac (int32_t x, int32_t y, int32_t z)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`

_Generated assembler:_
```gas
        cv.mac  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_mac_msu (int32_t x, int32_t y, int32_t z)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`

_Generated assembler:_
```gas
        cv.msu  rD,rs1,rs2
```

### 64-bit x 64-bit multiply-accumulate

**Applicability.** 64-bit cores.

It is anticipated that 64-bit cores may wish to define 64-bit x 64-bit operations by analogy to the 32-bit x 32-bit operations on 32-bit cores.  No builtins are defined yet for such operations.

### 16-bit x 16-bit multiplication

**Applicability.** 32-bit cores

Even though these are 16-bit operands, we pass them as 32-bit, because the different instructions select different 16-bit words within the 32-bit word.  The 32-bit words are always passed unsigned, even when the operations are signed, since we are extracting half words, from a 32-bit entity.  However the results from signed operations are 32-bit signed values.

#### `uint32_t __builtin_riscv_cv_mac_muluN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.muluN  rD,rs1,rs2,Is3
```

#### `uint32_t __builtin_riscv_cv_mac_mulhhuN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.mulhhuN   rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_mulsN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.mulsN     rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_mulhhsN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.mulshsN   rD,rs1,rs2,Is3
```

#### `uint32_t __builtin_riscv_cv_mac_muluRN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.muluRN    rD,rs1,rs2,Is3
```

#### `uint32_t __builtin_riscv_cv_mac_mulhhuRN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.mulhhuRN  rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_mulsRN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.mulsRN    rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_mulhhsRN (uint32_t x, uint32_t y, const uint8_t shft)`

_Argument/result mapping:_
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.mulhhsRN  rD,rs1,rs2,Is3
```

### 32-bit x 32-bit multiplication (64-bit cores)

**Applicability.** 64-bit cores.

It is anticipated that 64-bit cores may wish to define 32-bit x 32-bit operations by analogy to the 16-bit x 16-bit operations on 32-bit cores.  No builtins are defined yet for such operations.

### 16-bit x 16-bit multiply-accumulate

**Applicability.** 32-bit cores.

Even though these are 16-bit operands, we pass them as 32-bit, because the different instructions select different 16-bit words within the 32-bit word.  The 32-bit words are always passed unsigned, even when the operations are signed, since we are extracting half words, from a 32-bit entity.  However the existing value passed in, and the results from signed operations are 32-bit signed values.

As with the 32-bit x 32-bit multiply-accumulate, the ordering of arguments mirrors the standard C function, `fma`.

#### `uint32_t __builtin_riscv_cv_mac_macuN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.macuN  rD,rs1,rs2,Is3
```

#### `uint32_t __builtin_riscv_cv_mac_machhuN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.machhuN  rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_macsN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.macsN  rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_machhsN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.machhsN  rD,rs1,rs2,Is3
```

#### `uint32_t __builtin_riscv_cv_mac_macuRN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.macuRN  rD,rs1,rs2,Is3
```

#### `uint32_t __builtin_riscv_cv_mac_machhuRN (uint32_t x, uint32_t y, uint32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.machhuRN  rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_macsRN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.macsRN  rD,rs1,rs2,Is3
```

#### `int32_t __builtin_riscv_cv_mac_machhsRN (uint32_t x, uint32_t y, int32_t z, const uint8_t shft)`

_Argument/result mapping:_
- result, z: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

_Generated assembler:_
```gas
        cv.machhsRN  rD,rs1,rs2,Is3
```

### 32-bit x 32-bit multiply-accumulate (64-bit cores)

**Applicability.** 64-bit cores.

It is anticipated that 64-bit cores may wish to define 32-bit x 32-bit operations by analogy to the 16-bit x 16-bit operations on 32-bit cores.  No builtins are defined yet for such operations.

## Listing of immediate branch builtins (`xcvbi`)

There are no builtin functions for immediate branching.

## Listing of post-indexed and register-indexed memory access builtins (`xcvmem`)

There are no builtins for post-indexed and register-indexed memory access.

## Listing of miscellaneous ALU builtins (`xcvalu`)

### ALU builtins for 32-bit cores

**Applicability.** 32-bit cores.

**Note:** A number of functions return boolean values.  This specification follows the C convention, where boolean values use the `int` type.

#### `int __builtin_abs (int j)`

_Argument/result mapping:_
- result `rD`
- j: `rs1`

_Generated assembler:_
```gas
        cv.abs  rD,rs1
```

**Note:** This is a standard GCC builtin.

#### `int __builtin_riscv_cv_alu_slet (int32_t  i, int32_t  j)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_
```gas
        cv.slet  rD,rs1,rs2
```

#### `int __builtin_riscv_cv_alu_sletu (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_
```gas
        cv.sletu  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_alu_min (int32_t i, int32_t j)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_
```gas
        cv.min  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_alu_minu (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_
```gas
        cv.minu  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_alu_max (int32_t i, int32_t j)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_
```gas
        cv.max  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_alu_maxu (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_
```gas
        cv.maxu  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_alu_exths (int16_t i)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`

_Generated assembler:_
```gas
        cv.exths  rD,rs1
```

#### `uint32_t __builtin_riscv_cv_alu_exthz (uint16_t i)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`

_Generated assembler:_
```gas
        cv.exthz  rD,rs1
```

#### `int32_t __builtin_riscv_cv_alu_extbs (int8_t i)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`

_Generated assembler:_
```gas
        cv.extbs  rD,rs1
```

#### `uint32_t __builtin_riscv_cv_alu_extbz (uint8_t)`

_Argument/result mapping:_
- result `rD`
- i: `rs1`

_Generated assembler:_
```gas
        cv.extbz  rD,rs1
```

#### `int32_t __builtin_riscv_cv_alu_clip (int32_t i, uint32_t j)`

_Argument/result mapping:_

Case a) where j is constant and can be represented as `(2^(Is2-1)-1)`, where `Is2` is a 5-bit unsigned value
- result: `rD`
- i: `rs1`
- j: `Is2` (5-bit unsigned value)

or case b)

- result: `rD`
- i: `rs1`
- j: `rs2`.

**Note:** In case a), `Is2 = log2 (j + 1) + 1`, where `j + 1` is an exact power of 2 up to 2^30.

_Generated assembler:_

Case a)
```gas
        cv.clip  rD,rs1,Is2
```
or case b)
```gas
        cv.clipr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_alu_clipu (uint32_t i, uint32_t j)`

_Argument/result mapping:_

Case a) where j is constant and can be represented as `(2^(Is2-1)-1)`, where `Is2` is a 5-bit unsigned value
- result: `rD`
- i: `rs1`
- j: `Is2` (5-bit unsigned value)

or case b)

- result: `rD`
- i: `rs1`
- j: `rs2`.

**Note:** In case a), `Is2 = log2 (j + 1) + 1`, where `j + 1` is an exact power of 2 up to 2^30.

_Generated assembler:_

Case a)
```gas
        cv.clipu  rD,rs1,Is2
```
or case b)
```gas
        cv.clipur  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_alu_addN (int32_t x, int32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.addN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.addNr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_alu_adduN (uint32_t x, uint32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.adduN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.adduNr  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_alu_addRN (int32_t x, int32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.addRN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.addRNr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_alu_adduRN (uint32_t x, uint32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.adduRN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.adduRNr  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_alu_subN (int32_t x, int32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.subN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.subNr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_alu_subuN (uint32_t x, uint32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.subuN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.subuNr  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_alu_subRN (int32_t x, int32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.subRN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.subRNr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_alu_subuRN (uint32_t x, uint32_t y, uint8_t shft)`

_Argument/result mapping:_

Case a) shft is a constant in the range `0 <= shft <= 31`
- result: `rD`
- x: `rs1`
- y: `rs2`
- shft: `Is3` (5-bit unsigned value)

or case b)
- result, x: `rD`
- y: `rs1`
- shft: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.subuRN  rD,rs1,rs2,Is3
```
or case b)
```gas
        cv.subuRNr  rD,rs1,rs2
```

### ALU builtins for 64-bit cores

**Applicability.** 64-bit cores.

It is anticipated that 64-bit cores may wish to define ALU operations by analogy to the ALU operations on 32-bit cores.

## Listing of PULP 8/16-bit SIMD builtins (`xcvsimd`)

### SIMD ALU operations (32-bit)

**Applicability.** 32-bit cores.

**Note.** SIMD registers are always specified as uint32_t, even though the components of the vector may be treated as signed.

#### `uint32_t __builtin_riscv_cv_simd_add_h (uint32_t i, uint32_t j, const uint8_t shft)`

The half word vector `add` instruction comes in variants which shift by 0, 1, 2 or 3, in order to divide by 1, 2, 4 or 8.  The first of these maps to the standard SIMD half word vector addition, the rest to the various forms of the SIMD complex-number additon.

_Argument/result mapping:_

Case a) shft is zero
- result: `rD`
- i: `rs1`
- j: `rs2`
- shft: unused

or case b) shft is non-zero
- result: `rD`
- i: `rs1`
- j: `rs2`
- shft: selector for which SIMD complex-number addition to use.

_Generated assembler:_

Case a)
```gas
        cv.add.h  rD,rs1,rs2
```
or case b)
```gas
        cv.add.div2  rD,rs1,rs2   ;; shft = 1
        cv.add.div4  rD,rs1,rs2   ;; shft = 2
        cv.add.div8  rD,rs1,rs2   ;; shft = 3
```

#### `uint32_t __builtin_riscv_cv_simd_add_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.add.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_add_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.add.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.add.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_add_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.add.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.add.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sub_h (uint32_t i, uint32_t j, const uint8_t shft)`

The half word vector `sub` instruction comes in variants which shift by 0, 1, 2 or 3, in order to divide by 1, 2, 4 or 8.  The first of these maps to the standard SIMD half word vector subtraction, the rest to the various forms of the SIMD complex-number subtraction.

_Argument/result mapping:_

Case a) shft is zero
- result: `rD`
- i: `rs1`
- j: `rs2`
- shft: unused

or case b) shft is non-zero
- result: `rD`
- i: `rs1`
- j: `rs2`
- shft: selector for which SIMD complex-number subtraction to use.

_Generated assembler:_

Case a)
```gas
        cv.sub.h  rD,rs1,rs2
```
or case b)
```gas
        cv.sub.div2  rD,rs1,rs2   ;; shft = 1
        cv.sub.div4  rD,rs1,rs2   ;; shft = 2
        cv.sub.div8  rD,rs1,rs2   ;; shft = 3
```

#### `uint32_t __builtin_riscv_cv_simd_sub_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.sub.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sub_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.sub.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.sub.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sub_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.sub.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.sub.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avg_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.avg.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avg_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.avg.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avg_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.avg.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.avg.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avg_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.avg.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.avg.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avgu_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.avgu.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avgu_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.avgu.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avgu_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.avgu.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.avgu.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_avgu_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.avgu.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.avgu.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_min_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.min.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_min_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.min.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_min_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.min.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.min.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_min_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.min.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.min.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_minu_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.minu.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_minu_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.minu.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_minu_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.minu.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.minu.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_minu_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.minu.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.minu.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_max_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.max.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_max_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.max.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_max_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.max.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.max.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_max_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.max.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.max.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_maxu_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.maxu.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_maxu_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.maxu.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_maxu_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.maxu.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.maxu.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_maxu_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.maxu.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.maxu.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_srl_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.srl.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_srl_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.srl.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_srl_sc_h (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.srl.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.srl.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_srl_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.srl.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.srl.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sra_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.sra.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sra_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.sra.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sra_sc_h (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.sra.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.sra.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sra_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.sra.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.sra.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sll_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.sll.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sll_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.sll.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sll_sc_h (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.sll.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.sll.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sll_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.sll.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.sll.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_or_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.or.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_or_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.or.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_or_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.or.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.or.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_or_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.or.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.or.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_xor_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.xor.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_xor_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.xor.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_xor_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.xor.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.xor.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_xor_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.xor.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.xor.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_and_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.and.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_and_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.and.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_and_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.and.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.and.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_and_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.and.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.and.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_abs_h (uint32_t i)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`

_Generated assembler:_

```gas
        cv.abs.h  rD,rs1
```

#### `uint32_t __builtin_riscv_cv_simd_abs_b (uint32_t i)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`

_Generated assembler:_

```gas
        cv.abs.b  rD,rs1
```

### SIMD ALU operations (64-bit)

**Applicability.** 64-bit cores.

At the time of writing the SIMD architecture for 64-bit is not defined, so no builtin functions are specified.

### SIMD bit manipulation operations (32-bit)

**Applicability.** 32-bit cores.

#### `int32_t __builtin_riscv_cv_simd_extract_h (uint32_t i, const uint8_t sel)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- sel: `Is2` (1-bit)

_Generated assembler:_

```gas
        cv.extract.h  rD,rs1,Is2
```

#### `int32_t __builtin_riscv_cv_simd_extract_b (uint32_t i, const uint8_t sel)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- sel: `Is2` (2-bit)

_Generated assembler:_

```gas
        cv.extract.b  rD,rs1,Is2
```

#### `uint32_t __builtin_riscv_cv_simd_extractu_h (uint32_t i, const uint8_t sel)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- sel: `Is2` (1-bit)

_Generated assembler:_

```gas
        cv.extractu.h  rD,rs1,Is2
```

#### `uint32_t __builtin_riscv_cv_simd_extractu_b (uint32_t i, const uint8_t sel)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- sel: `Is2` (2-bit)

_Generated assembler:_

```gas
        cv.extractu.b  rD,rs1,Is2
```

#### `uint32_t __builtin_riscv_cv_simd_insert_h (uint32_t i, uint32_t j, const uint8_t sel)`

_Argument/result mapping:_
- result, j: `rD`
- i: `rs1`
- sel: `Is2` (1-bit)

_Generated assembler:_

```gas
        cv.insert.h  rD,rs1,Is2
```

#### `uint32_t __builtin_riscv_cv_simd_insert_b (uint32_t i, uint32_t j, const uint8_t sel)`

_Argument/result mapping:_
- result, j: `rD`
- i: `rs1`
- sel: `Is2` (2-bit)

_Generated assembler:_

```gas
        cv.insert.b  rD,rs1,Is2
```

### SIMD bit manipulation operations (64-bit)

**Applicability.** 64-bit cores.

At the time of writing the SIMD architecture for 64-bit is not defined, so no builtin functions are specified.

### SIMD dot product operations (32-bit)

**Note.*** The documentation of these instructions uses `op2`, to refer to `rs2` for vector operations and `rs2` or `Is2` for scalar replication instructions.

**Applicability.** 32-bit cores.

#### `uint32_t __builtin_riscv_cv_simd_dotup_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotup.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_dotup_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotup.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_dotup_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotup.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.dotup.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_dotup_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotup.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.dotup.sc.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotusp_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotusp.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotusp_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotusp.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotusp_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotusp.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.dotusp.sc.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotusp_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotusp.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.dotusp.sc.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotsp_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotsp.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotsp_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotsp.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotsp_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotsp.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.dotsp.sc.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_dotsp_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotsp.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.dotsp.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sdotup_h (uint32_t i, uint32_t j, uint32_t k)`

_Argument/result mapping:_
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotup.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sdotup_b (uint32_t i, uint32_t j, uint32_t k)`

_Argument/result mapping:_
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotup.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sdotup_sc_h (uint32_t i, uint16_t j, uint32_t k)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result, k: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotup.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.dotup.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_sdotup_sc_b (uint32_t i, uint8_t j, uint32_t k)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result, k: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotup.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.dotup.sc.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotusp_h (uint32_t i, uint32_t j, int32_t k)`

_Argument/result mapping:_
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotusp.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotusp_b (uint32_t i, uint32_t j, int32_t k)`

_Argument/result mapping:_
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotusp.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotusp_sc_h (uint32_t i, int16_t j, int32_t k)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result, k: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotusp.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.dotusp.sc.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotusp_sc_b (uint32_t i, int8_t j, int32_t k)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result, k: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotusp.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.dotusp.sc.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotsp_h (uint32_t i, uint32_t j, int32_t k)`

_Argument/result mapping:_
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotsp.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotsp_b (uint32_t i, uint32_t j, int32_t k)`

_Argument/result mapping:_
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.dotsp.b  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotsp_sc_h (uint32_t i, int16_t j, int32_t k)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result, k: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotsp.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.dotsp.sc.h  rD,rs1,rs2
```

#### `int32_t __builtin_riscv_cv_simd_sdotsp_sc_b (uint32_t i, int8_t j, int32_t k)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result, k: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.dotsp.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.dotsp.sc.b  rD,rs1,rs2
```

### SIMD dot product operations (64-bit)

**Applicability.** 64-bit cores.

At the time of writing the SIMD architecture for 64-bit is not defined, so no builtin functions are specified.

### SIMD shuffle and pack operations (32-bit)

**Applicability.** 32-bit cores.

#### `uint32_t __builtin_riscv_cv_simd_shuffle_h (uint32_t  i, uint32_t flgs)`

_Argument/result mapping:_

- result: `rD`
- i: `rs1`
- flgs: `rs2`

_Generated assembler:_

```gas
        cv.shuffle.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_shuffle_sci_h (uint32_t i, const uint8_t flgs)`

_Argument/result mapping:_

- result: `rD`
- i: `rs1`
- flgs: `Is2` (2-bit unsigned value)

_Generated assembler:_

```gas
        cv.shuffle.sci.h  rD,rs1,Is2
```

#### `uint32_t __builtin_riscv_cv_simd_shuffle_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_

- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.shuffle.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_shuffle_sci_b (uint32_t i, const uint8_t flgs)`

_Argument/result mapping:_

- result, k: `rD`
- i: `rs1`
- flgs[5:0]: `Is2` (6-bit unsigned value)

_Generated assembler:_

```gas
        cv.shuffleI0.sci.b  rD,rs1,Is2   ;; flgs[7:6] = 0
        cv.shuffleI1.sci.b  rD,rs1,Is2   ;; flgs[7:6] = 1
        cv.shuffleI2.sci.b  rD,rs1,Is2   ;; flgs[7:6] = 2
        cv.shuffleI3.sci.b  rD,rs1,Is2   ;; flgs[7:6] = 3
```

#### `uint32_t __builtin_riscv_cv_simd_shuffle2_h (uint32_t i, uint32_t flgs, uint32_t k)`

_Argument/result mapping:_

- result, k: `rD`
- i: `rs1`
- flgs: `rs2`

_Generated assembler:_

```gas
        cv.shuffle2.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_shuffle2_b (uint32_t i, uint32_t flgs, uint32_t k)`

_Argument/result mapping:_

- result, k: `rD`
- i: `rs1`
- flgs: `rs2`

_Generated assembler:_

```gas
        cv.shuffle2.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_pack (uint32_t i, uint32_t j)`

_Argument/result mapping:_

- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.pack  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_pack_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_

- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.pack.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_packhi_b (uint32_t i, uint32_t j, uint32_t k)`

_Argument/result mapping:_

- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.packhi.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_packlo_b (uint32_t i, uint32_t j, uint32_t k)`

_Argument/result mapping:_

- result, k: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.packlo.b  rD,rs1,rs2
```

### SIMD shuffle and pack operations (64-bit)

**Applicability.** 64-bit cores.

At the time of writing the SIMD architecture for 64-bit is not defined, so no builtin functions are specified.

### SIMD comparison operations (32-bit)

**Applicability.** 32-bit cores.

#### `uint32_t __builtin_riscv_cv_simd_cmpeq_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpeq.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpeq_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpeq.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpeq_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpeq.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpeq.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpeq_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpeq.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpeq.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpne_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpne.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpne_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpne.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpne_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpne.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpne.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpne_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpne.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpne.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgt_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpgt.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgt_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpgt.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgt_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpgt.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpgt.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgt_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpgt.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpgt.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpge_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpge.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpge_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpge.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpge_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpge.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpge.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpge_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpge.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpge.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmplt_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmplt.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmplt_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmplt.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmplt_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmplt.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmplt.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmplt_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmplt.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmplt.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmple_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmple.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmple_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmple.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmple_sc_h (uint32_t i, int16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmple.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmple.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmple_sc_b (uint32_t i, int8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `-32 <= j <= 31`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit signed value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmple.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmple.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgtu_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpgtu.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgtu_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpgtu.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgtu_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpgtu.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpgtu.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgtu_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpgtu.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpgtu.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgeu_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpgeu.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgeu_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpgeu.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgeu_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpgeu.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpgeu.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpgeu_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpgeu.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpgeu.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpltu_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpltu.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpltu_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpltu.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpltu_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpltu.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpltu.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpltu_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpltu.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpltu.sc.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpleu_h (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpleu.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpleu_b (uint32_t i, uint32_t j)`

_Argument/result mapping:_
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.cmpleu.b  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpleu_sc_h (uint32_t i, uint16_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpleu.sci.h  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpleu.sc.h  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_simd_cmpleu_sc_b (uint32_t i, uint8_t j)`

_Argument/result mapping:_

Case a) j is a constant in the range `0 <= j <= 63`
- result: `rD`
- i: `rs1`
- j: `Is2` (6-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.cmpleu.sci.b  rD,rs1,Is2
```
or case b)
```gas
        cv.cmpleu.sc.b  rD,rs1,rs2
```

### SIMD comparison operations (64-bit)

At the time of writing the SIMD architecture for 64-bit is not defined, so no builtin functions are specified.

**Applicability.** 64-bit cores.

### SIMD complex number operations (32-bit)

**Applicability.** 32-bit cores.

**Note.** The complex addition and subtraction operations are specialized versions of the SIMD half word addition and subraction described in [SIMD ALU operations (32-bit)](#simd-alu-operations-32-bit) above.

#### `uint32_t __builtin_riscv_cv_simd_cplxmul_r (uint32_t i, uint32_t j, uint32_t k, const uint8_t shft)`

This instruction comes in variants which shift by 15, 16, 17 or 18, in order to divide the lower half word of `rD` by 1, 2, 4 or 8.

_Argument/result mapping:_

- result, k: `rD`
- i: `rs1`
- j: `rs2`
- shft: unused

_Generated assembler:_

```gas
        cv.cplxmul.r       rD,rs1,rs2   ;; shft = 15
        cv.cplxmul.r.div2  rD,rs1,rs2   ;; shft = 16
        cv.cplxmul.r.div4  rD,rs1,rs2   ;; shft = 17
        cv.cplxmul.r.div8  rD,rs1,rs2   ;; shft = 18
```

#### `uint32_t __builtin_riscv_cv_simd_cplxmul_i (uint32_t i, uint32_t j, uint32_t k, const uint8_t shft)`

This instruction comes in variants which shift by 15, 16, 17 or 18, in order to divide the upper half word of `rD` by 1, 2, 4 or 8.

_Argument/result mapping:_

- result, k: `rD`
- i: `rs1`
- j: `rs2`
- shft: unused

_Generated assembler:_

```gas
        cv.cplxmul.i       rD,rs1,rs2   ;; shft = 15
        cv.cplxmul.i.div2  rD,rs1,rs2   ;; shft = 16
        cv.cplxmul.i.div4  rD,rs1,rs2   ;; shft = 17
        cv.cplxmul.i.div8  rD,rs1,rs2   ;; shft = 18
```

#### `uint32_t __builtin_riscv_cv_simd_cplxconj (uint32_t i)`

_Argument/result mapping:_

- result: `rD`
- i: `rs1`

_Generated assembler:_

```gas
        cv.cplxconj  rD,rs1
```

#### `uint32_t __builtin_riscv_cv_simd_subrotmj (uint32_t  i, uint32_t j, const uint8_t shft)`

This instruction comes in variants which shift by 0, 1, 2 or 3, in order to divide the upper half word of `rD` by 1, 2, 4 or 8.

_Argument/result mapping:_

- result: `rD`
- i: `rs1`
- j: `rs2`
- shft: unused

_Generated assembler:_

```gas
        cv.subrotmj       rD,rs1,rs2   ;; shft = 0
        cv.subrotmj.div2  rD,rs1,rs2   ;; shft = 1
        cv.subrotmj.div4  rD,rs1,rs2   ;; shft = 2
        cv.subrotmj.div8  rD,rs1,rs2   ;; shft = 3
```

### SIMD complex number operations (64-bit)

**Applicability.** 64-bit cores.

At the time of writing the SIMD architecture for 64-bit is not defined, so no builtin functions are specified.

## Listing of PULP bit manipulation builtins (`xcvbitmanip`)

### PULP bit manipulation builtins for 32-bit cores

Some of these functions modify the destination register, so need the value passed by reference, although for convenience the modfied value is returned as result.

#### `int32_t __builtin_riscv_cv_bitmanip_extract (uint32_t  i, uint16_t range)`

Case a) range is a constant
- result: `rD`
- i: `rs1`
- range[4:0]: `Is2` (5-bit unsigned value)
- range[9:5]: `Is3` (5-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- range: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.extract  rD,rs1,Is2,Is3
```
or case b)
```gas
        cv.extractr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_bitmanip_extractu (uint32_t, uint8_t, uint8_t)`

Case a) range is a constant
- result: `rD`
- i: `rs1`
- range[4:0]: `Is2` (5-bit unsigned value)
- range[9:5]: `Is3` (5-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- range: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.extractu  rD,rs1,Is2,Is3
```
or case b)
```gas
        cv.extractur  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_bitmanip_insert(uint32_t i, uint16_t range, uint32_t  k)`

Case a) range is a constant and `(range[9:5] + range [4:0]) <= 32` (TBC)
- result, k: `rD`
- i: `rs1`
- range[4:0]: `Is2` (5-bit unsigned value)
- range[9:5]: `Is3` (5-bit unsigned value)

or case b)
- result, k: `rD`
- i: `rs1`
- range: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.insert  rD,rs1,Is2,Is3
```
or case b)
```gas
        cv.insertr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_bitmanip_bclr (uint32_t i, uint16_t range)`

Case a) range is a constant
- result: `rD`
- i: `rs1`
- range[4:0]: `Is2` (5-bit unsigned value)
- range[9:5]: `Is3` (5-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- range: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.bclr  rD,rs1,Is2,Is3
```
or case b)
```gas
        cv.bclrr  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_bitmanip_bset (uint32_t i, uint16_t range)`

Case a) range is a constant
- result: `rD`
- i: `rs1`
- range[4:0]: `Is2` (5-bit unsigned value)
- range[9:5]: `Is3` (5-bit unsigned value)

or case b)
- result: `rD`
- i: `rs1`
- range: `rs2`

_Generated assembler:_

Case a)
```gas
        cv.bset  rD,rs1,Is2,Is3
```
or case b)
```gas
        cv.bsetr  rD,rs1,rs2
```

#### `uint8_t __builtin_riscv_cv_bitmanip_ff1 (uint32_t i)`

- result: `rD`
- i: `rs1`

_Generated assembler:_

```gas
        cv.ff1  rD,rs1
```

#### `uint8_t __builtin_riscv_cv_bitmanip_fl1 (uint32_t i)`

- result: `rD`
- i: `rs1`

_Generated assembler:_

```gas
        cv.fl1  rD,rs1
```

#### `uint8_t __builtin_riscv_cv_bitmanip_clb (uint32_t i)`

- result: `rD`
- i: `rs1`

_Generated assembler:_

```gas
        cv.clb  rD,rs1
```

#### `uint8_t __builtin_riscv_cv_bitmanip_cnt (uint32_t i)`

- result: `rD`
- i: `rs1`

_Generated assembler:_

```gas
        cv.cnt  rD,rs1
```

#### `uint32_t __builtin_riscv_cv_bitmanip_ror (uint32_t i, uint32_t j)`

- result: `rD`
- i: `rs1`
- j: `rs2`

_Generated assembler:_

```gas
        cv.ror  rD,rs1,rs2
```

#### `uint32_t __builtin_riscv_cv_bitmanip_bitrev (uint32_t i, uint8_t pts, uint8_t radix)`

- result: `rD`
- i: `rs1`
- pts: `Is2` (5-bit unsigned integer)
- radix: `Is3[0:1] (2-bit unsigned integer)

_Generated assembler: (TBC)_

```gas
        cv.bitrev  rD,rs1,Is2,Is3
```

### PULP bit manipulation builtins for 64-bit cores

**Applicability.** 64-bit cores.

At the time of writing the bit manipulation architecture for 64-bit is not defined, so no builtin functions are specified.

## Listing of event load word builtins (`xcvelw`)

### Event load word builtins for 32-bit cores

#### `uint32_t __builtin_riscv_cv_elw_elw (uint32_t *loc)`

- result: `rD`
- loc: `Imm(rs1)` (`Imm` and `rs1` determined by the compiler.

_Generated assembler:_

```gas
        cv.elw  rD,Imm(rs1)
```

### Event load word builtins for 64-bit core

**Applicability.** 64-bit cores.

At the time of writing event load word for 64-bit is not defined, so no builtin functions are specified.

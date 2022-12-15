### CORE-V builtin names

## History

| Date        | Version | Notes                                                 |
| :---------- | :------ | :---------------------------------------------------- |
| 15 Dec 2022 | 0.1     | First draft for review.                               |

## Executive Summary

We need to define our builtin names for the 200+ instructions in the various CORE-V ISA extensions.

## Design principles

The general naming follows the RISC-V convention and is:
```
__builtin_corev_<name>
```

Where instructions completely rewrite the destination register, that value is returned as a result.  Where instructions only partially modify the destination register, the value to be modified is passed in by reference _and_ returned a result.

In their basic form, the builtin names need to be suitable for C and C++, which means we cannot use overloading of function names.  For some instructions there is a simple one-to-one mapping. So the SIMD instruction to add two vectors of half words:
```
cv.add.h     rd, rs1, rs2
```
maps to the builtin function
```
uint32_t __builtin_corev_add_h (uint32_t, uint32_t)
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
uint32_t __builtin_corev_add_sc_h (uint32_t, int16_t)
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
v2hi __builtin_corev_add_h (v2hi, v2hi)
v2hi __builtin_corev_add_sc_h (v2hi, int16_t)
```

While this is cleaner semantically, it makes no difference to the number of functions needed, or code generated. A second issue is if future SIMD instructions were to support vectors of 4-bit of 2-bit values, this scheme would not work, since it cannot go smaller than the minimal addressable unit, which for RISC-V in general is 8-bits.

Our recommendation is therefore that we do not adopt this.

## Listing of hardware loop builtins (`xcvhwlp`)

There are no builtin functions for hardware loops.

## Listing of multiply-accumulate builtins (`xcvmac`)

### 32-bit x 32-bit multiply-accumulate

**Note:** MAC instructions require the destination to be passed in by reference.

```
int32_t __builtin_corev_mac (int32_t *rd, int32_t, int32_t)
int32_t __builtin_corev_mac (int32_t *rd, int32_t, int32_t)
```

### 16-bit x 16-bit multiplication

Even though these are 16-bit operands, we pass them as 32-bit, because the different instructions select different 16-bit words within the 32-bit word.

```
uint32_t __builtin_corev_muluN (uint32_t, uint32_t, uint8_t)
uint32_t __builtin_corev_mulhhuN (uint32_t, uint32_t, uint8_t)

int32_t __builtin_corev_mulsN (int32_t, int32_t, uint8_t)
int32_t __builtin_corev_mulhhsN (int32_t, int32_t, uint8_t)

uint32_t __builtin_corev_muluRN (uint32_t, uint32_t, uint8_t)
uint32_t __builtin_corev_mulhhuRN (uint32_t, uint32_t, uint8_t)

int32_t __builtin_corev_mulsRN (int32_t, int32_t, uint8_t)
int32_t __builtin_corev_mulhhsRN (int32_t, int32_t, uint8_t)
```

### 16-bit x 16-bit multiply-accumulate

Even though these are 16-bit operands, we pass them as 32-bit, because the different instructions select different 16-bit words within the 32-bit word. **Note:** MAC instructions require the destination to be passed in by reference.

```
uint32_t __builtin_corev_macuN (uint32_t *, uint32_t, uint32_t, uint8_t)
uint32_t __builtin_corev_machhuN (uint32_t *, uint32_t, uint32_t, uint8_t)

int32_t __builtin_corev_macsN (int32_t *, int32_t, int32_t, uint8_t)
int32_t __builtin_corev_machhsN (int32_t *, int32_t, int32_t, uint8_t)

uint32_t __builtin_corev_macuRN (uint32_t *, uint32_t, uint32_t, uint8_t)
uint32_t __builtin_corev_machhuRN (uint32_t *, uint32_t, uint32_t, uint8_t)

int32_t __builtin_corev_macsRN (int32_t *, int32_t, int32_t, uint8_t)
int32_t __builtin_corev_machhsRN (int32_t *, int32_t, int32_t, uint8_t)
```

## Listing of immediate branch builtins (`xcvbi`)

There are no builtin functions for immediate branching.

## Listing of post-indexed and register-indexed memory access builtins (`xcvmem`)

These functions pass the index by reference, to allow the incremented index to be returned. Depending on how the first argument is passed, these will generate register-immediate or register-register loads with post-increment.

```
int8_t __builtin_corev_lb_pi (uint32_t *, int32_t)
uint8_t __builtin_corev_lbu_pi (uint32_t *, int32_t)
int16_t __builtin_corev_lh_pi (uint32_t *, int32_t)
uint16_t __builtin_corev_lhu_pi (uint32_t *, int32_t)
uint32_t __builtin_corev_lw_pi (uint32_t *, int32_t)

int8_t __builtin_corev_lb_rr (uint32_t *, int32_t)
uint8_t __builtin_corev_lbu_rr (uint32_t *, int32_t)
int16_t __builtin_corev_lh_rr (uint32_t *, int32_t)
uint16_t __builtin_corev_lhu_rr (uint32_t *, int32_t)
uint32_t __builtin_corev_lw_rr (uint32_t *, int32_t)

int8_t __builtin_corev_sb_pi (uint32_t *, uint32_t, int32_t)
int16_t __builtin_corev_sh_pi (uint32_t *, uint32_t, int32_t)
uint32_t __builtin_corev_sw_pi (uint32_t *, uint32_t, int32_t)

int8_t __builtin_corev_sb_rr (uint32_t *, uint32_t, int32_t)
int16_t __builtin_corev_sh_rr (uint32_t *, uint32_t, int32_t)
uint32_t __builtin_corev_sw_rr (uint32_t *, uint32_t, int32_t)
```

## Listing of miscellaneous ALU builtins (`xcvalu`)

```
uint32_t __builtin_corev_abs (int32_t rs)
int __builtin_corev_slet (int32_t, int32_t)
int __builtin_corev_sletu (uint32_t, uint32_t)
int32_t __builtin_corev_min (int32_t, int32_t)
uint32_t __builtin_corev_minu (uint32_t, uint32_t)
int32_t __builtin_corev_max (int32_t, int32_t)
uint32_t __builtin_corev_maxu (uint32_t, uint32_t)
int32_t __builtin_corev_exths (int16_t)
uint32_t __builtin_corev_exthz (uin16_t)
int32_t __builtin_corev_extbs (uint8_t)
uint32_t __builtin_corev_extbz (int8_t)
int32_t __builtin_corev_clip (int32_t, uint8_t)
uint32_t __builtin_corev_clipu (uint32_t, uint8_t)
int32_t __builtin_corev_clipr (int32_t, int32_t)
uint32_t __builtin_corev_clipur (uint32_t, uint32_t)
int32_t __builtin_corev_addN (int32_t, int32_t, uint8_t)
uint32_t __builtin_corev_adduN (uint32_t, uint32_t, uint8_t)
int32_t __builtin_corev_addRN (int32_t, int32_t, uint8_t)
uint32_t __builtin_corev_adduRN (uint32_t, uint32_t, uint8_t)
int32_t __builtin_corev_subN (int32_t, int32_t, uint8_t)
uint32_t __builtin_corev_subuN (uint32_t, uint32_t, uint8_t)
int32_t __builtin_corev_subRN (int32_t, int32_t, uint8_t)
uint32_t __builtin_corev_subuRN (uint32_t, uint32_t, uint8_t)
int32_t __builtin_corev_addNr (int32_t, uint8_t)
uint32_t __builtin_corev_adduNr (uint32_t, uint8_t)
int32_t __builtin_corev_addRNr (int32_t, uint8_t)
uint32_t __builtin_corev_adduRNr (uint32_t, uint8_t)
int32_t __builtin_corev_subNr (int32_t, uint8_t)
uint32_t __builtin_corev_subuNr (uint32_t, uint8_t)
int32_t __builtin_corev_subRNr (int32_t, uint8_t)
uint32_t __builtin_corev_subuRNr (uint32_t, uint8_t)
```

## Listing of PULP 8/16-bit SIMD builtins (`xcvsimd`)

### SIMD ALU operations

The half word vector `add` and `sub` instructions come in variants which shift by 0, 1, 2 or 3, in order to divide by 1, 2, 4 or 8.  Rather than enumerate many instructions, we provide a single instruction with the divide as an extra, constant, argument.

```
uint32_t __builtin_corev_add_h (uint32_t, uint32_t, const uint8_t)
uint32_t __builtin_corev_add_b (uint32_t, uint32_t)
uint32_t __builtin_corev_add_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_add_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_sub_h (uint32_t, uint32_t, const uint8_t)
uint32_t __builtin_corev_sub_b (uint32_t, uint32_t)
uint32_t __builtin_corev_sub_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_sub_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_avg_h (uint32_t, uint32_t)
uint32_t __builtin_corev_avg_b (uint32_t, uint32_t)
uint32_t __builtin_corev_avg_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_avg_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_avgu_h (uint32_t, uint32_t)
uint32_t __builtin_corev_avgu_b (uint32_t, uint32_t)
uint32_t __builtin_corev_avgu_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_avgu_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_min_h (uint32_t, uint32_t)
uint32_t __builtin_corev_min_b (uint32_t, uint32_t)
uint32_t __builtin_corev_min_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_min_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_minu_h (uint32_t, uint32_t)
uint32_t __builtin_corev_minu_b (uint32_t, uint32_t)
uint32_t __builtin_corev_minu_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_minu_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_max_h (uint32_t, uint32_t)
uint32_t __builtin_corev_max_b (uint32_t, uint32_t)
uint32_t __builtin_corev_max_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_max_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_maxu_h (uint32_t, uint32_t)
uint32_t __builtin_corev_maxu_b (uint32_t, uint32_t)
uint32_t __builtin_corev_maxu_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_maxu_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_srl_h (uint32_t, uint32_t)
uint32_t __builtin_corev_srl_b (uint32_t, uint32_t)
uint32_t __builtin_corev_srl_sc_h (uint32_t, uint8_t)
uint32_t __builtin_corev_srl_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_sra_h (uint32_t, uint32_t)
uint32_t __builtin_corev_sra_b (uint32_t, uint32_t)
uint32_t __builtin_corev_sra_sc_h (uint32_t, uint8_t)
uint32_t __builtin_corev_sra_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_sll_h (uint32_t, uint32_t)
uint32_t __builtin_corev_sll_b (uint32_t, uint32_t)
uint32_t __builtin_corev_sll_sc_h (uint32_t, uint8_t)
uint32_t __builtin_corev_sll_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_or_h (uint32_t, uint32_t)
uint32_t __builtin_corev_or_b (uint32_t, uint32_t)
uint32_t __builtin_corev_or_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_or_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_xor_h (uint32_t, uint32_t)
uint32_t __builtin_corev_xor_b (uint32_t, uint32_t)
uint32_t __builtin_corev_xor_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_xor_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_and_h (uint32_t, uint32_t)
uint32_t __builtin_corev_and_b (uint32_t, uint32_t)
uint32_t __builtin_corev_and_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_and_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_abs_h (uint32_t rs)
uint32_t __builtin_corev_abs_b (uint32_t rs)
```

### SIMD bit manipulation operations

Because the semantics of these instructions are unclear, these may not be the correct prototypes

```
int32_t __builtin_corev_extract_h (uint32_t, uint8_t)
int32_t __builtin_corev_extract_b (uint32_t, uint8_t)
uint32_t __builtin_corev_extractu_h (uint32_t, uint8_t)
uint32_t __builtin_corev_extractu_b (uint32_t, uint8_t)
```

The insert operations are modifying a value, so the value is passed by reference as the first argument, and the final value also appears as the result.
```
uint32_t __builtin_corev_insert_h (uint32_t *, uint32_t, uint8_t)
uint32_t __builtin_corev_insert_b (uint32_t *, uint32_t, uint8_t)
```

### SIMD dot product operations

```
uint32_t __builtin_corev_dotup_h (uint32_t, uint32_t)
uint32_t __builtin_corev_dotup_b (uint32_t, uint32_t)
uint32_t __builtin_corev_dotup_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_dotup_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_dotusp_h (uint32_t, uint32_t)
uint32_t __builtin_corev_dotusp_b (uint32_t, uint32_t)
uint32_t __builtin_corev_dotusp_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_dotusp_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_dotsp_h (uint32_t, uint32_t)
uint32_t __builtin_corev_dotsp_b (uint32_t, uint32_t)
uint32_t __builtin_corev_dotsp_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_dotsp_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_sdotup_h (uint32_t, uint32_t)
uint32_t __builtin_corev_sdotup_b (uint32_t, uint32_t)
uint32_t __builtin_corev_sdotup_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_sdotup_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_sdotusp_h (uint32_t, uint32_t)
uint32_t __builtin_corev_sdotusp_b (uint32_t, uint32_t)
uint32_t __builtin_corev_sdotusp_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_sdotusp_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_sdotsp_h (uint32_t, uint32_t)
uint32_t __builtin_corev_sdotsp_b (uint32_t, uint32_t)
uint32_t __builtin_corev_sdotsp_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_sdotsp_sc_b (uint32_t, int8_t)
```

### SIMD shuffle and pack operations

```
uint32_t __builtin_corev_shuffle_h (uint32_t, uint32_t)
uint32_t __builtin_corev_shuffle_sci_h (uint32_t, int8_t)

uint32_t __builtin_corev_shuffle_b (uint32_t, uint32_t)
uint32_t __builtin_corev_shuffleI0_sci_b (uint32_t, int8_t)
uint32_t __builtin_corev_shuffleI1_sci_b (uint32_t, int8_t)
uint32_t __builtin_corev_shuffleI2_sci_b (uint32_t, int8_t)
uint32_t __builtin_corev_shuffleI3_sci_b (uint32_t, int8_t)

uint32_t __builtin_corev_shuffle2_h (uint32_t, uint32_t)
uint32_t __builtin_corev_shuffle2_b (uint32_t, uint32_t)

uint32_t __builtin_corev_pack (uint32_t, uint32_t)
uint32_t __builtin_corev_pack_h (uint32_t, uint32_t)
```

The last two pack instructions modify an existing value in `rd`, so that must be passed in by reference, and for convenience also returned as a result.

```
uint32_t __builtin_corev_packhi_b (uint32_t *, uint32_t, uint32_t)
uint32_t __builtin_corev_packlo_b (uint32_t *, uint32_t, uint32_t)
```

### SIMD comparison operations

```
uint32_t __builtin_corev_cmpeq_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpeq_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpeq_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_cmpeq_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_cmpne_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpne_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpne_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_cmpne_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_cmpgt_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpgt_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpgt_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_cmpgt_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_cmpge_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpge_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpge_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_cmpge_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_cmplt_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmplt_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmplt_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_cmplt_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_cmple_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmple_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmple_sc_h (uint32_t, int16_t)
uint32_t __builtin_corev_cmple_sc_b (uint32_t, int8_t)

uint32_t __builtin_corev_cmpgtu_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpgtu_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpgtu_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_cmpgtu_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_cmpgeu_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpgeu_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpgeu_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_cmpgeu_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_cmpltu_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpltu_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpltu_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_cmpltu_sc_b (uint32_t, uint8_t)

uint32_t __builtin_corev_cmpleu_h (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpleu_b (uint32_t, uint32_t)
uint32_t __builtin_corev_cmpleu_sc_h (uint32_t, uint16_t)
uint32_t __builtin_corev_cmpleu_sc_b (uint32_t, uint8_t)
```

### SIMD complex number operations

Many of these instructions come in variants which shift by 0, 1, 2 or 3, in order to divide by 1, 2, 4 or 8.  Rather than enumerate many instructions, we provide a single instruction with the divide as an extra, constant, argument.

```
uint32_t __builtin_corev_subrotmj (uint32_t, uint32_t, const uint8_t)
uint32_t __builtin_corev_cplxconj (uint32_t, uint32_t)
uint32_t __builtin_corev_cplxmul_r (uint32_t, uint32_t, const uint8_t)
uint32_t __builtin_corev_cplxmul_i (uint32_t, uint32_t, const uint8_t)
```

## Listing of PULP bit manipulation builtins (`xcvbitmanip`)

Some of these functions modify the destination register, so need the value passed by reference, although for convenience the modfied value is returned as result.

```
int32_t __builtin_corev_extract (int32_t, uint8_t, uint8_t)
uint32_t __builtin_corev_cv.extractu (uint32_t, uint8_t, uint8_t)
int32_t __builtin_corev_cv.extractr (int32_t, uint16_t)
uint32_t __builtin_corev_cv.extractur (int32_t, uint16_t)
uint32_t __builtin_corev_cv.insert(uint32_t *, uint32_t, uint8_t, uint8_t)
uint32_t __builtin_corev_cv.insertr(uint32_t *, uint32_t, uint16_t)
uint32_t __builtin_corev_cv.bclr (uint32_t, uint8_t, uint8_t)
uint32_t __builtin_corev_cv.bclrr (uint32_t, uint16_t)
uint32_t __builtin_corev_cv.bset (uint32_t, uint8_t, uint8_t)
uint32_t __builtin_corev_cv.bsetr (uint32_t, uint16_t)
uint8_t __builtin_corev_cv.ff1 (uint32_t)
uint8_t __builtin_corev_cv.fl1 (uint32_t)
uint8_t __builtin_corev_cv.clb (uint32_t)
uint8_t __builtin_corev_cv.cnt (uint32_t)
uint32_t __builtin_corev_cv.ror (uint32_t)
uint32_t __builtin_corev_cv.bitrev (uint32_t, uint8_t, uint8_t)
```

## Listing of event load word builtins (`xcvelw`)

```
uint32_t __builtin_corev_elw (int16_t)
```

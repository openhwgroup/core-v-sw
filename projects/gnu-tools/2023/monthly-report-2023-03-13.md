# CORE-V GNU Tool Chain Monthly Report (March 2023)

## Overview

### From University of Bologna:

**GCC**
#### Open Pull Request:
  * [#9](https://github.com/openhwgroup/corev-gcc/pull/9) Implemented PULP Branching Immediate Instructions and GCC Tests
    * NOTE: Picked up by Nandni Jamnadas (Embecosm)


### From PLCT:

**Binutils**
  * Working on adding Zc* support in RISC-V

#### Fixed Issues (Reviewed and Merged):
  * [#56](https://github.com/openhwgroup/corev-binutils-gdb/pull/56) Fixed Several ZCMT Issues:
      * [#44](https://github.com/openhwgroup/corev-binutils-gdb/issues/44) Force Jump Table Inclusion
      * [#45](https://github.com/openhwgroup/corev-binutils-gdb/issues/45) Zc Toolchain does not seem to allow half-word aligned functions
      * [#48](https://github.com/openhwgroup/corev-binutils-gdb/issues/48) A possible issue in relaxing call to Zcmt Instructions
    
  * [#65](https://github.com/openhwgroup/corev-binutils-gdb/pull/65) Update Zc* to version 1.0.1
      * [#55](https://github.com/openhwgroup/corev-binutils-gdb/issues/55) Zcmt table generation results in incorrect branch resolution
      * [#46](https://github.com/openhwgroup/corev-binutils-gdb/issues/46) Upgrade to version 1.0.0rc5.5

  * [#47](https://github.com/openhwgroup/corev-binutils-gdb/issues/47) Zcmp CFI may need fixing
      * Moved to as a GCC issue [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing

#### Open Pull Request:
  * [#83](https://github.com/openhwgroup/corev-binutils-gdb/pull/83) RISC-V: skip unrelated relocations in table jump relaxation phrase
      * [#82](https://github.com/openhwgroup/corev-binutils-gdb/issues/82) Incorrectly compiles functions in newlib with Zcmt-ext

**GCC**
  * Working on adding Zc* support in RISC-V


### From Embecosm:

**Binutils**
#### Reviewed and Merged Pull Requests:
  * [#75](https://github.com/openhwgroup/corev-binutils-gdb/pull/75) Update CORE-V extension name prefix from `xcorev` to `xcv`
  * [#76](https://github.com/openhwgroup/corev-binutils-gdb/pull/76) Remove `xcv` extension

#### Fixed Issues (Reviewed and Merged):
  * [#74](https://github.com/openhwgroup/corev-binutils-gdb/pull/74) CV32E40Pv2 SIMD 6-bit Unsigned Immediate + Renamed SIMD GAS Tests
      * [#66](https://github.com/openhwgroup/corev-binutils-gdb/issues/66) CV32E40Pv2 Compiler error for cv.minu/maxu.sci.*
      * [#67](https://github.com/openhwgroup/corev-binutils-gdb/issues/67) CV32E40Pv2 Compiler error for cv.shuffleI*.sci.*

#### Open Pull Requests:
  * [#81](https://github.com/openhwgroup/corev-binutils-gdb/pull/81) RISC-V: Fixed the overflow values for cv relocations

**GCC**
#### Reviewed and Merged Pull Requests:
  * [#21](https://github.com/openhwgroup/corev-gcc/pull/21) CV32340Pv2 Bit Manipulation Builtins
  * [#19](https://github.com/openhwgroup/corev-gcc/pull/19) CV32340Pv2 SIMD Builtins
  * [#29](https://github.com/openhwgroup/corev-gcc/pull/29) CV32340Pv2 General ALU Builtins
  * [#24](https://github.com/openhwgroup/corev-gcc/pull/24) Update CORE-V extension name prefix from `xcorev` to `xcv`
  * [#25](https://github.com/openhwgroup/corev-gcc/pull/25) Remove `xcv` extension
  * [#27](https://github.com/openhwgroup/corev-gcc/pull/27) Update CV32340Pv2 Event Load Builtin


### Results:

Assembler Testing:

Category | Previous | Current | Delta
-- | -- | -- | --
Expected passes | 1240 | 1232 | -8
Unexpected failures | - | - | -
Unexpected successes | - | - | -
Expected failures | 23 | 23 | -
Unresolved testcases | - | - | -
Unsupported tests | 9 | 9 | -

Linker testing:

Category | Previous | Current | Delta
-- | -- | -- | --
Expected passes | 431 | 433 | +2
Unexpected failures | 2 | - | -2
Unexpected successes | - | - | -
Expected failures | 13 | 13 | -
Unresolved testcases | 26 | 26 | -
Unsupported tests | 200 | 200 | -

GCC testing, RISC-V Target ONLY:

Category | Previous | Current | Delta
-- | -- | -- | --
Expected passes | 3681 | 10725 | +7044
Unexpected failures | 53 | 53 | -
Unexpected successes | - | - | -
Expected failures | 6 | 6 | -
Unresolved testcases | 6 | 6 | -
Unsupported tests | 233 | 245 | +12

### Open Issues:

Binutils
  * [#82](https://github.com/openhwgroup/corev-binutils-gdb/issues/82) Incorrectly compiles functions in newlib with Zcmt-ext
  * [#77](https://github.com/openhwgroup/corev-binutils-gdb/issues/77) Zcmt issues with latest binutils build
  * [#73](https://github.com/openhwgroup/corev-binutils-gdb/issues/73) Linker does not test HW loop offsets are in range
  * [#69](https://github.com/openhwgroup/corev-binutils-gdb/issues/69) Some multiplication instructions not existing anymore
  * [#52](https://github.com/openhwgroup/corev-binutils-gdb/issues/52) Assembler .option directives for Zc*
  * [#49](https://github.com/openhwgroup/corev-binutils-gdb/issues/49) Propose to tighten condition for calls of _bfd_riscv_table_jump_mark for R_RISCV_CALL/R_RISCV_CALL_PLT/R_RISCV_JAL only
  * [#1](https://github.com/openhwgroup/corev-binutils-gdb/issues/1) GDB needs a sane default set of CSRs in the absence of a target description

GCC
  * [#26](https://github.com/openhwgroup/corev-gcc/issues/26) How should an out-of-range index be treated?
  * [#22](https://github.com/openhwgroup/corev-gcc/issues/22) Builtin optimisation enhancement
  * [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing
  * [#17](https://github.com/openhwgroup/corev-gcc/issues/17) DWARF error: mangled line number section


### Planned Events:
* Implement Zc* support in RISC-V Bintuils and GCC
* Rebase upstream Bintuils and GCC onto CORE-V Binutils and CORE-V GCC
* Implemented auto-generation for Branching Immediate instructions and GCC tests
* Fix issues with ZCMT in Binutils and GCC
* Fix issues with CV32E40Pv2 in Binutils
* Continue discussion on CORE-V builtin names in GCC

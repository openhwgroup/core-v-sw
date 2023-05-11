# CORE-V GNU Tool Chain Monthly Report (May 2023)

## Overview

### REBASE UPDATE

  * This version of the tool chain does not support Windows

  * Rebased CORE-V Binutils from Upstream (git clone -b master git://sourceware.org/git/binutils-gdb.git)
    * From commit 77e99ad92f1a5855a2a3c1a8b9f484b6beb5bdd3 (22 April 2022) to commit bf3f6c02d73f9823b8cb4f59524f29fbbfb6126d (22 March 2023)
  * Rebased CORE-V GCC from Upstream (git clone -b master git://gcc.gnu.org/git/gcc.git)
    * From commit c1a9cf679153719d066f1ec79154c406e1e48cdf (22 April 2022) to commit 7ef44579787af646d5bae13a91a49ef5d2048f5c (13 March 2023)
  * All latest RISC-V Zc* extensions are in CORE-V GCC
  * All latest RISC-V Zc* extensions are in CORE-V binutils-gdb-gdb, excluding Zcmt
  * RISC-V Zcmt patch is currently under development
  
  * For all Zc* support in CORE-V GCC and CORE-V binutils-gdb, including Zcmt, use the previous tool chain release (10th March 2023):
    * https://www.embecosm.com/resources/tool-chain-downloads/#corev
    * Previous corev-binutils-gdb branch: https://github.com/openhwgroup/corev-binutils-gdb/tree/development-eddf4096b97
    * Previous corev-gcc branch: https://github.com/openhwgroup/corev-gcc/tree/development-08dd5f65b06


### From PLCT:

**Binutils**
  * All latest RISC-V Zc* extensions are in CORE-V binutils-gdb-gdb, excluding Zcmt
  * RISC-V Zcmt patch is currently under development

#### Fixed Issues Pull (Reviewed and Merged):
  * [#83](https://github.com/openhwgroup/corev-binutils-gdb/pull/83) RISC-V: skip unrelated relocations in table jump relaxation phrase
      * [#82](https://github.com/openhwgroup/corev-binutils-gdb/issues/82) Incorrectly compiles functions in newlib with Zcmt-ext
      * [#49](https://github.com/openhwgroup/corev-binutils-gdb/issues/49) Propose to tighten condition for calls of _bfd_riscv_table_jump_mark for R_RISCV_CALL/R_RISCV_CALL_PLT/R_RISCV_JAL only

**GCC**
  * All latest RISC-V Zc* extensions are in CORE-V GCC


### From Embecosm:

**Binutils**
  * **COMPLETE** Rebased CORE-V Binutils from Upstream
    * From commit 77e99ad92f1a5855a2a3c1a8b9f484b6beb5bdd3 (22 April 2022) to commit bf3f6c02d73f9823b8cb4f59524f29fbbfb6126d (22 March 2023)
  
#### Fixed Issues (Reviewed and Merged or Closed):
  * [#1](https://github.com/openhwgroup/corev-binutils-gdb/issues/1) GDB needs a sane default set of CSRs in the absence of a target description
  * [#73](https://github.com/openhwgroup/corev-binutils-gdb/issues/73) Linker does not test HW loop offsets are in range
  * [#52](https://github.com/openhwgroup/corev-binutils-gdb/issues/52) Assembler .option directives for Zc*
    * [#86](https://github.com/openhwgroup/corev-binutils-gdb/pull/86) RISC-V: Fix .option arch compatibility with zc*

**GCC**
  * **COMPLETE** Rebased CORE-V GCC from Upstream
    * From commit c1a9cf679153719d066f1ec79154c406e1e48cdf (22 April 2022) to commit 7ef44579787af646d5bae13a91a49ef5d2048f5c (13 March 2023)

#### Fixed Issues (Reviewed and Merged or Closed):
  * [#31](https://github.com/openhwgroup/corev-gcc/issues/31) __builtin_riscv_cv_alu_addRN() builtin generate incorrect assemble operand
    * [#34](https://github.com/openhwgroup/corev-gcc/pull/34) CV32E40Pv2 General ALU Builtins Update
  * [#32](https://github.com/openhwgroup/corev-gcc/issues/32) Conflict between spec and GCC of bit manipulation instructions
    * [#33](https://github.com/openhwgroup/corev-gcc/pull/33) Update operand order to match spec for bit manip instructions

### Open Issues:

Binutils
  * [#89](https://github.com/openhwgroup/corev-binutils-gdb/issues/89) The immediate field of shift instructions should be unsigned
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single *.S-source bare metal code
  * [#87](https://github.com/openhwgroup/corev-binutils-gdb/issues/87) Post-Increment Register-Immediate Load should be updated
  * [#85](https://github.com/openhwgroup/corev-binutils-gdb/issues/85) Using hexadecimal value for instruction signed immediate seems restricted to positive values.
  * [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file
  * [#69](https://github.com/openhwgroup/corev-binutils-gdb/issues/69) Some multiplication instructions not existing anymore

GCC

  * [#36](https://github.com/openhwgroup/corev-gcc/issues/36) Extensions state save and restore
  * [#35](https://github.com/openhwgroup/corev-gcc/issues/35) ra register is modified when Zcmp enabled
  * [#30](https://github.com/openhwgroup/corev-gcc/issues/30) Attribute interrupt causes register corruption when Zcmp enabled
  * [#22](https://github.com/openhwgroup/corev-gcc/issues/22) Builtin optimisation enhancement
  * [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing
  * [#17](https://github.com/openhwgroup/corev-gcc/issues/17) DWARF error: mangled line number section


### Planned Events:
* Implement Zcmt support in RISC-V Bintuils 
* Implement auto-generation for Branching Immediate instructions and GCC tests
* Implement auto-generation for Multiply Accumulate `cv.mac` and `cv.msu` instructions and GCC tests

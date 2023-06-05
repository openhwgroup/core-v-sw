# CORE-V GNU Tool Chain Monthly Report (April 2023)

## Overview

### From University of Bologna:

**GCC**
#### Open Pull Request:
  * [#9](https://github.com/openhwgroup/corev-gcc/pull/9) Implemented PULP Branching Immediate Instructions and GCC Tests
    * NOTE: Picked up by Nandni Jamnadas (Embecosm)


### From PLCT:

**Binutils**
  * Working on adding Zc* support in RISC-V

#### Open Pull Request:
  * [#83](https://github.com/openhwgroup/corev-binutils-gdb/pull/83) RISC-V: skip unrelated relocations in table jump relaxation phrase
      * [#82](https://github.com/openhwgroup/corev-binutils-gdb/issues/82) Incorrectly compiles functions in newlib with Zcmt-ext

**GCC**
  * Working on adding Zc* support in RISC-V


### From Embecosm:

**Binutils**
  * Rebased CORE-V Binutils from Upstream:
    * From commit 77e99ad92f1a5855a2a3c1a8b9f484b6beb5bdd3 to commit bf3f6c02d73f9823b8cb4f59524f29fbbfb6126d
    * Waiting for RISC-V Zc* clean-up patches from PLCT

#### Fixed Issues (Reviewed and Merged or Closed):
  * **CLOSED** [#79](https://github.com/openhwgroup/corev-binutils-gdb/issues/79) Does Event Load Word need a custom relocation?
  * [#81](https://github.com/openhwgroup/corev-binutils-gdb/pull/81) RISC-V: Fixed the overflow values for cv relocations
  * [#77](https://github.com/openhwgroup/corev-binutils-gdb/issues/77) Zcmt issues with latest binutils build

**GCC**
  * Rebased CORE-V GCC from Upstream:
    * From commit c1a9cf679153719d066f1ec79154c406e1e48cdf to commit 7ef44579787af646d5bae13a91a49ef5d2048f5c
    * Waiting for RISC-V Zc* clean-up patches from PLCT

#### Fixed Issues (Reviewed and Merged or Closed):
  * **CLOSED** [#26](https://github.com/openhwgroup/corev-gcc/issues/26) How should an out-of-range index be treated?

### Open Pull Request:
  * **FIXED** [#31](https://github.com/openhwgroup/corev-gcc/issues/31) __builtin_riscv_cv_alu_addRN() builtin generate incorrect assemble operand
    * **NOTE** This issue is fixed on a separate branch based on the upstream rebase: [Upstream CORE-V GCC Rebase](https://github.com/NandniJamnadas/corev-gcc/tree/nj-mary-rebase-without-zc)
    * Fixed issue branch: [General ALU Builtins Fix](https://github.com/NandniJamnadas/corev-gcc/tree/nj-fix-general-alu-patch)


### Open Issues:

Binutils
  * **NEW** [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file
  * **NEW** [#82](https://github.com/openhwgroup/corev-binutils-gdb/issues/82) Incorrectly compiles functions in newlib with Zcmt-ext
  * [#73](https://github.com/openhwgroup/corev-binutils-gdb/issues/73) Linker does not test HW loop offsets are in range
  * [#69](https://github.com/openhwgroup/corev-binutils-gdb/issues/69) Some multiplication instructions not existing anymore
  * [#52](https://github.com/openhwgroup/corev-binutils-gdb/issues/52) Assembler .option directives for Zc*
  * [#49](https://github.com/openhwgroup/corev-binutils-gdb/issues/49) Propose to tighten condition for calls of _bfd_riscv_table_jump_mark for R_RISCV_CALL/R_RISCV_CALL_PLT/R_RISCV_JAL only
  * [#1](https://github.com/openhwgroup/corev-binutils-gdb/issues/1) GDB needs a sane default set of CSRs in the absence of a target description

GCC
  * **NEW** [#32](https://github.com/openhwgroup/corev-gcc/issues/32) Conflict between spec and GCC of bit manipulation instructions
  * **FIXED** [#31](https://github.com/openhwgroup/corev-gcc/issues/31) __builtin_riscv_cv_alu_addRN() builtin generate incorrect assemble operand
  * **NEW** [#30](https://github.com/openhwgroup/corev-gcc/issues/30) Attribute interrupt causes register corruption when Zcmp enabled
  * [#22](https://github.com/openhwgroup/corev-gcc/issues/22) Builtin optimisation enhancement
  * [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing
  * [#17](https://github.com/openhwgroup/corev-gcc/issues/17) DWARF error: mangled line number section


### Planned Events:
* Implement Zc* support in RISC-V Bintuils and GCC
* Implemented auto-generation for Branching Immediate instructions and GCC tests
* Fix issues with ZCMT in Binutils and GCC
* Fix issues with CV32E40Pv2 in Binutils
* Continue discussion on CORE-V builtin names in GCC

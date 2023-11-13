# CORE-V GNU Tool Chain Monthly Report (November 2023)

## Overview

### From PLCT:

**Binutils**
  * RISC-V Zc* extensions are in Upstream Binutils, excluding Zcmt
    * Kito will help to resolve the problems in Zcmt jump table sequence

**GCC**
  * All RISC-V Zc* extensions are in Upstream GCC

### From Embecosm:

**NOTE** XCVmac and XCValu are upstream

**NOTE** Upstream patches are being reviewed here:
  * [GCC XCVelw and XCVbi](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635690.html)
  * [GCC XCVbitmanip](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635795.html)
  * [GCC XCVsimd](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635810.html)
  * [GCC XCVmem](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635817.html)

#### Fixed Issues (Reviewed and Merged or Closed):

**Binutils**
  * None.

**GCC**
  * **FIXED** [#78](https://github.com/openhwgroup/corev-gcc/issues/78) Hardware Loops march option not recognized
  * **FIXED** [#77](https://github.com/openhwgroup/corev-gcc/issues/77) Incorrect code generation with PULP march with 20231017 release
  * **FIXED** [#74](https://github.com/openhwgroup/corev-gcc/issues/74) [XCVmem] Normal register-immediate store not recognized
  * **FIXED** [#73](https://github.com/openhwgroup/corev-gcc/issues/73) illegal operands `flw fa5,t2(s1)` is generated from the latest release toolchain (05/Sep)
  * **CLOSED** [#67](https://github.com/openhwgroup/corev-gcc/issues/67) How to check COREV_CLUSTER for Event Load Instruction
  * **FIXED with rebase** [#30](https://github.com/openhwgroup/corev-gcc/issues/30) Attribute interrupt causes register corruption when Zcmp enabled

#### Pull Request (Reviewed and Merged):

**Binutils**
  * None.

**GCC**
  * [#82](https://github.com/openhwgroup/corev-gcc/pull/82) Exclude CORE-V memory tests for compressed code generation.
  * [#81](https://github.com/openhwgroup/corev-gcc/pull/81) Fix for Issue #77
  * [#80](https://github.com/openhwgroup/corev-gcc/pull/80) Jwr gcc14 xcvhwlp
  * [#79](https://github.com/openhwgroup/corev-gcc/pull/79) backport CORE-V HW loop
  * **CLOSED** [#76](https://github.com/openhwgroup/corev-gcc/pull/76) Jwr gcc14 xcvhwlp
  * [#75](https://github.com/openhwgroup/corev-gcc/pull/75) Fix mem_plus_reg predicate

#### Open Issues:

**Binutils**
  * **NEW** [#106](https://github.com/openhwgroup/corev-binutils-gdb/issues/106) tablejump section `(__jvt_base$)` need be aligned on a 64-byte boundary
  * [#104](https://github.com/openhwgroup/corev-binutils-gdb/issues/104) Handle the range of the immediate shift and extract instructions
  * [#98](https://github.com/openhwgroup/corev-binutils-gdb/issues/98) Getting CORE-V ready for Upstream
  * [#96](https://github.com/openhwgroup/corev-binutils-gdb/issues/96) cv.avgu and cv.srl/sra/sll instructions out of sync
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single .S-source bare metal code
  * [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file

**GCC**
  * **NEW** [#84](https://github.com/openhwgroup/corev-gcc/issues/84) Hardware loops causes ICE in final_scan_insn_1
  * **NEW** [#83](https://github.com/openhwgroup/corev-gcc/issues/83) Hardware loops causes relocation truncated to fit: R_RISCV_CVPCREL_UI12
  * [#70](https://github.com/openhwgroup/corev-gcc/issues/70) unrecognized opcode 'csrr' extension 'zicsr' required
  * [#58](https://github.com/openhwgroup/corev-gcc/issues/58) Post-inc memory access generation for -Os -Oz and -Og
  * [#55](https://github.com/openhwgroup/corev-gcc/issues/55) Getting CORE-V ready for Upstream
  * [#48](https://github.com/openhwgroup/corev-gcc/issues/48) How IDEs gain awareness of Builtins?
  * [#39](https://github.com/openhwgroup/corev-gcc/issues/39) Builtins Implementation Status compared to LLVM
  * [#36](https://github.com/openhwgroup/corev-gcc/issues/36) Extensions state save and restore
  * [#22](https://github.com/openhwgroup/corev-gcc/issues/22) Builtin optimisation enhancement
  * [#17](https://github.com/openhwgroup/corev-gcc/issues/17) DWARF error: mangled line number section

### RISC-V CORE-V Bintuils GNU Assembler Test Results:
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |           1256 |          1256 |           - |
| Unexpected failures  |              - |             - |           - |
| Unexpected successes |              - |             - |           - |
| Expected failures    |             25 |            25 |           - |
| Unresolved testcases |              - |             - |           - |
| Unsupported tests    |              9 |             9 |           - |
```

### RISC-V CORE-V Bintuils GNU Linker Test Results:
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |            441 |           441 |           - |
| Unexpected failures  |              - |             - |           - |
| Unexpected successes |              - |             - |           - |
| Expected failures    |             14 |            14 |           - |
| Unresolved testcases |              - |             - |           - |
| Unsupported tests    |            201 |           201 |           - |
```

### RISC-V CORE-V GCC Test Results (riscv.exp):
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |          22029 |         19224 |       -2805 |
| Unexpected failures  |            173 |            32 |        -141 |
| Unexpected successes |              - |             - |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |              6 |             6 |           - |
| Unsupported tests    |           1268 |          1328 |         +60 |
```

The decrease in expected passes and unxpected failures is caused by changing the
simulator. Since the CV32E40Pv2 verilator model is still under development, when
tests are run with riscv-corev-elf-run they may fail to run. Instead,
`\bin\true` was used. Some execution test will still fail since they expect the
simulator to return a specific result.

### Planned Events:
  * Fix general issues in CORE-V Binutils-gdb and CORE-V GCC
  * Complete review of CORE-V XCVelw, XCVbi, XCVmem, XCVsimd, and XCVbitmanip
    patches for Upstream GCC
  * Submit patches for XCVelw, XCVbi, XCVmem, XCVsimd, and XCVbitmanip

# CORE-V GNU Tool Chain Monthly Report (December 2023)

## Overview

### From PLCT:

**Binutils**
  * RISC-V Zc* extensions are in Upstream Binutils, excluding Zcmt
  * Zcmt patches have been submitted and are being reviewed
    * [Patches](https://sourceware.org/pipermail/binutils/2023-November/130849.html)

**GCC**
  * All RISC-V Zc* extensions are in Upstream GCC

### From Embecosm:

**NOTE** XCVmac and XCValu are upstream

**NOTE** Upstream patches are being reviewed here:
  * [Binutils XCVelw, XCVbi, and XCVmem](https://sourceware.org/pipermail/binutils/2023-December/131104.html)
  * [GCC XCVelw and XCVbi](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635690.html)
  * [GCC XCVbitmanip](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635795.html)
  * [GCC XCVsimd](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635810.html)
  * [GCC XCVmem](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635817.html)

#### Fixed Issues (Reviewed and Merged or Closed):

**Binutils**
  * **FIXED** [#112](https://github.com/openhwgroup/corev-binutils-gdb/issues/112) incorrect opcode generated for cv.elw
  * **FIXED** [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file

**GCC**
  * **FIXED** [#86](https://github.com/openhwgroup/corev-gcc/issues/86) .option norvc is ignored with Zca
  * **FIXED** [#70](https://github.com/openhwgroup/corev-gcc/issues/70) unrecognized opcode 'csrr' extension 'zicsr' required
  * **FIXED** [#84](https://github.com/openhwgroup/corev-gcc/issues/84) Hardware loops causes ICE in final_scan_insn_1
  * **FIXED** [#83](https://github.com/openhwgroup/corev-gcc/issues/83) Hardware loops causes relocation truncated to fit: R_RISCV_CVPCREL_UI12

#### Pull Request (Reviewed and Merged):

**Binutils**
  * [#113](https://github.com/openhwgroup/corev-binutils-gdb/pull/113) Fix incorrect opcode for cv.elw
  * [#110](https://github.com/openhwgroup/corev-binutils-gdb/pull/110) Roll forward
  * [#108](https://github.com/openhwgroup/corev-binutils-gdb/pull/108) Fix Zca always opens the compress flag

**GCC**
  * [#87](https://github.com/openhwgroup/corev-gcc/pull/87) Roll forward
  * [#85](https://github.com/openhwgroup/corev-gcc/pull/85) Update README

#### Open Issues:

**Binutils**
  * **NEW** [#111](https://github.com/openhwgroup/corev-binutils-gdb/issues/111) HWLoop relocation error
  * **NEW** [#109](https://github.com/openhwgroup/corev-binutils-gdb/issues/109) simulator
  * [#106](https://github.com/openhwgroup/corev-binutils-gdb/issues/106) tablejump section `(__jvt_base$)` need be aligned on a 64-byte boundary
  * [#104](https://github.com/openhwgroup/corev-binutils-gdb/issues/104) Handle the range of the immediate shift and extract instructions
  * [#98](https://github.com/openhwgroup/corev-binutils-gdb/issues/98) Getting CORE-V ready for Upstream
  * [#96](https://github.com/openhwgroup/corev-binutils-gdb/issues/96) cv.avgu and cv.srl/sra/sll instructions out of sync
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single .S-source bare metal code

**GCC**
  * **NEW** [#90](https://github.com/openhwgroup/corev-gcc/issues/90) cannot find suitable multilib during the build, though it is shown in the toolchain lib folder.
  * **NEW** [#89](https://github.com/openhwgroup/corev-gcc/issues/89) Add regression tests for hardware loop failures in issues #83 and #84
  * **NEW** [#88](https://github.com/openhwgroup/corev-gcc/issues/88) xcvmem mem (reg + reg) instructions require corev.md to be above movSI
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
| Expected passes      |          19224 |         20499 |       +1275 |
| Unexpected failures  |             32 |            32 |           - |
| Unexpected successes |              - |             - |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |              6 |             6 |           - |
| Unsupported tests    |           1328 |          1328 |           - |
```

### Planned Events:
  * Fix general issues in CORE-V Binutils-gdb and CORE-V GCC
  * Complete review of CORE-V XCVelw, XCVbi, XCVmem, XCVsimd, XCVhwlp, and XCVbitmanip
    patches for Upstream GCC/ Binutils
  * Submit patches for XCVsimd, and XCVbitmanip to Binutils

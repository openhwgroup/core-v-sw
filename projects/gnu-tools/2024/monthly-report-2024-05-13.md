# CORE-V GNU Tool Chain Monthly Report (May 2025)

## Overview

|             | Binutils    | GCC          |
|-------------|-------------|--------------|
| xcvhwlp     | Merged      | Merged       |
| xcvsimd     | Merged      | Landed       |
| xcvbi       | Upstream    | Landed       |
| xcvmem      | Upstream    | Upstream     |
| xcvalu      | Landed      | Landed       |
| xcvmac      | Landed      | Landed       |
| xcvbitmanip | Merged      | Merged       |
| xcvelw      | Upstream    | Landed       |
| zcmt        | Upstream    | Landed       |
| zc*         | Landed      | Landed       |

Landed: merged into upstream.
Upstream: currently in a patch upstream and under review.
Merged: merged in the OpenHW repositories.

## Patches under review:

  * [Binutils ZCMT](https://sourceware.org/pipermail/binutils/2023-November/130849.html)
  * [Binutils XCVelw, XCVbi, and XCVmem](https://sourceware.org/pipermail/binutils/2023-December/131104.html)
  * [GCC XCVbitmanip](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635795.html)
    * Requires RTL fixes.
  * [GCC XCVmem](https://gcc.gnu.org/pipermail/gcc-patches/2023-November/635817.html)

## Fixed Issues (Reviewed and Merged or Closed):

**Binutils**
  * **FIXED** [#96](https://github.com/openhwgroup/corev-binutils-gdb/issues/96) cv.avgu and cv.srl/sra/sll instructions out of sync
  * **FIXED** [#104](https://github.com/openhwgroup/corev-binutils-gdb/issues/104) Handle the range of the immediate shift and extract instructions

**GCC**
  * **FIXED** [#101](https://github.com/openhwgroup/corev-gcc/issues/101) HW Loop produces an ICE during building
  * **FIXED** [#92](https://github.com/openhwgroup/corev-gcc/issues/92) pseudo instruction "LA" not translating to correct instructions

## Pull Request (Reviewed and Merged):

**Binutils**
  * [#115](https://github.com/openhwgroup/corev-binutils-gdb/pull/115) Roll forward - 19th March 2024

**GCC**
  * [#103](https://github.com/openhwgroup/corev-gcc/pull/103) Roll forward - 19th March 2024
  * [#102](https://github.com/openhwgroup/corev-gcc/pull/102) Rebase on non-broken upstream (building with newlib)

## Open Issues:

**Binutils**
  * **NEW** [#117](https://github.com/openhwgroup/corev-binutils-gdb/issues/117) Error not generated for cv.shuffle.sci.h with wrong Imm6 value
  * **NEW** [#116](https://github.com/openhwgroup/corev-binutils-gdb/issues/116) Additional warning for clipr/clipur instructions
  * [#109](https://github.com/openhwgroup/corev-binutils-gdb/issues/109) simulator
  * [#106](https://github.com/openhwgroup/corev-binutils-gdb/issues/106) tablejump section `(__jvt_base$)` need be aligned on a 64-byte boundary
  * [#98](https://github.com/openhwgroup/corev-binutils-gdb/issues/98) Getting CORE-V ready for Upstream
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single .S-source bare metal code

**GCC**
  * **NEW** [#106](https://github.com/openhwgroup/corev-gcc/issues/106) CORE-V bitmanip builtin failure with bclr/bset
  * **NEW** [#105](https://github.com/openhwgroup/corev-gcc/issues/105) CORE-V bitmanip extract failures with -O1
  * **NEW** [#104](https://github.com/openhwgroup/corev-gcc/issues/104) Hardware Loops registers not saved/restored before being used in synchronous/asynchronous exception handler
  * [#90](https://github.com/openhwgroup/corev-gcc/issues/90) cannot find suitable multilib during the build, though it is shown in the toolchain lib folder.
  * [#58](https://github.com/openhwgroup/corev-gcc/issues/58) Post-inc memory access generation for -Os -Oz and -Og
  * [#55](https://github.com/openhwgroup/corev-gcc/issues/55) Getting CORE-V ready for Upstream
  * [#48](https://github.com/openhwgroup/corev-gcc/issues/48) How IDEs gain awareness of Builtins?
  * [#39](https://github.com/openhwgroup/corev-gcc/issues/39) Builtins Implementation Status compared to LLVM
  * [#36](https://github.com/openhwgroup/corev-gcc/issues/36) Extensions state save and restore
  * [#22](https://github.com/openhwgroup/corev-gcc/issues/22) Builtin optimisation enhancement
  * [#17](https://github.com/openhwgroup/corev-gcc/issues/17) DWARF error: mangled line number section

## RISC-V CORE-V Bintuils GNU Assembler Test Results:
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

## RISC-V CORE-V Bintuils GNU Linker Test Results:
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

## RISC-V CORE-V GCC Test Results (riscv.exp):
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |          20499 |         20499 |           - |
| Unexpected failures  |             32 |            32 |           - |
| Unexpected successes |              - |             - |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |              6 |             6 |           - |
| Unsupported tests    |           1328 |          1328 |           - |
```

## Planned Events:
  * Fix general issues in CORE-V Binutils-gdb and CORE-V GCC
  * Complete review of CORE-V XCVmem and XCVbitmanip for GCC
    patches for Upstream GCC/ Binutils
  * Submit patches for XCVsimd, and XCVbitmanip to Binutils

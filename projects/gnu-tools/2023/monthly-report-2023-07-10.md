# CORE-V GNU Tool Chain Monthly Report (July 2023)

## Overview

### From PLCT:

**NOTE:** All new changes to Zc* patches will now be upstream ready to be reviewed here,
  * [Upstream GCC Review Patches](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/thread.html)
  * [Upstream Binutils Review Patches](https://sourceware.org/pipermail/binutils/2023-June/thread.html)

  * Zc* issues raised in CORE-V repositories will be fixed on the Upstream review patches

**Binutils**
  * RISC-V Zc* extensions are in CORE-V binutils-gdb, excluding Zcmt:
    * These Zc* patches are based on the 12 Apr 2023 version
  * All latest RISC-V Zc* patch is currently under development
  * **PAUSED** RISC-V Zcmt patch is currently under development

**GCC**
  * RISC-V Zc* extensions are in CORE-V GCC:
    * These Zc* patches are based on the 12 Apr 2023 version
  * All latest RISC-V Zc* patches are currently under review by the RISC-V team

#### Fixed Issues (Reviewed and Merged or Closed):
  * **FIXED** [#35](https://github.com/openhwgroup/corev-gcc/issues/35) ra register is modified when Zcmp enabled
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)
  * **FIXED** [#20](https://github.com/openhwgroup/corev-gcc/issues/20)
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)

### From Embecosm:

**Binutils**
  
#### Fixed Issues (Reviewed and Merged or Closed):
  * **FIXED** [#37](https://github.com/openhwgroup/corev-gcc/issues/37) GCC requires version number to be specified with architecture extensions
    * Pull Request: [#94](https://github.com/openhwgroup/corev-binutils-gdb/pull/94) CORE-V: Remove versioning support for XCV Extensions

#### Pull Request (Reviewed and Merged):
  * [#95](https://github.com/openhwgroup/corev-binutils-gdb/pull/95) CORE-V: SIMD Update - Removal of redundant SIMD mask macros in riscv-opt.h
  * [#94](https://github.com/openhwgroup/corev-binutils-gdb/pull/94) CORE-V: Remove versioning support for XCV Extensions

**GCC**
#### Fixed Issues (Reviewed and Merged or Closed):
  * **FIXED** [#37](https://github.com/openhwgroup/corev-gcc/issues/37) GCC requires version number to be specified with architecture extensions
    * Pull Request: [#45](https://github.com/openhwgroup/corev-gcc/pull/45) CORE-V: Remove versioning support for XCV Extensions

#### Pull Request (Reviewed and Merged):
  * [#45](https://github.com/openhwgroup/corev-gcc/pull/45) CORE-V: Remove versioning support for XCV Extensions
  * [#44](https://github.com/openhwgroup/corev-gcc/pull/44) Backport CORE-V fast interrupts 
  * [#43](https://github.com/openhwgroup/corev-gcc/pull/43) CORE-V: Fix typo in mac/msu tests
  * [#42](https://github.com/openhwgroup/corev-gcc/pull/42) CORE-V: Support CORE-V fast interrupts

#### Open Issues:

Binutils
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single *.S-source bare metal code
  * [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file

GCC
  * **NEW** [#48](https://github.com/openhwgroup/corev-gcc/issues/48) How IDEs gain awareness of Builtins?
  * **FIXED via upstream patch** [#35](https://github.com/openhwgroup/corev-gcc/issues/35) ra register is modified when Zcmp enabled
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)
  * **FIXED via upstream patch** [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)
  * [#39](https://github.com/openhwgroup/corev-gcc/issues/39) Builtins Implementation Status compared to LLVM
  * [#36](https://github.com/openhwgroup/corev-gcc/issues/36) Extensions state save and restore
  * [#30](https://github.com/openhwgroup/corev-gcc/issues/30) Attribute interrupt causes register corruption when Zcmp enabled
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
[#94](https://github.com/openhwgroup/corev-binutils-gdb/pull/94) CORE-V: Remove versioning support for XCV Extensions
  * No change in test results as I have modified all CORE-V tests to remove explicit call for versions. The results show that you can now call all XCV extensions without explicit version.

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
[#94](https://github.com/openhwgroup/corev-binutils-gdb/pull/94) CORE-V: Remove versioning support for XCV Extensions
  * No change in test results as I have modified all CORE-V tests to remove explicit call for versions. The results show that you can now call all XCV extensions without explicit version.

### RISC-V CORE-V GCC Test Results:
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |          12620 |         14984 |       +2364 |
| Unexpected failures  |             71 |            53 |         -18 |
| Unexpected successes |              - |             - |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |             24 |             6 |         -18 |
| Unsupported tests    |            674 |           697 |         +23 |
```
There is an increase in expected passes and unsupported tests due to adding tests for  under [#42](https://github.com/openhwgroup/corev-gcc/pull/42) CORE-V: Support CORE-V fast interrupts.

There is an decrease in unexpected failures and unresolved testcases due to adding tests for auto-generation on Multiply-Accumulate cv.mac and cv.msu under [#43](https://github.com/openhwgroup/corev-gcc/pull/43) CORE-V: Fix typo in mac/msu tests.

[#45](https://github.com/openhwgroup/corev-gcc/pull/45) CORE-V: Remove versioning support for XCV Extensions
  * No change in test results as I have modified all CORE-V tests to remove explicit call for versions. The results show that you can now call all XCV extensions without explicit version.

### Planned Events:
* Implement Zcmt support in RISC-V Bintuils
* Clean Up Zc* patches for Upstream Bintuils and Upstream GCC
* Implement auto-generation for CORE-V Post Increment Load/Store
* Fix general issues in CORE-V Binutils-gdb and CORE-V GCC
* Clean Up CORE-V patches for Upstream Bintuils and Upstream GCC

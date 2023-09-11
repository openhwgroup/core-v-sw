# CORE-V GNU Tool Chain Monthly Report (September 2023)

## Overview

### From PLCT:

**NOTE** Zc* issues raised in CORE-V repositories will be fixed on the Upstream review patches

**Binutils**
  * RISC-V Zc* extensions are in Upstream Binutils, excluding Zcmt
  * RISC-V Zc* extensions are in CORE-V Binutils, excluding Zcmt
    * These Zc* patches are based on the 12 Apr 2023 version

**GCC**
  * RISC-V Zc* extensions are in Upstream GCC
  * RISC-V Zc* extensions are in CORE-V GCC
    * These Zc* patches are based on the 12 Apr 2023 version

### From Embecosm:

**NOTE** Patch for XCVmac and XCValu for upstream Binutils are being reviewed here:
  * [Binutils archive](https://sourceware.org/pipermail/binutils/2023-September/thread.html)

#### Fixed Issues (Reviewed and Merged or Closed):

**Binutils**
  * None.

**GCC**
  * **FIXED** [#64](https://github.com/openhwgroup/corev-gcc/issues/64) illegal operand error for "sw" operation
  * **FIXED** [#60](https://github.com/openhwgroup/corev-gcc/issues/60) Update naming for xcvmem instructions
  * **FIXED** [#54](https://github.com/openhwgroup/corev-gcc/issues/54) CORE-V: SIMD __builtin_riscv_cv_simd_neg_h and __builtin_riscv_cv_simd_neg_b needs implementing

#### Pull Request (Reviewed and Merged):

**Binutils**
  * None.

**GCC**
  * [#71](https://github.com/openhwgroup/corev-gcc/pull/71) Fixes to xcvbitmanip and xcvsimd
  * [#66](https://github.com/openhwgroup/corev-gcc/pull/66) Prevent non-xcvmem post-inc load/stores
  * [#65](https://github.com/openhwgroup/corev-gcc/pull/65) Added `__builtin_riscv_cv_simd_neg_[h,b]`
  * [#63](https://github.com/openhwgroup/corev-gcc/pull/63) Name change for post inc operands

#### Open Issues:

**Binutils**
  * **NEW** [#104](https://github.com/openhwgroup/corev-binutils-gdb/issues/104) Handle the range of the immediate shift and extract instructions
  * [#98](https://github.com/openhwgroup/corev-binutils-gdb/issues/98) Getting CORE-V ready for Upstream
  * [#96](https://github.com/openhwgroup/corev-binutils-gdb/issues/96) cv.avgu and cv.srl/sra/sll instructions out of sync
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single *.S-source bare metal code
  * [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file

**GCC**
  * [#70](https://github.com/openhwgroup/corev-gcc/issues/70) unrecognized opcode 'csrr' extension 'zicsr' required
  * [#68](https://github.com/openhwgroup/corev-gcc/issues/68) cv-simd-shufflei* incorrect builtin
  * [#67](https://github.com/openhwgroup/corev-gcc/issues/67) How to check COREV_CLUSTER for Event Load Instruction
  * [#58](https://github.com/openhwgroup/corev-gcc/issues/58) Post-inc memory access generation for -Os -Oz and -Og
  * [#55](https://github.com/openhwgroup/corev-gcc/issues/55) Getting CORE-V ready for Upstream
  * [#53](https://github.com/openhwgroup/corev-gcc/issues/53) CORE-V: SIMD Constraints "CV6" and "CS6" needs renaming
  * [#51](https://github.com/openhwgroup/corev-gcc/issues/51) Toolchain flags errors for xpulp SIMD ALU instuctions cv.avgu.sci.{.h/.b} with 6-bit unsigned decimal notation for Imm6 operand
  * [#48](https://github.com/openhwgroup/corev-gcc/issues/48) How IDEs gain awareness of Builtins?
  * [#39](https://github.com/openhwgroup/corev-gcc/issues/39) Builtins Implementation Status compared to LLVM
  * [#36](https://github.com/openhwgroup/corev-gcc/issues/36) Extensions state save and restore
  * **FIXED via upstream patch** [#35](https://github.com/openhwgroup/corev-gcc/issues/35) ra register is modified when Zcmp enabled
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)
  * [#30](https://github.com/openhwgroup/corev-gcc/issues/30) Attribute interrupt causes register corruption when Zcmp enabled
  * [#22](https://github.com/openhwgroup/corev-gcc/issues/22) Builtin optimisation enhancement
  * **FIXED via upstream patch** [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)
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
| Expected passes      |          15400 |         15410 |         +10 |
| Unexpected failures  |             85 |            85 |           - |
| Unexpected successes |              - |             - |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |              6 |             6 |           - |
| Unsupported tests    |            723 |           723 |           - |
```

Additional tests added in pull request [#66](https://github.com/openhwgroup/corev-gcc/pull/66) Prevent non-xcvmem post-inc load/stores

### Planned Events:
  * Rebase to add Windows support
  * Fix general issues in CORE-V Binutils-gdb and CORE-V GCC
  * Clean Up CORE-V XCVmac and XCValu patches for Upstream GCC

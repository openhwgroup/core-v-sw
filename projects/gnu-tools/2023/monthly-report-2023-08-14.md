# CORE-V GNU Tool Chain Monthly Report (August 2023)

## Overview

### From PLCT:

**NOTE:** Zc* patches are being reviewed here,
  * [Upstream GCC Review Patches](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/thread.html)
  * [Upstream Binutils Review Patches](https://sourceware.org/pipermail/binutils/2023-June/thread.html)

  * Zc* issues raised in CORE-V repositories will be fixed on the Upstream review patches

**Binutils**
  * RISC-V Zc* extensions are in CORE-V binutils-gdb, excluding Zcmt:
    * These Zc* patches are based on the 12 Apr 2023 version
  * All latest RISC-V Zc* patches are currently under review by the RISC-V team

**GCC**
  * RISC-V Zc* extensions are in CORE-V GCC:
    * These Zc* patches are based on the 12 Apr 2023 version
  * All latest RISC-V Zc* patches are currently under review by the RISC-V team

### From Embecosm:

**Binutils**
  
#### Fixed Issues (Reviewed and Merged or Closed):
  * **CLOSED** [#99](https://github.com/openhwgroup/corev-binutils-gdb/issues/99) CORE-V: All instructions in binutils are currently using lowercase
    * Since the disassembler can only print in lowercase, it was decided that Binutils will use lowercase too.
  * **FIXED** [#100](https://github.com/openhwgroup/corev-binutils-gdb/issues/100) Naming of cv.slet
    * Pull Request: [#103](https://github.com/openhwgroup/corev-binutils-gdb/pull/103) Renaming of cv.slet to cv.sle
  * **FIXED** [#101](https://github.com/openhwgroup/corev-binutils-gdb/issues/101) Update naming for xcvmem instructions
    * Pull Request: [#102](https://github.com/openhwgroup/corev-binutils-gdb/pull/102) Changed post inc instructions mnemonic

#### Pull Request (Reviewed and Merged):
  * [#103](https://github.com/openhwgroup/corev-binutils-gdb/pull/103) Renaming of cv.slet to cv.sle
  * [#102](https://github.com/openhwgroup/corev-binutils-gdb/pull/102) Changed post inc instructions mnemonic
  * [#97](https://github.com/openhwgroup/corev-binutils-gdb/pull/97) CORE-V: SIMD Update: cv.or.sci[.h,.b], cv.xor.sci[.h,.b], cv.and.sci[.h,.b], cv.avgu.sci[.h,.b]

**GCC**
#### Fixed Issues (Reviewed and Merged or Closed):
  * **FIXED** [#61](https://github.com/openhwgroup/corev-gcc/issues/61) latest released (02/Aug) gcc toolchain generates incorrect code.
    * Pull Request: [#62](https://github.com/openhwgroup/corev-gcc/pull/62) Post inc fixes
  * **CLOSED** [#56](https://github.com/openhwgroup/corev-gcc/issues/56) CORE-V: All instructions in builtins are currently using lowercase
  * **FIXED** [#49](https://github.com/openhwgroup/corev-gcc/issues/49) Toolchain flags errors for xpulp SIMD ALU instuctions cv.or.sci, cv.xor.sci, cv.and.sci with negative (signed) Imm6 operand
    * Pull Request: [#97](https://github.com/openhwgroup/corev-binutils-gdb/pull/97) CORE-V: SIMD Update: cv.or.sci[.h,.b], cv.xor.sci[.h,.b], cv.and.sci[.h,.b], cv.avgu.sci[.h,.b]

#### Pull Request (Reviewed and Merged):
  * [#62](https://github.com/openhwgroup/corev-gcc/pull/62) Post inc fixes
  * [#59](https://github.com/openhwgroup/corev-gcc/pull/59) Fixed operand order for xcvbitmanip instructions
  * [#57](https://github.com/openhwgroup/corev-gcc/pull/57) CORE-V: Auto-generation for Post-Increment Load & Store Instructions and Register-Register Load & Store Instructions
  * [#52](https://github.com/openhwgroup/corev-gcc/pull/52) CORE-V: SIMD Update: cv.avgu.sc{i}[.h,.b] builtins from signed to unsigned
  * [#50](https://github.com/openhwgroup/corev-gcc/pull/50) CORE-V: SIMD Update: Updated cv.pack and cv.pack.h builtins

#### Open Issues:

**Binutils**
  * [#98](https://github.com/openhwgroup/corev-binutils-gdb/issues/98) Getting CORE-V ready for Upstream
  * [#96](https://github.com/openhwgroup/corev-binutils-gdb/issues/96) cv.avgu and cv.srl/sra/sll instructions out of sync
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single *.S-source bare metal code
  * [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file

**GCC**
  * **NEW** [#60](https://github.com/openhwgroup/corev-gcc/issues/60) Update naming for xcvmem instructions
    * **OPEN** Pull Request: [#63](https://github.com/openhwgroup/corev-gcc/pull/63) Name change for post inc operands
  * **NEW** [#56](https://github.com/openhwgroup/corev-gcc/issues/56) Post-inc memory access generation for -Os -Oz and -Og
  * **NEW** [#55](https://github.com/openhwgroup/corev-gcc/issues/55) Getting CORE-V ready for Upstream
  * **NEW** [#54](https://github.com/openhwgroup/corev-gcc/issues/54) CORE-V: SIMD __builtin_riscv_cv_simd_neg_h and __builtin_riscv_cv_simd_neg_b needs implementing
  * **NEW** [#53](https://github.com/openhwgroup/corev-gcc/issues/53) CORE-V: SIMD Constraints "CV6" and "CS6" needs renaming
  * **NEW** [#51](https://github.com/openhwgroup/corev-gcc/issues/51) Toolchain flags errors for xpulp SIMD ALU instuctions cv.avgu.sci.{.h/.b} with 6-bit unsigned decimal notation for Imm6 operand
  * [#48](https://github.com/openhwgroup/corev-gcc/issues/48) How IDEs gain awareness of Builtins?
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

### RISC-V CORE-V GCC Test Results:
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |          14980 |         15400 |        +420 |
| Unexpected failures  |             53 |            85 |         +28 |
| Unexpected successes |              - |             - |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |              6 |             6 |           - |
| Unsupported tests    |            697 |           723 |         +26 |
```
There is an increase in expected passes and unsupported tests due to adding tests for xcvmem under [#57](https://github.com/openhwgroup/corev-gcc/pull/57) CORE-V: Auto-generation for Post-Increment Load & Store Instructions and Register-Register Load & Store Instructions.

There is an increase in unexpected failures due to [#56](https://github.com/openhwgroup/corev-gcc/issues/56) Post-inc memory access generation for -Os -Oz and -Og

### Planned Events:
* Implement Zcmt support in RISC-V Bintuils
* Clean Up Zc* patches for Upstream Bintuils and Upstream GCC
* Fix general issues in CORE-V Binutils-gdb and CORE-V GCC
* Clean Up CORE-V patches for Upstream Bintuils and Upstream GCC

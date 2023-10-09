# CORE-V GNU Tool Chain Monthly Report (October 2023)

## Overview

### From PLCT:

**Binutils**
  * RISC-V Zc* extensions are in Upstream Binutils, excluding Zcmt
    * Kito will help to resolve the problems in Zcmt jump table sequence

**GCC**
  * All RISC-V Zc* extensions are in Upstream GCC

### From Embecosm:

**NOTE** Patch for XCVmac and XCValu for upstream are being reviewed here:
  * [Binutils archive](https://sourceware.org/pipermail/binutils/2023-September/thread.html)
  * [GCC archive](https://gcc.gnu.org/pipermail/gcc-patches/2023-September/631729.html)

#### Fixed Issues (Reviewed and Merged or Closed):

**Binutils**
  * None.

**GCC**
  * **FIXED** [#68](https://github.com/openhwgroup/corev-gcc/issues/68) cv-simd-shufflei* incorrect builtin
  * **FIXED via rebase** [#53](https://github.com/openhwgroup/corev-gcc/issues/53) CORE-V: SIMD Constraints "CV6" and "CS6" needs renaming
  * **FIXED** [#51](https://github.com/openhwgroup/corev-gcc/issues/51) Toolchain flags errors for xpulp SIMD ALU instuctions cv.avgu.sci.{.h/.b} with 6-bit unsigned decimal notation for Imm6 operand
  * **FIXED via upstream patch** [#35](https://github.com/openhwgroup/corev-gcc/issues/35) ra register is modified when Zcmp enabled
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)
  * **FIXED via upstream patch** [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing
    * [Patch 0/4 RISC-V Support Zcmp Extension](https://gcc.gnu.org/pipermail/gcc-patches/2023-June/620869.html)

#### Pull Request (Reviewed and Merged):

**Binutils**
  * None.

**GCC**
  * [#72](https://github.com/openhwgroup/corev-gcc/pull/72) Fix cv.shuffle.b.sci immediate operand

#### Open Issues:

**Binutils**
  * [#104](https://github.com/openhwgroup/corev-binutils-gdb/issues/104) Handle the range of the immediate shift and extract instructions
  * [#98](https://github.com/openhwgroup/corev-binutils-gdb/issues/98) Getting CORE-V ready for Upstream
  * [#96](https://github.com/openhwgroup/corev-binutils-gdb/issues/96) cv.avgu and cv.srl/sra/sll instructions out of sync
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single .S-source bare metal code
  * [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file

**GCC**
  * **NEW** [#74](https://github.com/openhwgroup/corev-gcc/issues/74) [XCVmem] Normal register-immediate store not recognized
  * **NEW** [#73](https://github.com/openhwgroup/corev-gcc/issues/73) illegal operands `flw fa5,t2(s1)` is generated from the latest release toolchain (05/Sep)
  * [#70](https://github.com/openhwgroup/corev-gcc/issues/70) unrecognized opcode 'csrr' extension 'zicsr' required
  * [#67](https://github.com/openhwgroup/corev-gcc/issues/67) How to check COREV_CLUSTER for Event Load Instruction
  * [#58](https://github.com/openhwgroup/corev-gcc/issues/58) Post-inc memory access generation for -Os -Oz and -Og
  * [#55](https://github.com/openhwgroup/corev-gcc/issues/55) Getting CORE-V ready for Upstream
  * [#48](https://github.com/openhwgroup/corev-gcc/issues/48) How IDEs gain awareness of Builtins?
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

### RISC-V CORE-V GCC Test Results (riscv.exp):
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |          15410 |         22029 |       +6393 |
| Unexpected failures  |             85 |           173 |         +88 |
| Unexpected successes |              - |             - |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |              6 |             6 |           - |
| Unsupported tests    |            723 |          1268 |        +545 |
```

Increase in unexpected failures and unsupported tests caused by known upstream unexpected failures and unsupported tests

### Planned Events:
  * Fix general issues in CORE-V Binutils-gdb and CORE-V GCC
  * Clean Up CORE-V XCVelw, XCVbi and XCVbitmanip patches for Upstream GCC

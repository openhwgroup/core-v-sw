# CORE-V GNU Tool Chain Monthly Report (June 2023)

## Overview

### From PLCT:

**Binutils**
  * All latest RISC-V Zc* extensions are in CORE-V binutils-gdb, excluding Zcmt
  * RISC-V Zc* patch is currently under development
  * **PAUSED** RISC-V Zcmt patch is currently under development

**GCC**
  * All latest RISC-V Zc* extensions are in CORE-V GCC
  * All RISC-V Zc* patches are currently under review by the RISC-V team

### From Embecosm:

**Binutils**
  
#### Fixed Issues (Reviewed and Merged or Closed):
  * **FIXED** [#89](https://github.com/openhwgroup/corev-binutils-gdb/issues/89) The immediate field of shift instructions should be unsigned
    * Pull Request: [#91](https://github.com/openhwgroup/corev-binutils-gdb/pull/91) CV32E40Pv2 Update SIMD Instructions and Test
  * **FIXED** [#87](https://github.com/openhwgroup/corev-binutils-gdb/issues/87) Post-Increment Register-Immediate Load should be updated
    * Pull Request: [#90](https://github.com/openhwgroup/corev-binutils-gdb/pull/90) CV32E40Pv2 Update Post Increment Load/Store
  * **CLOSED** [#85](https://github.com/openhwgroup/corev-binutils-gdb/issues/85) Using hexadecimal value for instruction signed immediate seems restricted to positive values.
  * **FIXED** [#69](https://github.com/openhwgroup/corev-binutils-gdb/issues/69) CV32E40Pv2 Some multiplication instructions not existing anymore
    * Pull Request: [#92](https://github.com/openhwgroup/corev-binutils-gdb/pull/92) CV32E40Pv2 MAC pseudo-instructions

#### Pull Request (Reviewed and Merged):
  * [#90](https://github.com/openhwgroup/corev-binutils-gdb/pull/90) CV32E40Pv2 Update Post Increment Load/Store
  * [#91](https://github.com/openhwgroup/corev-binutils-gdb/pull/91) CV32E40Pv2 Update SIMD Instructions and Test
  * [#92](https://github.com/openhwgroup/corev-binutils-gdb/pull/92) CV32E40Pv2 MAC pseudo-instructions

**GCC**
#### Pull Request (Reviewed and Merged):
  * [#38](https://github.com/openhwgroup/corev-gcc/pull/38) CV32E40Pv2 Immediate Branch Auto-Generation Support
  * [#41](https://github.com/openhwgroup/corev-gcc/pull/41) Autogenerate for mac and msu builtins

#### Open Pull Request (Reviewed and Merged):
  * [#42](https://github.com/openhwgroup/corev-gcc/pull/42) CORE-V: Support CORE-V fast interrupts
  * [#43](https://github.com/openhwgroup/corev-gcc/pull/43) CORE-V: Fix typo in mac/msu tests

#### Open Issues:

Binutils
  * **NEW** [#93](https://github.com/openhwgroup/corev-binutils-gdb/issues/93) disassembler translate cv.insert machine code wrongly to cv.muls
  * [#88](https://github.com/openhwgroup/corev-binutils-gdb/issues/88) Zcmt relaxation of single *.S-source bare metal code
  * [#84](https://github.com/openhwgroup/corev-binutils-gdb/issues/84) ld segfault when linking .S assembly file

GCC
  * **NEW** [#40](https://github.com/openhwgroup/corev-gcc/issues/40) __builtin_riscv_cv_bitmanip_insert generate incorrect operand
  * **NEW** [#39](https://github.com/openhwgroup/corev-gcc/issues/39) Builtins Implementation Status compared to LLVM
  * **NEW** [#37](https://github.com/openhwgroup/corev-gcc/issues/37) GCC requires version number to be specified with architecture extensions
  * [#36](https://github.com/openhwgroup/corev-gcc/issues/36) Extensions state save and restore
  * [#35](https://github.com/openhwgroup/corev-gcc/issues/35) ra register is modified when Zcmp enabled
  * [#30](https://github.com/openhwgroup/corev-gcc/issues/30) Attribute interrupt causes register corruption when Zcmp enabled
  * [#22](https://github.com/openhwgroup/corev-gcc/issues/22) Builtin optimisation enhancement
  * [#20](https://github.com/openhwgroup/corev-gcc/issues/20) Zcmp CFI may need fixing
  * [#17](https://github.com/openhwgroup/corev-gcc/issues/17) DWARF error: mangled line number section

### RISC-V CORE-V Bintuils GNU Assembler Test Results:
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |           1264 |          1256 |          -8 |
| Unexpected failures  |              - |             - |           - |
| Unexpected successes |              - |             - |           - |
| Expected failures    |             25 |            25 |           - |
| Unresolved testcases |              - |             - |           - |
| Unsupported tests    |              9 |             9 |           - |
```
There is a decrease in expected passes due to removing redundant tests under [#90](https://github.com/openhwgroup/corev-binutils-gdb/pull/90) CV32E40Pv2 Update Post Increment Load/Store. 

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
No changes to GNU Linker results as there has been no changes to the Linker.

### RISC-V CORE-V GCC Test Results:
```
| Category             | Previous Month | Current Month |       Delta |
| :------------------- | -------------: | ------------: | ----------: |
| Expected passes      |          12508 |         12620 |        +112 |
| Unexpected failures  |             53 |            71 |         +18 |
| Unexpected successes |              - |               |           - |
| Expected failures    |              6 |             6 |           - |
| Unresolved testcases |              6 |            24 |         +18 |
| Unsupported tests    |            670 |           674 |          +4 |
```
There is an increase in expected passes and unsupported tests due to adding tests for auto-generation on Branch Immediate under [#38](https://github.com/openhwgroup/corev-gcc/pull/38) CV32E40Pv2 Immediate Branch Auto-Generation Support.

There is an increase in unexpected failures and unresolved testcases due to adding tests for auto-generation on Multiply-Accumulate cv.mac and cv.msu under [#41](https://github.com/openhwgroup/corev-gcc/pull/41) Autogenerate for mac and msu builtins.

This is fixed by PR [#43](https://github.com/openhwgroup/corev-gcc/pull/43) CORE-V: Fix typo in mac/msu tests.

### Planned Events:
* Implement Zcmt support in RISC-V Bintuils
* Clean Up Zc* patches in CORE-V Bintuils and CORE-V GCC
* Implement auto-generation for CORE-V Post Increment Load/Store
* Fix issues raised for CORE-V GCC builtins
* Fix general issues in CORE-V Binutils-gdb and CORE-V GCC

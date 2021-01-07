# Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* PPL was accepted

* CVA6
    * None

* CV32E40P
    * Added Hardware Loop support in LLVM integrated assembler
    * Added HWLP support to `clang` (not merged)
    * Added `memcpy` optimization with HWLP (not merged)
    * Added MAC support in LLVM integrated assembler (not merged)
    * Added three `-march` flags (`xcorev`, `xcorevhwlp`, `xcorevmac`) to LLVM (not
      merged)

### Test results (LLVM)

| Category    | Last Month | This Month | Delta |
| -----------:| ----------:| ----------:| -----:|
| PASS        | 34121      | 34183      | +62   |
| FAIL        | 0          | 0          | 0     |
| XPASS       | -          | -          | -     |
| XFAIL       | 151        | 151        | 0     |
| UNSUPPORTED | 539        | 539        | 0     |
| UNTESTED    | -          | -          | -     |
| UNRESOLVED  | -          | -          | -     |

* One test means one regression test file with multiple test cases in it.

### Planned activities for coming month

* Get things merged
* MAC builtins
* ALU operations support

### Risk Register

| Risk                                       | Impact (1-3) | Likelihood (1-10) | Risk (I\*L) | Mitigation                                                               |
|:------------------------------------------ | ------------:| -----------------:| -----------:|:------------------------------------------------------------------------ |
| Unable to test execution due to lack of HW | 3            | 3                 | 9           | HW parts are arriving at Embecosm                                        |
| Too few resources                          | 3            | 7                 | 21          | Get interested parties to invest time and/or money in the project        |
| No project manager                         | 3            | 7                 | 21          | Get a project manager to step forward from one of the interested parties |

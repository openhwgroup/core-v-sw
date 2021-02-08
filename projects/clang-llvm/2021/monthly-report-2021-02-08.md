# Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* CVA6
    * None

* CV32E40P
    * Add MAC instructions to integrated assembler (merged)
    * Add patterns for MAC instructions (awaiting review)
    * Add MAC builtins (WIP)

### Test results (LLVM)

| Category    | This Month | Last Month | Delta |
| -----------:| ----------:| ----------:| -----:|
| PASS        | 34229      | 34183      | +46   |
| FAIL        | 0          | 0          | 0     |
| XPASS       | -          | -          | -     |
| XFAIL       | 151        | 151        | 0     |
| UNSUPPORTED | 539        | 539        | 0     |
| UNTESTED    | -          | -          | -     |
| UNRESOLVED  | -          | -          | -     |

* One test means one regression test file with multiple test cases in it.

### Planned activities for coming month

* Port implementations from
  [ekut-es/pulp-llvm](https://github.com/ekut-es/pulp-llvm) to
  [openhwgroup/corev-llvm-project](https://github.com/openhwgroup/corev-llvm-project)

### Risk Register

* No changes

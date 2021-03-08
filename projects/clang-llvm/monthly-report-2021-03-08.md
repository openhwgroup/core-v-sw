# Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* CVA6
    * None

* CV32E40P
    * Add patterns for MAC instructions (merged)
    * Add Load & Store instructions to integrated assembler (merged)
    * Add ALU instructions to integrated assembler (merged)
    * Add patterns for Load & Store instructions (merged)
    * Add patterns for ALU instructions (merged)
    * Completed porting implementations of extensions from [ekut-es/pulp-llvm]
    * Add MAC builtins (WIP)
    * Add HWLP memcpy optimization (needs testing)

[ekut-es/pulp-llvm]: https://github.com/ekut-es/pulp-llvm
[openhwgroup/corev-llvm-project]: https://github.com/openhwgroup/corev-llvm-project

### Test results (LLVM)

| Category    | This Month | Last Month | Delta |
| -----------:| ----------:| ----------:| -----:|
| PASS        | 34268      | 34229      | +39   |
| FAIL        | 0          | 0          | 0     |
| XPASS       | -          | -          | -     |
| XFAIL       | 151        | 151        | 0     |
| UNSUPPORTED | 538        | 539        | -1    |
| UNTESTED    | -          | -          | -     |
| UNRESOLVED  | -          | -          | -     |

* One test means one regression test file with multiple test cases in it.
* Table changed from tests in `master` + PRs to just the tests in `master`

### Planned activities for coming month

* Port builtins from [ekut-es/pulp-llvm]
* Potentially port HWLP code generation from [ekut-es/pulp-llvm]

### Risk Register

* No changes

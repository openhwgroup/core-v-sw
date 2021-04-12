# Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* CVA6
    * None

* CV32E40P
    * Add HWLP code generation (WIP, waiting on review)
    * Add MAC builtins (WIP)
    * Add HWLP memcpy optimization (WIP)

### Test results (LLVM)

| Category    | This Month | Last Month | Delta |
| -----------:| ----------:| ----------:| -----:|
| PASS        | 34272      | 34268      | +4    |
| FAIL        | 0          | 0          | 0     |
| XPASS       | -          | -          | -     |
| XFAIL       | 151        | 151        | 0     |
| UNSUPPORTED | 538        | 538        | 0     |
| UNTESTED    | -          | -          | -     |
| UNRESOLVED  | -          | -          | -     |

* One test means one regression test file with multiple test cases in it.
* Table changed from tests in `master` + PRs to just the tests in `master`

### Planned activities for coming month

* Port builtins from [ekut-es/pulp-llvm]
* Do automated builds of the toolchain (Embecosm)

[ekut-es/pulp-llvm]: https://github.com/ekut-es/pulp-llvm

### Risk Register

* No changes

# Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* CVA6
  * review of directions
    * focus: base RV32gc/RV64gc, then extensions B, V (and later K)
    * objective: single multitarget toolchain for CV64A6 and CV32A6
    * outlook: use Linux as additional means of functional validation
  * current activity
    * QA assessment of LLVM 12.0.0-rc1 (review of status for bugs identified in v10/v11 using `riscv-dv`)

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

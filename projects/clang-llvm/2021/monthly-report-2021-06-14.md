# Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* CVA6
  * Check status of Clang+LLVM+LLD wrt. core-v-verif tests; key issues: floating-point, out-of-bound relocations

* CV32E40P
  * Port hardware loop code generation

### Test results (LLVM)

| Category    | This Month | Last Month | Delta |
| -----------:| ----------:| ----------:| -----:|
| PASS        | 34273      | 34272      | +1    |
| FAIL        | 0          | 0          | 0     |
| XPASS       | -          | -          | -     |
| XFAIL       | 151        | 151        | 0     |
| UNSUPPORTED | 538        | 538        | 0     |
| UNTESTED    | -          | -          | -     |
| UNRESOLVED  | -          | -          | -     |

### Planned activities for coming month

* CVA6:
  * Finalise LLVM / core-v-verif evaluation
  * Automate builds of the toolchain (Thales, externally accessible)
  * Basic benchmarking (performance, code size)

* CV32E40P:
  * Do automated builds of the toolchain (Embecosm)
  * Port builtins from [ekut-es/pulp-llvm]

[ekut-es/pulp-llvm]: https://github.com/ekut-es/pulp-llvm

### Risk Register

* No changes

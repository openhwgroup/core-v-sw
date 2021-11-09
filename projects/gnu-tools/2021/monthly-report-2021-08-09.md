# Software TG monthly meeting - CORE-V GNU Tool Chain update (August 2021)

## Overview

### Key activities

* Working on integrating GCC regression testsuite with PULP simulator
  - currently able to run GCC regression, however, ironing out issues with unresolved tests
* Binutils rebase pushed to OpenHW development branch
  - rebasing remaining instructions (post-increment & register-indexed load/store and immediate branching) before merge
* Writing GCC regression tests for multiply-accumulate and alu ops
  - finished MAC builtin tests and 80% of ALU builtin tests

### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 13         | 13         | -        |
| In progress | 5          | 5          | -        |
| Complete    | 18         | 18         | -        |

### Testing status

**GNU Binutils**

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 434        | 434          | -          | 288        | +146       |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 15         | 15           | -          | 15         | -          |
| UNSUPPORTED | 10         | 10           | -          | 10         | -          |
| UNTESTED    | -          | -            | -          | -          | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

LD

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 363        | 363          | -          | 357        | +6         |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 4          | 4            | -          | 4          | -          |
| UNSUPPORTED | 171        | 171          | -          | 171        | -          |
| UNTESTED    | 26         | 26           | -          | 26         | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

**GNU GCC**

* Hardware loops, multiply accumulate and general ALU operations testing in progress

### Risk register changes

No changes.

### Next stages

* Finalise integration of GCC regression with PULP simulator
* Merge post-increment & register-indexed load/store and immediate branching support in binutils-gdb to OpenHW repo
* Add post-increment & register-indexed load/store and immediate branching support to GCC
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations
* Upstream CORE-V support to binutils-gdb and GCC - awaiting mechanism of psABI vendor specific linker relocations
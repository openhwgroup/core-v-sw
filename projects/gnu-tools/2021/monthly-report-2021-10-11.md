# Software TG monthly meeting - CORE-V GNU Tool Chain update (October 2021)

## Overview

### Key activities

* Continuing work on integrating GCC regression testsuite with GVSoC simulator
  - Currently able to run GCC regression and now ironing out issues with unresolved/failing tests

### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 13         | 13         | -        |
| In progress | 3          | 3          | -        |
| Complete    | 20         | 20         | -        |

### Testing status

**GNU Binutils**

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 489        | 489          | -          | 355        | +134       |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 21         | 21           | -          | 21         | -          |
| UNSUPPORTED | 5          | 5            | -          | 5          | -          |
| UNTESTED    | -          | -            | -          | -          | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

LD

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 408        | 408          | -          | 402        | +6         |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 4          | 4            | -          | 4          | -          |
| UNSUPPORTED | 182        | 182          | -          | 182        | -          |
| UNTESTED    | 26         | 26           | -          | 26         | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

**GNU GCC**

* Hardware loops, multiply accumulate and general ALU operations testing in progress

### Risk register changes

No changes.

### Next stages

* Finalise integration of GCC regression with PULP simulator
* Add post-increment & register-indexed load/store and immediate branching support to GCC
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations
* Upstream CORE-V support to binutils-gdb and GCC - awaiting mechanism for psABI vendor specific linker relocations
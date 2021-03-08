# Software TG monthly meeting - CORE-V GNU Tool Chain update (March 2021)

## Overview

### Key activities

* Existing PULP simulator is being adapted to support CORE-V extensions
* Work on integrating GCC regression testsuite with simulator begun
* UOB team begin Embecosm consultancy

### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 13         | 13         | -        |
| In progress | 6          | 4          | +2       |
| Complete    | 17         | 17         | -        |

New tasks:
* Adapt existing PULP simulator to support CORE-V extentions (In progress)
* Integrate testing for GCC regression testsuite with simulator (In progress)

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

* Hardware loops, multiply accumulate and general ALU operations awaiting testing

### Risk register changes

No changes.

### Next stages

* Finalise CORE-V simulator incl. testing integration
* Merge post-increment & register-indexed load/store and immediate branching support in binutils-gdb to OpenHW repo
* Add post-increment & register-indexed load/store and immediate branching support to GCC
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations
* Upstream CORE-V support to binutils-gdb and GCC - awaiting mechanism of psABI vendor specific linker relocations
# Software TG monthly meeting - CORE-V GNU Tool Chain update (June 2021)

## Overview

### Key activities

* Working on integrating GCC regression testsuite with PULP simulator
* Began rebase of CORE-V binutils-gdb
* Editting blog post about using the PULP simulator

### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 13         | 13         | -        |
| In progress | 5          | 6          | -1       |
| Complete    | 18         | 17         | +1       |

Details:
Adapt PULP simulator to support CORE-V - Complete

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
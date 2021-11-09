# Software TG monthly meeting - CORE-V GNU Tool Chain update (September 2021)

## Overview

### Key activities

* Merged in remaining instruction sets (post-increment & register-indexed load/store and immediate branching) to binutils-gdb
  - All planned support for CORE-V extensions is now complete in binutils-gdb
* Working on integrating GCC regression testsuite with GVSoC simulator
  - Currently able to run GCC regression, however, ironing out issues with unresolved/failing tests
* Enrico Tabanelli and I will be presenting the CORE-V toolchain (including simulator) work at the GNU Tools Track of Linux Plumbers Conference on Thursday 23 September at 08:45 Pacific Time

### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 13         | 13         | -        |
| In progress | 3          | 5          | -2       |
| Complete    | 20         | 18         | +2       |

Details:
Merge Xcorevmem into OpenHW binutils-gdb - Complete
Merge Xcorevbi into OpenHW binutils-gdb - Complete

### Testing status

**GNU Binutils**

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 489        | 443          | +46        | 355        | +134       |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 21         | 21           | -          | 21         | -          |
| UNSUPPORTED | 5          | 5            | -          | 5          | -          |
| UNTESTED    | -          | -            | -          | -          | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

LD

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 408        | 406          | +2         | 402        | +6         |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 4          | 4            | -          | 4          | -          |
| UNSUPPORTED | 182        | 182          | -          | 182        | -          |
| UNTESTED    | 26         | 26           | -          | 26         | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

Note: Numbers have been adjusted to factor in re-base

**GNU GCC**

* Hardware loops, multiply accumulate and general ALU operations testing in progress

### Risk register changes

No changes.

### Next stages

* Finalise integration of GCC regression with PULP simulator
* Add post-increment & register-indexed load/store and immediate branching support to GCC
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations
* Upstream CORE-V support to binutils-gdb and GCC - awaiting mechanism for psABI vendor specific linker relocations
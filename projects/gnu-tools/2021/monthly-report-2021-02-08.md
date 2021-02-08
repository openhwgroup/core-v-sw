# Software TG monthly meeting - CORE-V GNU Tool Chain update (February 2021)

## Overview

### Key activities

* Pull request created for post-increment & register-indexed load/store support in binutils-gdb - pending merge (UOB)
* Pull request created for immediate branching in binutils-gdb - pending review (UOB)
* Begun adding post-increment and register-indexed load/store support to GCC (UOB)
* UOB team to carry out their work as consultants to Embecosm who have FSF copyright assignments in place

### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 13         | 7          | +6       |
| In progress | 4          | 4          | -        |
| Complete    | 17         | 11         | +6       |

Large changes due to small changes in tracking style.

New tasks:
* Upstream hwlp to OpenHW binutils-gdb (Complete)
* Upstream hwlp to OpenHW gcc (Unstarted)
* Upstream mac to OpenHW binutils-gdb (Complete)
* Upstream mac to OpenHW gcc (Unstarted)
* Upstream postinc to OpenHW binutils-gdb (In progress)
* Upstream postinc OpenHW gcc (Unstarted)
* Upstream bi to OpenHW binutils-gdb (In progress)
* Upstream bi OpenHW gcc (Unstarted)
* Upstream alu to OpenHW binutils-gdb (Complete)
* Upstream alu to OpenHW gcc (Unstarted)
* Upstream OpenHW binutils-gdb (Unstarted)
* Upstream OpenHW gcc (Unstarted)

### Testing status

**GNU Binutils**

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 434        | 376          | +58        | 288        | +146       |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 15         | 15           | -          | 15         | -          |
| UNSUPPORTED | 10         | 10           | -          | 10         | -          |
| UNTESTED    | -          | -            | -          | -          | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

LD

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 363        | 361          | +2         | 357        | +6         |
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

* Merge post-increment & register-indexed load/store and immediate branching support in binutils-gdb to OpenHW repo (UOB)
* Add post-increment & register-indexed load/store and immediate branching support to GCC (UOB)
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations (Embecosm)
* Upstream CORE-V support to binutils-gdb and GCC - awaiting mechanism of psABI vendor specific linker relocations and reliant on successful testing (UOB and Embecosm)
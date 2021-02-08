# Software TG monthly meeting - CORE-V GNU Tool Chain update (January 2021)

## Overview

### Key activities

* Pull request created for post-increment and register-indexed load/store support in GNU Binutils - pending changes from review (UOB/ETHZ)
* Began adding immediate branching instruction tests (UOB/ETHZ)
* Updated tests in all previously added instruction subsets to follow UOB/ETHZ and Embecosm agreed format (Embecosm)

### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 7          | 8          | -1       |
| In progress | 4          | 3          | +1       |
| Complete    | 11         | 11         | -        |

In progress:
* Add PI & RI L/S tests to binutils-gdb
* Add IB support to binutils-gdb
* Add IB tests to binutils-gdb (Updated status)
* Project management - ongoing

### Testing status

**GNU Binutils**

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 376        | 394          | -18        | 288        | +88        |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 15         | 15           | -          | 15         | -          |
| UNSUPPORTED | 10         | 10           | -          | 10         | -          |
| UNTESTED    | -          | -            | -          | -          | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

Not incl. PI & RI L/S and IB tests

LD

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 361        | 361          | -          | 357        | +4         |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 4          | 4            | -          | 4          | -          |
| UNSUPPORTED | 171        | 171          | -          | 171        | -          |
| UNTESTED    | 26         | 26           | -          | 26         | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

**GNU GCC**

* CORE-V hardware loops, multiply accumulate and general ALU operations awaiting hardware testing

### Risk register changes

No changes.

### Next stages

* Update post-increment and register-indexed load/store from review comments (UOB/ETHZ)
* Finish adding tests for immediate branching instructions (UOB/ETHZ)
* Add PI & RI L/S and IB support in binutils-gdb to OpenHW repos (UOB/ETHZ)
* Add PI & RI L/S and IB support to GNU GCC (UOB/ETHZ)
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations (Embecosm)
* Upstream CORE-V support to binutils-gdb and GCC - awaiting mechanism of psABI vendor specific linker relocations and reliant on successful hardware testing (UOB/ETHZ and Embecosm)
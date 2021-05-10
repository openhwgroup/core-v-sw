# Software TG monthly meeting - CORE-V GNU Tool Chain update / Bologna SW Team (May 2021)

## Overview

### Key activities

* Existing PULP simulator adapted to support CORE-V extensions - completion 
* Writing blog post on PULP simulator - In progress
* Working on integrating GCC regression testsuite with PULP simulator - In progress

### Testing status

**GNU Binutils**

GAS

| Category     | This Month   | Last Month   | Delta  | Baseline   | Delta  |
| -----------: | -----------: | -----------: | -----: | ---------: | ------:| 
| PASS         | 434          | 434          | -      | 288        | +146   |
| FAIL         | -            | -            | -      | -          | -      |
| XPASS        | -            | -            | -      | -          | -      |
| XFAIL        | 15           | 15           | -      | 15         | -      |
| UNSUPPORTED  | 10           | 10           | -      | 10         | -      |
| UNTESTED     | -            | -            | -      | -          | -      |
| UNRESOLVED   | -            | -            | -      | -          | -      |

LD

| Category     | This Month   | Last Month   | Delta  | Baseline   | Delta  |
| -----------: | -----------: | -----------: | -----: | ---------: | ------:| 
| PASS         | 363          | 363          | -      | 357        | +6     |
| FAIL         | -            | -            | -      | -          | -      |
| XPASS        | -            | -            | -      | -          | -      |
| XFAIL        | 4            | 4            | -      | 4          | -      |
| UNSUPPORTED  | 171          | 171          | -      | 171        | -      |
| UNTESTED     | 26           | 26           | -      | 26         | -      |
| UNRESOLVED   | -            | -            | -      | -          | -      |

**GNU GCC**

* Hardware loops, multiply accumulate and general ALU operations awaiting testing

### Next stages

* Finalise integrating GCC regression testsuite with PULP simulator
* Finalise PULP simulator blog post
* Merge post-increment & register-indexed load/store and immediate branching support in binutils-gdb to OpenHW repo
* Add post-increment & register-indexed load/store and immediate branching support to GCC
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations
* Upstream CORE-V support to binutils-gdb and GCC - awaiting mechanism of psABI vendor specific linker relocations
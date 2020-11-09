# Software TG monthly meeting - CORE-V GNU Tool Chain (November 2020)

## Overview

### Key activities

* University of Bologna and ETH Zurich to contribute 2 engineering months towards the project
* Added CORE-V multiply accumulate support to GNU Binutils incl. full testing - not yet in OpenHW repos
* Added CORE-V multiply accumulate support to GNU GCC, not tested as awaiting simulator - not yet in OpenHW repos
* Added new -march options: xcorevmac (supports the multiply accumulate subset) in both binutils and GCC

### Testing status

**GNU Binutils**

* Added 28 tests for multiply accumulate
* Added 6 new tests for hw loop to include -march options

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 304        | 338          | 34         | 288        | 50         |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 15         | 15           | -          | 15         | -          |
| UNSUPPORTED | 10         | 10           | -          | 10         | -          |
| UNTESTED    | -          | -            | -          | -          | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

LD

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 361        | 361          | -          | 357        | 4          |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 4          | 4            | -          | 4          | -          |
| UNSUPPORTED | 171        | 171          | -          | 171        | -          |
| UNTESTED    | 26         | 26           | -          | 26         | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

**GNU GCC**

* CORE-V hw loops and mac awaiting simulator testing before adding to OpenHW repos

### Next stages

* Finalise testing for GNU GCC CORE-V hw loops and mac
* Adding binutils-gdb and GCC changes to the OpenHW Group mirrors
* Upstreaming CORE-V support to binutils-gdb - awaiting mechanism of psABI vendor specific linker relocations
* Upstreaming CORE-V support to GCC - reliant on testing with simulator
* Repeat the process for each of the following groups of instructions as a joint effort between the University of Bologna and Embecosm, as per the preliminary project plan. i.e.
    * post-increment and register-indexed load/store: xcorevpostinc
    * direct branches: xcorevbi
    * general ALU operations: xcorevalu
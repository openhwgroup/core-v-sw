# Software TG monthly meeting - CORE-V GNU Tool Chain (December 2020)

## Overview

### Key activities

* Added multiply accumulate and general ALU operations support to GNU Binutils incl. full testing - in OpenHW repos (Embecosm)
* Added post-increment and register-indexed load/store support to GNU Binutils incl. full testing - not yet in OpenHW repos (UOB/ETHZ)
* Added general ALU operations support to GNU GCC, not tested as awaiting hardware - not yet in OpenHW repos (Embecosm)
* Started adding immediate branching instructions support to GNU Binutils (UOB/ETHZ)
* Added new -march option: xcorevalu (supports the general ALU operations subset) and xcorevpostinc (supports the post-increment and register-indexed load/store operations subset) in binutils and xcorevalu to GCC (UOB/ETHZ and Embecosm)
* Updated documentation to include all CORE-V extensions (found at: https://github.com/openhwgroup/core-v-docs/tree/master/cores/cv32e40p/user_manual)
* Formal policy proposal made to support vendor specific extensions 
* Proposal made to create the psABI task group


### Task status

| Category    | This Month | Last Month | Delta    |
| -----------:| ----------:| ----------:| --------:|
| Unstarted   | 8          | 11         | -3       |
| In progress | 3          | 3          | -        |
| Complete    | 11         | 6          | +5       |

In progress:
* Add PI & RI L/S tests to binutils-gdb
* Add IB support to binutils-gdb
* Project management - ongoing (new)

Completed:
* Update documentation to include CORE-V (new)
* Add PI & RI L/S support to binutils-gdb
* Add gen ALU ops support to binutils-gdb
* Add gen ALU ops tests to binutils-gdb
* Add gen ALU ops support to GCC

### Testing status

**GNU Binutils**

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 338        | 394          | 56         | 288        | 106        |
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

* CORE-V hardware loops, multiply accumulate and general ALU operations awaiting hardware testing

### Risk register changes

*   Four new risks added:
    * No suitable target to test against - low risk as awaiting delivery of hardware
    * University of Bologna / ETH Zurich cannot get FSF assignment - low risk as mitigation plan in place
    * Insufficient resources to continue work, 15 months of work predicted (8 months from Embecosm an 2 months from UOB/ETHZ provided) - high risk as 5 months work required
    * No mechanism in place in the psABI for vendor specific relocations - low risk as setting up the RISC-V psABI TG is in progress 

### Next stages

* Add and test CORE-V immediate branching in GNU Binutils (UOB/ETHZ)
* Add CORE-V post-increment and register-indexed load/store support in binutils-gdb to OpenHW repos (UOB/ETHZ)
* Add CORE-V post-increment and register-indexed load/store and immediate branching support to GNU GCC (UOB/ETHZ)
* Finalise GCC testing for CORE-V hardware loops, multiply accumulate and general ALU operations (Embecosm)
* Upstream CORE-V support to binutils-gdb and GCC- awaiting mechanism of psABI vendor specific linker relocations and reliant on successful hardware testing (UOB/ETHZ and Embecosm)
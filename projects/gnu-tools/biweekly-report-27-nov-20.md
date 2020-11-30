# CORE-V GNU Tool Chain monthly meeting (27 November 2020)

## Overview

### Key activities

* Added multiply accumulate support to GNU Binutils incl. full testing to OpenHW repos
* Added general ALU operations to GNU Binutils incl. full testing to OpenHW repos
* Added general ALU operations support to GNU GCC, not tested as awaiting simulator
* Added new -march option: xcorevalu (supports the general ALU operations subset) in both binutils and GCC
* Added post-increment and register-indexed load/store to GNU Binutils and begun adding tests
* Updated documentation to include all CORE-V extensions (found at: https://github.com/openhwgroup/core-v-docs/tree/master/cores/cv32e40p/user_manual)

### Testing status

**GNU Binutils**

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 394        | 338          | +56        | 288        | +106       |
| FAIL        | -          | -            | -          | -          | -          |
| XPASS       | -          | -            | -          | -          | -          |
| XFAIL       | 15         | 15           | -          | 15         | -          |
| UNSUPPORTED | 10         | 10           | -          | 10         | -          |
| UNTESTED    | -          | -            | -          | -          | -          |
| UNRESOLVED  | -          | -            | -          | -          | -          |

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

* CORE-V hw loops, mac and alu awaiting simulator testing before adding to OpenHW repos

### Risk register changes

*   Two new risks added:
    * No suitable target to test against - high risk as limits GCC testing
    * University of Bologna / ETH Zurich cannot get FSF assignment - low risk as mitigation plan in place

### Next stages

* Finish testing for post-increment and register-indexed load/store in GNU Binutils and add instruction set to GNU GCC
* Finalise testing for GNU GCC CORE-V hw loops, mac and alu
* Adding binutils-gdb and GCC changes to the OpenHW Group mirrors
* Upstreaming CORE-V support to binutils-gdb - awaiting mechanism of psABI vendor specific linker relocations
* Upstreaming CORE-V support to GCC - reliant on testing with simulator
* Repeat the process for direct branches (xcorevbi) as per the preliminary project plan
# Software TG monthly meeting - CORE-V GNU Tool Chain (October)

## Overview

### Key activities

* Preliminary Project Plan approved
* Added CORE-V hardware loop support to GNU Binutils - current version in openhw development repository
* Added CORE-V hardware loop support to GNU GCC, including a memcpy utilising hw loops for speed optimisation - not yet in openhw repos
* Added two -march options: xcorev (intended to support all extensions once added) and xcorevhwlp (supports the hw loop subset) in both Binutils and GCC

### Testing status

**GNU Binutils**

* CORE-V hw loops fully tested including failure cases for both GAS (assembler) and LD (linker)

GAS

| Category    | This Month | Last Month   | Delta      | Baseline   | Delta      |
| -----------:| ---------: | ---------:   | ---------: | ---------: | ---------: |
| PASS        | 304        | 304          | -          | 288        | 16         |
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

* CORE-V hw loops awaiting simulator testing before upstreamable

### Next stages

* Finalise testing for GNU GCC CORE-V hw loops
* Adding GCC changes to the OpenHW Group GCC mirror
* Upstreaming CORE-V support to binutils-gdb
* Upstreaming CORE-V support to gcc
* Repeat the process of hw loops for each of the following groups of instructions, as per the preliminary project plan. i.e.
    * multiply-accumulate: xcorevmac
    * post-increment and register-indexed load/store: xcorevpostinc
    * direct branches: xcorevbi
    * general ALU operations: xcorevalu
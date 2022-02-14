# CORE-V GNU Tool Chain Monthly Report (February 2022)

## Overview

### Key activities

From University of Bologna:

* Upstreaming CORE-V post-increment and register-indexed load/store
  support and tests to gcc - First pull request is ongoing (Two steps
  of internal reviews from Maxim Blinov and Jeremy Bennett have
  already been done).  Testsuite is currently composed by only
  compilation regression tests.  Execution tests are ongoing.

* Upstreaming CORE-V immediate branching support and tests to gcc -
  First internal review from Maxim Blinov and Jeremy Bennett is
  scheduled for Friday, 18 Feb 2022. Tests has not been added yet.

From PLCT:

* Work has been done on supporting the ZCE(code size reduction)
  extension on corev-gcc and corev-binutils. We had a PR and got some
  advise from OpenHW. Now we are updating the implement with those
  advise. We plan to finish this work within this month(Feb).

### Testing status

**GNU Binutils**

GAS

| Category    | Start      | Now          | Delta      |
| -----------:| ---------: | ---------:   | ---------: |
| PASS        | -          | -            | -          |
| FAIL        | -          | -            | -          |
| XPASS       | -          | -            | -          |
| XFAIL       | -          | -            | -          |
| UNSUPPORTED | -          | -            | -          |
| UNTESTED    | -          | -            | -          |
| UNRESOLVED  | -          | -            | -          |

LD

| Category    | Start      | Now          | Delta      |
| -----------:| ---------: | ---------:   | ---------: |
| PASS        | -          | -            | -          |
| FAIL        | -          | -            | -          |
| XPASS       | -          | -            | -          |
| XFAIL       | -          | -            | -          |
| UNSUPPORTED | -          | -            | -          |
| UNTESTED    | -          | -            | -          |
| UNRESOLVED  | -          | -            | -          |


**GCC**

GCC

| Category    | Start      | Now          | Delta      |
| -----------:| ---------: | ---------:   | ---------: |
| PASS        | 0          | 53           | +53        |
| FAIL        | 0          | 11           | +11        |
| XPASS       | -          | -            | -          |
| XFAIL       | -          | -            | -          |
| UNSUPPORTED | -          | -            | -          |
| UNTESTED    | -          | -            | -          |
| UNRESOLVED  | -          | -            | -          |


### Next stages

* Adding execution tests to corev testsuite targeting GVSoC simulation platform
* Finalizing the pull request for xcorevmem extensions to openhw repo
* Finalizing the first review of the xcorevbi extensions
# CORE-V GNU Tool Chain Monthly Report (February 2022)

## Overview

### Key activities

From University of Bologna:

Key activities

 * Upstreaming CORE-V post-increment and register-indexed load/store
   support and tests to gcc - First pull request is on going (Two
   steps of internal reviews from Maxim Blinov and Jeremy Bennett has
   already been done). Testsuite is currently composed by compilation
   and execution regression tests. Outcome: Issue with lb, lbu, and sb
   occurs. It might be due to diffeent cost functions.

 * Upstreaming CORE-V immediate branching support and tests to gcc -
   First internal review from Maxim Blinov and Jeremy Bennett has been
   done. Outcome: Clean up the code since it might be redundant.

 # Next stage:


 * Fixing issue with load/store byte instructions
 * Finalizing the pull request for xcorevmem extensions to openhw repo
 * Finalizing the second review of the xcorevbi extensions


From PLCT:

 * Support for extending the ZCA, ZCF, ZCB and ZCMB extension has been
   completed, together with a comprehensive testsuite.

 * Next stage will be to develop ZCMP support.

 * Work will be rebased on latest compiler.

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
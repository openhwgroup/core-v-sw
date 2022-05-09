# CORE-V GNU Tool Chain Monthly Report (February 2022)

## Overview

From University of Bologna:

### Key activities

* Upstreaming CORE-V immediate branching support and tests to gcc -
Rabasing on top of the openhw repo

### Next stages

* Fixing issue with load/store byte instructions
* Finalizing the pull request for xcorevmem extensions to openhw repo
* Finalizing the pull request for xcorevbi extensions to openhw repo

From PLCT:

### Key activities

* We had finished the development work for code-size-reduction
  extension, and rebase it into corev-gcc/binutils branches.

### Next stages:
* Meet some regression bugs on ld and trying to fix them.

### University of Bologna Testing status

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
| PASS        | 63         | 63           | -          |
| FAIL        | 11         | 11           | -          |
| XPASS       | -          | -            | -          |
| XFAIL       | -          | -            | -          |
| UNSUPPORTED | -          | -            | -          |
| UNTESTED    | -          | -            | -          |
| UNRESOLVED  | -          | -            | -          |
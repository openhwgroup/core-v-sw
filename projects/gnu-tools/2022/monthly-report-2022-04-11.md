# CORE-V GNU Tool Chain Monthly Report (February 2022)

## Overview

### Key activities

From University of Bologna:

Key activities

 * Upstreaming CORE-V immediate branching support and tests to gcc
 * Cleaning up the code from redundancies.
 * riscv.c has needed changes to avoid forcing register for operand 1.

### Next stage:

 * Fixing issue with load/store byte instructions
 * Finalizing the pull request for xcorevmem extensions to openhw repo
 * Finalizing the pull request for xcorevbi extensions to openhw repo

From PLCT:

 * We had finished ZC extension development works in the past month,
   now we are working on debugging and benchmarking jobs.

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
| PASS        | 53         | 63           | +10        |
| FAIL        | 11         | 11           | -          |
| XPASS       | -          | -            | -          |
| XFAIL       | -          | -            | -          |
| UNSUPPORTED | -          | -            | -          |
| UNTESTED    | -          | -            | -          |
| UNRESOLVED  | -          | -            | -          |

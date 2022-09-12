# CORE-V GNU Tool Chain Monthly Report (August 2022)

## Overview

From University of Bologna:

### Key activities

* Integrating and testing mem extensions
* Rrebased the repo with the upstream version.
* The regression summary of cv-mem-* tests is the following:

```
                === gcc Summary ===

# of expected passes            594
# of unexpected failures        218
# of expected failures          62        /* with -O0 the auto-inc-dec pass is disabled */
```

Several tests fail with the new testing framework that loops on different compile options and flags, and they may be skipped.

From PLCT:

### Key activities

* Written the testsuites for ZC extension
* Do code size test on Embench and published the result
* Sync work to RISC-V code-size-reduction TG


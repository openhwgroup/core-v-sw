# Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* CVA6
  * Decision to use upstream compiler unmodified (except bug fixes - to be contributed back to upstream)
  * Initial QA review of LLVM 12.0.0 on CVA6 test suites
    * smoke tests using an all-LLVM toolchain (Clang + LLVM + LLD)
    * identified 1 (one) known issue related to LLD: relaxation not supported in presence of alignment directives
    * identified mandatory changes to end-user projets (explicit `--sysroot=` option)
  * Concern about size of prebuild binaries
    * current size of 'release' distribution including C library: 1GB compressed

* CV32E40P
  * None

### Test results (LLVM)

* No changes

### Planned activities for coming month

* CVA6:
  * complete the QA assessment on all CVA6 test suites (64b and 32b)
  * qualification tests on libs (newlib, GMP, etc.)
  * validate end-to-end toolchain flow including BSP integration

* CV32E40P:
  * Do automated builds of the toolchain (Embecosm)
  * Port builtins from [ekut-es/pulp-llvm]

[ekut-es/pulp-llvm]: https://github.com/ekut-es/pulp-llvm

### Risk Register

* No changes

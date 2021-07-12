oftware TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

### Key activities

* CVA6 (Thales)
  * automate LLVM builds using same scripts as for GNU binutils, GCC and newlib
    * supports both LLD and GNU binutils linking 
  * Extend floating point support at assembly level (handle signaling NaNs)
    * to be upstreamed
  * Introduce dual testing path according to the choice of linker: with LLD and with GNU ("BFD") binutils
  * Adapt LLVM-specific CI (Continuous Integration) to CVA6 project restructuring (`cva6_reorg`)

* CV32E40P
  * ...

### Test results (LLVM)

TBA

### CVA6 test results on Thales "new" CI (GCC/LLVM+LLD/LLVM, PASS/FAIL only)

| Test suite, arch    | GCC        | LLVM+LLD   | LLVM+BFD.LD |
| -----------:| ----------:| ----------:|------------:|
| riscv-compliance, rv64gc |  171/0 |  171/0    |  171/0 |
| riscv-compliance, rv32imac | N/A yet | N/A yet | N/A yet |
| riscv-compliance, rv32ima  | N/A yet | N/A yet | N/A yet |
| riscv-tests, rv64gc-p |  106/0 | N/A yet | N/A yet |
| riscv-tests, rv64gc-v |  117/0 | N/A yet | N/A yet |
| riscv-tests, rv32imac-p | N/A yet | N/A yet | N/A yet |
| riscv-tests, rv32imac-p | N/A yet | N/A yet | N/A yet |
| riscv-tests, rv32ima-p | N/A yet | N/A yet | N/A yet |
| riscv-tests, rv32ima-p | N/A yet | N/A yet | N/A yet |

### Planned activities for coming month

* CVA6 (Thales)
  * Finalise `cva6_reorg` changes to CI
  * Complete the test result matrix
  * Publish updated scripts for automated builds of the toolchain (@Thales, externally accessible)
  * Basic benchmarking (performance, code size)

* CV32E40P
  * ...

### Risk Register

* No changes

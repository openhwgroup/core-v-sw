# CORE-V GNU Tool Chain Monthly Report (January 2023)

## Overview

From University of Bologna:

### Key activities

#### GCC
* Pull Request to add branching immediate instructions and testcases

```
                === gcc Summary ===

# of expected passes        2736
# of unexpected failures      53
# of expected failures         6
# of unresolved testcases      6
# of unsupported tests       201
```

From PLCT:

### Key activities

#### Binutils
* Fix issues with ZCMT
* Added ld testcases for ZCMT
* Added --zcmt-force-table-jump option

#### GCC
* Fix issues with ZCMT
* Extended RVC to RVC*ZCA

From Embecosm:

### Key activities

#### Binutils
* Added Event Load Instructions and Testcases
* Added SIMD Instructions and Testcases
* Added Bit Manipulation Instructions and Testcases
* Updated CV32E40Pv1 Encodings for CV32E40Pv2:
    * Multiply Accumulate
    * General ALU Operations
    * Immediate Branching

```
		=== gas Summary ===

# of expected passes        1268
# of expected failures        23
# of unsupported tests         9
```

#### GCC
* Added Event Load Builtin and Testcase

```
		=== gcc Summary ===

# of expected passes        2589
# of unexpected failures      53
# of expected failures         6
# of unresolved testcases      6
# of unsupported tests       201
```

Planned Events:
* Update CV32E40Pv1 Encodings for CV32E40Pv2:
    * Hardware Loops
    * Post-incrementing Load/Store
* Add SIMD builtins and testcases
* Fix issues with ZCMT in Binutils
* Continue discussion on CORE-V builtin names in GCC

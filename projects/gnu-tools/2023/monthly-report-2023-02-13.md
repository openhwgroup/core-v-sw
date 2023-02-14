# CORE-V GNU Tool Chain Monthly Report (February 2023)

## Overview

From University of Bologna:

### Key activities

#### GCC
* Open Pull Request:
  * [Implemented PULP Branching Immediate Instructions and GCC Tests](https://github.com/openhwgroup/corev-gcc/pull/9)

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
* Working on issues with ZCMT
* Cleaning up issues in Binutils with Zc*

* Open Pull Request:
  * Reviewing [Update Zc* to Version 1.0.1](https://github.com/openhwgroup/corev-binutils-gdb/pull/65)

From Embecosm:

### Key activities

#### Binutils
* Reviewed and Merged Pull Requests:
  * [Updated CV32E40Pv2 Hardware Loop Encodings](https://github.com/openhwgroup/corev-binutils-gdb/pull/60)
  * [Added New CV32340Pv2 Hardware Loop Instructions](https://github.com/openhwgroup/corev-binutils-gdb/pull/62)
  * [Updated CV32E40Pv2 Post-incrementing Load/Store](https://github.com/openhwgroup/corev-binutils-gdb/pull/61)

* Fixed Issues:
  * [Fixed CV32E40Pv2 Bit Manipulation Immediate Order](https://github.com/openhwgroup/corev-binutils-gdb/pull/71)
  * [Fixed CV32E4OPv2 Immediate Branching Relocation Tests](https://github.com/openhwgroup/corev-binutils-gdb/pull/72)

* Open Pull Requests:
  * [Fixed CV32340Pv2 SIMD Unsigned Immediate Instructions](https://github.com/openhwgroup/corev-binutils-gdb/pull/74)

```
		=== gas Summary ===

# of expected passes        1270
# of expected failures        23
# of unsupported tests         9
```

#### GCC
* Reviewed and Merged Pull Requests:
  * [Implemented CV32E40Pv2 Multiply-Accumulate Builtins](https://github.com/openhwgroup/corev-gcc/pull/18)

* Open Pull Requests:
  * [Implemented CV32E40Pv2 SIMD Builtins](https://github.com/openhwgroup/corev-gcc/pull/19)
  * [CORE-V GCC Builtin Specification](https://github.com/openhwgroup/core-v-sw/blob/master/specifications/corev-builtin-spec.md)

```
		=== gcc Summary ===

# of expected passes		3681
# of unexpected failures	53
# of expected failures		6
# of unresolved testcases	6
# of unsupported tests		233
```

Planned Events:
* Fix issues with ZCMT in Binutils and GCC
* Fix issues with CV32E40Pv2 in Binutils
* Continue discussion on CORE-V builtin names in GCC
* Implement CV32E40Pv2 SIMD Builtins in GCC
* Implement CV32E40Pv2 General ALU Builtins in GCC
* Implement CV32E40Pv2 Bit Manipulation Builtins in GCC

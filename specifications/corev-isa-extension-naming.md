# CORE-V ISA Extension Naming

## History

| Date        | Version | Notes                                                 |
| :---------- | :------ | :---------------------------------------------------- |
| 28 Nov 2022 | 1.0     | First version as approved by TWG of 28 Nov 2022.      |

## Executive summary

- CORE-V ISA extension names will use the prefix `xcv`.
- There are no shorthand names defined for groups of ISA extensions.
- Versioning of ISA extensions will not be supported for CORE-V.

## Context

Various CV32E4x cores have defined ISA extensions. The compiler tool chains need to know which ISA extensions are enabled.  This is the `-march` option to GNU and LLVM tools. The format is defined by RISC-V International, and non-standard ISA extensions must begin with ‘X’

We currently have 8 ISA extensions defined.  Three different implementations currently define different encodings for thes extensions.

- CV32E40P version 1 (the original PULP encoding, which is not RISC-V compliant)
- CV32E40P version 2 (a RISC-V compliant encoding)
- CV32E41P (a different RISC-V compliant encoding)

Of these only CV32E40P version 2 actually plans to implement the ISA extensions.

The RISC-V standards at present embody the concept of different versions of an ISA extension, potentially providing a way to support multiple encodings.

This document provides the agreed OpenHW Group position on the following questions.

- How should CORE-V ISA extensions be named?
- Should there be shorthands to specify groups of extensions, and if so, what should these be?
- What versioning of the extensions, if any, short be supported?

## CORE-V ISA extension naming

For conciseness, all CORE-V ISA extensions should use the prefix `xcv`.  At the time of writing, the following are defined:

- `xcvhwlp` (hardware loops)
- `xcvmac` (multiply-accumulate)
- `xcvbi` (immediate branch)
- `xcvmem` (post-indexed and register-indexed memory access)
- `xcvalu` (miscellaneous ALU operations)
- `xcvsimd` (PULP 8/16-bit SIMD)
- `xcvbitmanip` (PULP bit manipulation)
- `xcvelw` (event load word)

## CORE-V shorthand for multiple extensions

There is no concensus as to what combinations of ISA extensions would be useful, nor of how such shorthands should be named.  Therefore at this time, no shorthands are defined.

## Versioning

At present:

- versioning of ISA extensions is missing/incomplete in the GNU and LLVM tool chains;
- RISC-V international plans to remove versioning of ISA extensions from the new standard; and
- only one CORE-V implementation (CV32E40P version 2) currently implements any extensions.

CORE-V will therefore not support versioning of ISA extensions, and for the 8 extensions described above will use the encoding in the CV32E40P version 2. Should a future processor need an extension with different encodings, that extension will just be given a different name.

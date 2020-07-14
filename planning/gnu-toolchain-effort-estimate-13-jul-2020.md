# CORE-V GNU Tool Chain Plan

The [PULP RISC-V GNU Toolchain](https://github.com/pulp-platform/pulp-riscv-gnu-toolchain) is based on upstream commits from 2017. All of the
PULP development work on top of these commits and is not upstreamed.

This plan summarizes estimates to bring CV32E40P features to the latest
toolchain.

# Features
Prioritize features by inclusion status for CV32E40P in [CV32E40* Features and Parameters](https://github.com/openhwgroup/core-v-docs/blob/master/cores/cv32e40p/CV32E40P_and%20CV32E40_Features_Parameters.pdf):
  * "Yes" = always enabled
  * "Optional" = optionally enabled
  * "Tentative" = optionally enabled. May be partially verified within BHAG timeframe, absence of feature does not need verifying for BHAG.

No known dependencies between features.

## Phase 1: Always Enabled Features
### Bit manipulation

Minimal support is assembler/disassembler, builtins/intrinsics, simple RTL patterns for CV32E40P.

**Minimal support: 2 engineer months**

**Full optimization in compiler: 6+ engineer months**

* 16 instructions for bit manipulation:
  * extracting/inserting bits
  * setting/clearing bits
  * finding the first or last set bit
  * counting consecutive leading bits or number of set bits
  * rotating right
  * bit reversal (`p.bitrev` only enabled for `Xgap9`. Not in RI5CY User Manual
  but is in CV32 User Manual.)

* Assembler needs to handle non-standard instruction format.

* Instructions uses `OP` opcode space:
  * Immediate instructions should be `OP-IMM` or else not upstreamable.
  * May conflict with a future standard extension.
  * Encodings may change if standardized.

* Some constraints are missing from the CORE-V-Docs Documentation, e.g.
`p.extract` "Is3 + Is2 must be <= 32" and the semantics written differently.
* Source contains undocumented aliases `p.<opcode>i` for some `p.<opcode>` 
instructions.

### SIMD

Minimal support is assembler/disassembler, builtins/intrinsics, simple RTL patterns for CV32E40P.

**Minimal support: 5 engineer months**

**Vectorizing optimization in compiler: 1+ engineer years (TODO much bigger)**

Various SIMD operations:
* 23 ALU (arithmetic, logic, insertion/extraction)
* 12 dot product
* 13 shuffle/pack
* 10 comparison
* 4 complex number ops

Instructions use `reserved` opcode space:
* Probably prevents upstreaming.
* May conflict with future standard extensions.
* Encodings may change if standardized.

### Post-increment load/store

Minimal support is assembler/disassembler, simple RTL patterns for CV32E40P.

**Minimal support: 2 engineer months**

**Full optimization in compiler: 6+ engineer months**

24 instructions:
  * 15 load operations (Reg-Imm post inc, Reg-Reg post inc, Reg-Reg)
  * 9 store operations (fewer because no unsigned variants)

Instructions use `custom-0` opcode space:
  * **Must** be moved if standardized.
  * A discussion to be had on whether this is good or bad for upstreaming.
  * May conflict with other custom extensions (this won't matter unless CORE-V wants to use them).

### PULP general ALU

Minimal support is assembler/disassembler, builtins/intrinsics, simple RTL patterns for CV32E40P.

**Minimal support: 3 engineer months**

**Full optimization in compiler: 1+ engineer years**

51 instructions:
* 1 abs
* 2 slet
* 4 min/max
* 4 extend HI/QI
* 4 clip
* 16 add/subtract then logical/arithmetic right shift
* 22 multiply-accumulate

Add/subtract then shift instructions use `custom-3` opcode:
  * **Must** be moved if standardized.
  * A discussion to be had on whether this is good or bad for upstreaming.
  * May conflict with other custom extensions (this won't matter unless CORE-V wants to use them).

20 multiply-accumulate instructions use the `custom-2` opcode.
  * **Must** be moved if standardized.
  * A discussion to be had on whether this is good or bad for upstreaming.
  * May conflict with other custom extensions (this won't matter unless CORE-V wants to use them).

Remaining instructions use `OP` opcode:
  * May conflict with a future standard extension.
  * Encodings may change if standardized.

Non-standard instruction format for add/subtract then shift and
multiply-accumulate, assembler will need modifying to handle this.

### PULP immediate branching

Minimal support is assembler/disassembler and linker relocations for CV32E40P.

**Minimal support: 1 engineer month**

**Adding optimization to compiler: 2+ engineer months**

`p.beqimm` and `p.bneimm`. Branch to PC + imm12 << 1, conditional on imm5.

Not used in GCC. Requires custom relocations in linker?

Non-standard instruction format, assembler will need modifying to handle this.

Instructions use the BRANCH opcode:
  * May conflict with future standard extensions.
  * Encoding may change if standardized.

## Phase 2: Optional Features
### HW loop

Minimal support is assembler/disassembler, linker relocations and implement
target hook in GCC for CV32E40P.

**Full support: 2 engineer months**

Relies on 6 insns.

Instructions use `custom-3` opcode:
  * **Must** be moved if standardized.
  * A discussion to be had on whether this is good or bad for upstreaming.
  * May conflict with other custom extensions (this won't matter unless CORE-V wants to use them).

Non-standard instruction format, assembler requires modifying to handle this.

~700 lines of code added to GCC to support this feature.

Requires custom relocations `R_RISCV_REL12` and `R_RISCV_RELU5` to be added to
linker.

## Phase 3: Tentative Features
### Xpulpzfinx

Minimal support is assembler/disassembler, builtins/intrinsics and integer
compiler with hand-written libgcc for CV32E40P.
 
**Minimal support: 10 engineer months (of which 8 months is libgcc)**

**Automatic generation in compiler: needs further analysis**

Use integer registers with the F extension.

Currently enabled in `pulp-gnu-riscv-toolchain` with `-mfpint`.

#### PULP cluster extension (Xpulpcluster)

Minimal support is assembler/disassembler, builtins/intrinsics for CV32E40P.

**Minimal support: 2 engineer weeks**

**Full support in compiler: needs further analysis (OpenMP)** 

Uses event load instruction `p.elw` i.e. load word and possibly sleep. Used for
`pulp_omp_barrier` and `pulp_omp_critical_start`.

`p.elw` uses the LOAD opcode space:
  * May conflict with future standard extensions.
  * Should it be required to work with rv64, it already conflicts with `lwu`,
  barrier to upstreaming and conflict with CV64.
  * Encoding may change if standardized.

Adding the instruction is straight-forward. If OpenMP support is required, that
will require further investigation.

Related options:
  * `-mPE=N` - set PE cluster count to N.

Notes:
* `riscv_explicit_load_store` defined but not used anywhere.

## Other unspecified features

Everything above this section is in the official CV32E40* spec. The following
features were found in the source code and are undocumented.

### Pipepline model

**Port existing simple model: 2 engineer weeks**

**Optimize model: 3+ engineer months**

Provide GCC with a pipeline model to improve scheduling.

To optimize the model will require benchmarking/profiling and inspection of
assembly.

### Undocumented features/options found in source code

Unless stated, these are not considered in the plan.

* Undocumented linker changes:
  * Custom relocations `R_RISCV_12_I`, `R_RISCV_12_S`, `R_RISCV_REL12`,
  `R_RISCV_RELU5`. Required for hw loop and immediate branching.
  * `-mComp` - "component mode" offsets are relative to section head.
  * `-mDIE` - dump import and export sections
  * Dynamic relocation
* Many other `-m` options added:
  * `-mchip`
  * `-mcpu` - RISC-V doesn't use `-mcpu`, use `-march` and `-mtune` instead.
  * `-mconf=CONF` - Conf= all, fc, cluster, default is all.
  * `-mFC` - "0: without FC, 1: with FC"
  * `'-mL2=SIZE` - "Set L2 size to SIZE". Not used.
  * `'-mL1Cl=SIZE' - "Set Cluster L1 size to SIZE". Not used.
  * `'-mL1Fc=SIZE' - "Set Fabric Controller L1 size to SIZE". Not used.
  * `-mreg=N` - use first N regs of integer register file (min N=16).
  * `-mf16` and `-mf16alt` - small float.
  * `-mdf` - map double to float.
  * `-mfpdouble` - "Specify which format for double"
  * `-mPE=N` - set PE cluster count to N.
  * `-mnativeomp
  * Several `-m` flags to toggle instructions. If required, should be handled
  as subextensions.
* Changes for __attribute__((interrupt)), probably superceded by upstream.
* Default multilib list overwritten.

# Upstreaming

Our proposal is to create a new vendor version of the target i.e.
`riscv*-corev-elf-` rather than `riscv*-unknown-elf-`. In order to be accepted,
we will need to establish OpenHW as a standardization body supplementary to the
RISC-V foundation.

Without standardization and ratification of PULP extensions (or policy change),
it is highly unlikely they will be accepted upstream.

The proposal is to start with upstreaming of binutils and GDB.

* Make sure specs are well-defined.
* Must have tests.
* Do not break non-PULP targets.
* Handle flags/parameters consistently.
* Opcodes may need redefining.

# Testing
Run baseline tests of upstream from 2017 and pulp-gnu-riscv-toolchain. Have
PULP extensions broken anything standard?

There are no tests for new features added by PULP. These are essential to check
existing and new implementations work and are a prerequisite for upstreaming.
The time for creating tests is factored into the feature estimates above.

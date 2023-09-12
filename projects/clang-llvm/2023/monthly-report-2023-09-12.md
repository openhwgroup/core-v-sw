1. Summary
- Title of the project: LLVM Tool Chain for CV32E40PV2
- Date of the report: 2023-09-12
- Prepared by: Paolo Savini


2. Activities and progress since last report
- Planned
  - Embecosm:
    - Review clang builtins for xcvmac: WIP.
    - Review clang builtins for xcvelw: WIP.
    - Review clang builtins for xcvalu: Implemented. Under review. To be upstreamed.
    - Review upstream patches:
      - xcvbitmanip intrinsics (D157510) under review
      - xcvmem encodings (D158824) under review
      - xcvelw encodings (D158824) under review
  
  - PLCT: 
    - Clang builtins for xcvmac: WIP.
    - Clang builtins for xcvelw: WIP.
    - Clang builtins for xcvalu: Implemented. Under review. To be upstreamed.
    - Get upstream patches to be accepted:
      - xcvbitmanip intrinsics (D157510) under review
      - xcvmem encodings (D158824) under review
      - xcvelw encodings (D158824) under review

3. Planned activities
- Embecosm:
  - Review clang builtins for xcvmac
  - Review clang builtins for xcvelw
  - Review clang builtins for xcvbitmanip
  - Review clang builtins for xcvalu: Prepare for upstream.
  - Review upstream patches:
    - xcvbitmanip intrinsics (D157510) under review
    - xcvmem encodings (D158824) under review
    - xcvelw encodings (D158824) under review

- PLCT: 
  - Clang builtins for xcvmac
  - Clang builtins for xcvelw
  - Clang builtins for xcvbitmanip
  - Clang builtins for xcvalu: Prepare for upstream.
  - Get upstream patches to be accepted:
    - xcvbitmanip intrinsics (D157510) under review
    - xcvmem encodings (D158824) under review
    - xcvelw encodings (D158824) under review

4. Milestones

Milestone listed here come from the 2023 workplan [here](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/COREV_LLVM_Plan_Approved_2023.md)

Milestones here are coded as XXY with XX one or two characters to mean the category of mylestone (Assembler, Compiler Options, CodeGen, Hardware Loop) and Y the number of the milestone.

The completion state of a milestone is a percentage that depends on the internal stages of the work. E.g. for CG patches LLVM intrinsics and Clang builtins need to be created, so the progress can be measured as 50% for a merged patch with LLVM instrinsics and 100% for a consecutive merged patch with Clang builtins. A 100% is reached when the patch lands upstream.

| Milestone | Target     | Completion |
| --------- | ---------- | ---------- |
| A1        | 2023-02-28 | COMPLETE   |
| A2        | 2023-03-30 | COMPLETE   |
| A3        | 2023-04-30 | COMPLETE   |
| CO        | 2023-05-30 | COMPLETE   |
| CG1       | 2023-07-30 | COMPLETE   |
| CG2       | 2023-09-30 | COMPLETE   |
| CG3       | 2023-10-30 | 50%        |
| CG4       | 2023-11-30 | 0%         |
| HL        | 2023-12-30 | 0%         |

5. Gate status & schedule

|	Gate	| Original plan	| Current plan	| Achieved  	| Link to last gate document and notes |
|	----	| ------------- | ------------- | ----------- | ------------------------------------ |
|	PC	  | 2020-11-21	  | 2020-11-21	  | 2020-11-21	| Approved on 2020-11-21 as PPL [LLVM-Toolchain-PPL](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/llvm-toolchain-ppl.md)       |
|	PL	  |	2020-11-21    |	2023-01-11    |	2023-01-11  | [LLVM-Toolchain-PL](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/llvm-toolchain-pl.md) |
|	PA	  |	2023-01-11    |	2023-02-14	  |	2023-02-14	|	[LLVM-Toolchain-approved](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/COREV_LLVM_Plan_Approved_2023.md)	|
|	PF	  |	2023-02-14    |	2023-02-14	  |	2024-01-30	| All the functionalities of the approved plan are completed and upstreamed |


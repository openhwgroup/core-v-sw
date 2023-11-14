1. Summary
- Title of the project: LLVM Tool Chain for CV32E40PV2
- Date of the report: 2023-11-13
- Prepared by: Paolo Savini


2. Activities and progress since last report

The focus will now be on getting the upsteam xcvmem/xcvelw MC patch accepted and to push upstream the remaining patches as github PRs.
There will be particular focus on getting the C API fit for upstream and in a shape that is agreed between the LLVM tools, Gnu tools and IDE groups. The implementation of the C API headers is necessary to get the patches for the builtins upstream.

- Embecosm:
  - Review clang builtins for xcvbitmanip
    - COMPLETE
  - Review clang builtins for xcvelw
    - COMPLETE (correction: it is about intrinsics).
  - Review clang builtins for xcvalu: WIP
    - COMPLETE
  - Review upstream patches:
    - xcvbitmanip intrinsics (D157510) under review
    - xcvmem encodings (D158824) under review
    - xcvelw encodings (D158824) under review
    - xcvmac LLVM intrinsics: to be upstreamed.
    - xcvmac clang builtins: to be upstreamed.

- PLCT:
  - Clang builtins for xcvbitmanip
    - COMPLETE
  - Clang builtins for xcvelw
    - COMPLETE (correction: it is about intrinsics).
  - Clang builtins for xcvalu
    - COMPLETE
  - Get upstream patches to be accepted:
    - xcvbitmanip intrinsics (D157510) under review
    - xcvmem encodings (D158824) under review
    - xcvelw encodings (D158824) under review
    - xcvmac LLVM intrinsics: to be upstreamed.
    - xcvmac clang builtins: to be upstreamed.

3. Planned activities for next month 
  - Embecosm:
    - Coordinate and complete work on C API headers: WIP.
    - Review patches upstream (see table below).
    - Review patches that need to be sent upstream (see table below).
    - Review and merge backport of simd MC patch upstream.
  
  - PLCT:
    - Prepare patches for upstream (see table below).
    - Fix upstream patches (xcvelw/xcvmem).
    - Implement missing patches (xcvelw clang builtins).


4. Status of the patches:

|             | MC          | Intr        | Builtins    |
|-------------|-------------|-------------|-------------|
| xcvhwlp     | Merged      | N/A         | N/A         |
| xcvsimd     | Landed      | Merged      | Merged      |
| xcvbi       | Landed      | N/A         | N/A         |
| xcvmem      | Upstream    | N/A         | N/A         |
| xcvalu      | Landed      | Merged      | Merged      |
| xcvmac      | Landed      | Merged      | Merged      |
| xcvbitmanip | Landed      | Upstream    | Merged      |
| xcvelw      | Upstream    | Merged      | WIP         |

Landed: merged in the upstream LLVM.
Upstream: currently in a patch upstream and under review.
Merged: merged in the OpenHW LLVM.
N/A: not applicable because there's nothing to implement.


5. Milestones

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
| CG3       | 2023-10-30 | 80%        |
| CG4       | 2023-11-30 | 30%        |
| HL        | 2023-12-30 | 0%         |

5. Gate status & schedule

|	Gate	| Original plan	| Current plan	| Achieved  	| Link to last gate document and notes |
|	----	| ------------- | ------------- | ----------- | ------------------------------------ |
|	PC	  | 2020-11-21	  | 2020-11-21	  | 2020-11-21	| Approved on 2020-11-21 as PPL [LLVM-Toolchain-PPL](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/llvm-toolchain-ppl.md)       |
|	PL	  |	2020-11-21    |	2023-01-11    |	2023-01-11  | [LLVM-Toolchain-PL](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/llvm-toolchain-pl.md) |
|	PA	  |	2023-01-11    |	2023-02-14	  |	2023-02-14	|	[LLVM-Toolchain-approved](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/COREV_LLVM_Plan_Approved_2023.md)	|
|	PF	  |	2023-02-14    |	2023-02-14	  |	2024-01-30	| All the functionalities of the approved plan are completed and upstreamed |


1. Summary
- Title of the project: LLVM Tool Chain for CV32E40PV2
- Date of the report: 2024-01-08
- Prepared by: Paolo Savini


2. Activities and progress since last report

The patch for bitmanip LLVM intrinsics has landed upstream.
All the C API headers have been implemented and merged locally.
The remaining patches are being prepared for upstream.
See the table below for the state of the LLVM patches for the CORE-V extensions.

3. Planned activities for next month

- Document the C API headers.
- Prepare the remaining patches for upstream.
- Continue work on the hw loop issues.

4. Status of the patches:

|             | MC          | Intr        | Builtins    |
|-------------|-------------|-------------|-------------|
| xcvhwlp     | Merged      | N/A         | N/A         |
| xcvsimd     | Landed      | Merged      | Merged      |
| xcvbi       | Landed      | N/A         | N/A         |
| xcvmem      | Landed      | N/A         | N/A         |
| xcvalu      | Landed      | Merged      | Merged      |
| xcvmac      | Landed      | Merged      | Merged      |
| xcvbitmanip | Landed      | Landed      | Merged      |
| xcvelw      | Landed      | Merged      | Merged      |

Landed: merged in the upstream LLVM.
Upstream: currently in a patch upstream and under review.
Merged: merged in the OpenHW LLVM.
N/A: not applicable because there's nothing to implement.

Patches to be merged upstream will now be sent to the LLVM github as pull requests instead of Phabricator.

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
| CG1       | 2023-07-30 | 80%        |
| CG2       | 2023-09-30 | 80%        |
| CG3       | 2023-10-30 | 80%        |
| CG4       | 2023-11-30 | 80%        |
| HL        | 2023-12-30 | 50%        | *

The milestones at 80% indicate that patches are being prepared for upstream.
The hwloop milestone is marked as 50% as there is already an implementation to work on. What follows is a review and fix of some identified issues.

5. Gate status & schedule

|	Gate	| Original plan	| Current plan	| Achieved  	| Link to last gate document and notes |
|	----	| ------------- | ------------- | ----------- | ------------------------------------ |
|	PC	  | 2020-11-21	  | 2020-11-21	  | 2020-11-21	| Approved on 2020-11-21 as PPL [LLVM-Toolchain-PPL](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/llvm-toolchain-ppl.md)       |
|	PL	  |	2020-11-21    |	2023-01-11    |	2023-01-11  | [LLVM-Toolchain-PL](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/llvm-toolchain-pl.md) |
|	PA	  |	2023-01-11    |	2023-02-14	  |	2023-02-14	|	[LLVM-Toolchain-approved](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/LLVM-Toolchain/COREV_LLVM_Plan_Approved_2023.md)	|
|	PF	  |	2023-02-14    |	2023-02-14	  |	2024-01-30	| All the functionalities of the approved plan are completed and upstreamed |


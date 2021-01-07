# OpenHW Software Task Group Meeting Minutes

Monday 11 June 2020, 07:00 Pacific time

## Attendees

- **OpenHW:** Mike Thompson, Jim Parisien
- **Embecosm:** Jeremy Bennett (chair), Craig Blackmore, Paolo Savini
- **Alibaba:** Yunhai Syh (vice-chair)
- **Eclipse project:** Alexander Fedorov
- **NXP:** Jerry Zeng (co-chair TWG)
- **Silicon Labs:** Arjan Bink (chair, Cores TG), Paul Zavalney
- **Thales:** Zbigniew Chamski

## Summary of actions

- **Jeremy Bennett:** Revise Charter and circulate for ratification.

- **Mike Thompson:** Create a custom branch in the `core-v-verif` repository to receive pull requests for the software Test Program Environment.

- **Verification TG:** Give the new Test Program Environment process a good workout.

- **Jeremy Bennett:** Introduce Zbigniew Chamski to the RISC-V LLVM working group.

- **Craig Blackmore:** Continue detailed analysis of the work required to migrate the tool chains to the current upstream baseline and then submit the changes for incorporation. Objective is to present a plan with broad brush estimates and priorities at the next meeting.

- **Mike Thompson and Alexander Fedorov:** Coordinate setting up a `core-v-ide` repository for experiments with Eclipse.

# Meeting topics

## Follow up on actions

- **Jeremy Bennett (lead), Yunhai Syh, Jim Parisien:** Prepare candidate charter in light of comments from the meeting for review on the mailing list and ratification at the next meeting.
  - See agenda item [Charter](#charter)
- **Craig Blackmore:** Carry out a detailed analysis of the work required to migrate the tool chains to the current upstream baseline and then submit the changes for incorporation.
  - See agenda item [Program of work to upstream CORE-V tool chains](#program-of-work-to-upstream-core-v-tool-chains).

## Charter

There is no official ratification process. We shall be the first. The proposed approach is to circulate the draft and ask for any objections. If there are none, the charter can be approved by acclamation at the next meeting.

The following comments were made.

- Mike Thompson reiterated the need to prioritize.
- Yunhai Syh noted that the charter doesn't mention debug systems. Need to clarify that the term "toolchain" includes debug (inc OpenOCD), assembler, libraries etc.
- Alexander Fedorov noted that the charter needs to clarify that IDE work includes integration with the debugger.
- Paul Zavalney note that the charter should be explicit about support for custom instruction extensions, and include an automated flow for non-standard extensions.

**Action:** Jeremy Bennett to revise Charter accordingly and then circulate
for ratification.

## Tool chain support for the verification group

Mike Thompson presented the problem on behalf of the Verification Task Group.  Verification needs a standard environment for compiling standard tests to binary.

Craig Blackmore presented progress so far.  He will make an initial pull request later today. It will offer a library to be included by `-lcorev-verif` with a standard linker script.  Later versions will provide full support for debug and parameterization of key aspects of the code.

**Action:** Mike Thompson to create a custom branch in the `core-v-verif` repository to receive pull requests for the software Test Program Environment.

**Action:** Verification TG to give the new process a good workout.

## Program of work to upstream CORE-V tool chains

Craig Blackmore reported on progress to date.

He looked at work on existing PULP tool chains from 2017.
- One task will be to migrate to current GCC.
- There are no tests of new features added by PULP.
  - Another task will be to add tests, so we know what we have now works.
- Input is needed on the features people want?
- The current status of bitmanip and vectorial support is as follows.
  - Some bitmanip, but non-standard in CV32E40P ("P" for "PULP extensions").
    - **Note.** CV32E40P and CV32E40 expected to co-exist.
  - Some SIMD, but non-standard in CV32E40P ("P" for "PULP extensions").

At this time is it not clear whether changes made for PULP break non-PULP platforms.
- Another task is to fix this, so support for CV32E40/CV32E40P doesn't break other RISC-V targets.

Looking at glibc and newlib, no changes are needed.

GDB changes can probably all be handled by Target Description files with the standard RSIC-V GDB.

Craig Blackmore noted that the changes are not particularly well documented.

Zbigniew Chamski note that he is working on getting 64-bit and 32-bit Ariane cores working with standard GCC and LLVM, but no PULP extensions.  Stock compilers work, but he has found some command line glitches on the LLVM side, and some assembly constructs.

**Action:** Jeremy Bennett to introduce Zbigniew Chamski to the RISC-V LLVM working group.

Paul Zavalney asked about likely effort to support bitmanip and vectorial extensions. The detailed plan will come from Craig's final plan, but likely to be specialist engineer years, not months to complete.

Jeremy Bennett noted that CGEN should be considered to give flexibility in adding custom extensions.

**Action:** Craig Blackmore to continue his detailed analysis of the work required to migrate the tool chains to the current upstream baseline and then submit the changes for incorporation. Objective is to present a plan with broad brush estimates and priorities at the next meeting.

## AOB

Jim Parisien is leaving but still around for now. There is a vacancy for this Director role.

Alexander Fedorov. Can we have a `core-v-ide` repository to start experiments on Eclipse. Answer yes.

**Action:** Mike Thompson and Alexander Fedorov to coordinate making this happen.

Mike Thompson.  Duncan Bees is a new Director taking on program management. He is the person to sort out issues around Eclipse Contributor Agreements etc.

## Future meetings

The group meets monthly at 07:00 Pacific Time on the second Monday of the month.  The dates to the end of 2020 are:

- 13 Jul 2020
- 10 Aug 2020
- 14 Sep 2020
- 12 Oct 2020
- 09 Nov 2020
- 14 Dec 2020

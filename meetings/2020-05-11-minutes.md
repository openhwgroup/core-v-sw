# OpenHW Software Task Group Meeting Minutes

Monday 11 May 2020, 07:00 Pacific time

## Attendees

- **OpenHW:** Rick O'Connor, Jim Parisien, Mike Thompson
- **Embecosm:** Jeremy Bennett (chair), Craig Blackmore
- **Alibaba:** Yunhai Syh (vice-chair)
- **Eclipse project:** Alexander Fedorov
- **Silicon Labs:** Arjan Bink
- **Zbigniew Chamski:** Thales

## Summary of actions

- **Jeremy Bennett (lead), Yunhai Syh, Jim Parisien:** Prepare candidate charter in light of comments from the meeting for review on the mailing list and ratification at the next meeting.

- **Craig Blackmore:** Carry out a detailed analysis of the work required to migrate the tool chains to the current upstream baseline and then submit the changes for incorporation.

# Meeting topics

## Charter

The following straw man was presented to frame the discussion of the charter

- Responsibilities
  - Compiler tool chains (GNU, LLVM, proprietary) & Operating systems (RTOS, *nix, *bsd)
  - Processor and platform models (ISS, cycle accurate, QEMU, OVPSim)
  - IDEs (Eclipse family, PlatformIO, proprietary) and support tools

- Goals
  - Thriving commercial ecosystem for CORE-V tools
  - Open source software maintained upstream

- How we achieve the goals
  - Contributions in kind from member companies
  - Commercial development driven by CORE-V users

- How we measure progress
  - How many commercial offerings for tools are seen
  - Acceptance of open source CORE-V tools upstream

The following points were made in discussion

- Responsibilities
  - Need to include benchmarks and demo apps
    - Embench should be one of the benchmarks
  - There are two planned platforms, one MCU class, one APU class. NXP and Silicon Labs can help with these.
    - A Linux based demo app will be needed for the APU.

- Goals
  - The IDE needs to be included in the tools being maintained upstream as a goal.

- How we achieve the goals
  - This is a big job, so prioritization will be essential.
    - Early selection of tools to be supported is essential.
  - The work will need to be carried out by the wider OpenHW community and others, the role of the Software TG is to be "shepherds" of this activity.

- How we measure progress
  - meeting the needs of the Verification TG should be an early objective.

**Action:** Jeremy Bennett to work with Yunhai Syh and Jim Parisien to draft a charter based on these comments for review on the mailing list and potential ratification at our next meeting.

## Repository migration

The chair presented the following data on the status of the current PULP GNU tool chain repositories:

- `binutils-gdb`: 3.8 MLOC
  - 2,000 new instructions added for PULP and Gap extensions
    - changes may affect non-PULP targets.
  - There are 4 new PULP relocations and associated linker changes.

- `newlib`: 0.85 MLOC
  - new `crt0.S` (overwrites upstream). Looks like a linker script can d the same.
  - PULP specific implementations of `times` and `sbrk` in `syscalls.c`
- `glibc`: 1.3 MLOC
  - no changes
- `gcc`: 5.6 MLOC
  - 27 commits to be investigated

The chair noted that the upstream tools on which these repositories are based date from early 2017 (GCC 6), since when the GCC code base has completed its migration from C to C++.

We have a goal of the tools being maintained upstream for robustness, availability and to minimize long-term effort.

We should aim for community defined extensions, to justify their inclusion upstream. It was noted that the GCC RISC-V maintainers have been particularly rigorous in only accepting ratified RISC-V Foundation extensions. We need to establish that the OpenHW Group is an equivalently authoritative group for extensions.

*The following reflects clarification with Arjan Binks after the meeting*

The CV32E40P core will use the existing PULP bitmanip and vectorial instruction set extensions. The desire is to replace these with official RISC-V Foundation extensions as these are ratified and demonstrated to be suitable.

Arjan Binks noted that Silicon Labs are using the current bitmanip and vectorial instruction set extensions.

**Action:** Craig Blackmore to carry out a detailed analysis of the work required to migrate the tool chains to the current upstream baseline and then submit the changes for incorporation.

## Future meetings

The group will meet monthly at 07:00 Pacific Time on the second Monday of the month. Discussion between times will be via Mattermost and mailing list (now set up). The monthly meetings will focus on taking decisions to progress the work of the charter. Where needed, additional meetings can be organized ad hoc. The dates for the next 5 meetings will be.

-  8 Jun 2020
- 13 Jul 2020
- 10 Aug 2020
- 14 Sep 2020
- 12 Oct 2020

The next meeting will focus on the following topics

- charter ratification
- prioritization of tool chain work to support verification and the Genesys 2 FPGA demonstration hardware platform.
- strategy for upstreaming components

## AOB

Zbiginiew Chamski asked about the prioritization of Linux porting and support. This will be needed for 64-bit CORE-V, on which Thales are working actively.

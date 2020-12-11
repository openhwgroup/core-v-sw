# OpenHW Software Task Group Meeting Minutes

Monday 09 November 2020, 15:00 UTC

## Attendees

See separate [attendance register](https://github.com/openhwgroup/core-v-docs/blob/master/program/TGSoftware_Attendance_2020.md)

## Summary of actions

- **Alexander Fedorov and Duncan Bees.** Meet to consider full project launch for the IDE project.

- **André Sintzoff, Duncan Bees and Philipp.** Meet to put together the Clang/LLVM full project proposal for TWG on 23 Nov 2020.

- **Ivan Kravets, Duncan Bees and Alexander Fedorov.** Meet to discuss extending the IDE project proposal to include PlatformIO. Aim to produce a short explanation of the benefits to sell the proposal. Suggest combine with first action above.

- **Duncan Bees.** Convene a meeting of all parties interested in FreeRTOS to see if a preliminary project proposal is feasible.

# Meeting topics

## Review of actions

- **Zbigniew Chamski and Jean-Roch Coulon:** Prepare a preliminary project proposal for TWG on 26 October 2020.

  - in progress - see agenda item [Report back from TWG](#report-back-from-twg) for details.

- **Jeremy Bennett:** Commit ecosystem to main `core-v-sw` repo.

  - complete.

- **Zbigniew Chamski:** Make a pull request to add logos to the ecosystem.

  - closed.

- **Jingliang (Leo) Wang:** Consider whether to add FORCE-RISCV ISG to the ecosystem.

  - closed - want to get richer community experience first.

## Report back from TWG

Duncan Bees reported back.

- request for more information on Clang/LLVM preliminary project proposal

  - see agenda item [CORE-V Clang/LLVM](#core-v-clang-llvm).

- FORCE-RISCV preliminary project proposal approved

  - supported as possible additional tool for assembler/linker verification

## Reports from current projects

### CORE-V GNU Tools

Jessica Mills, project leader, presented the [monthly update for November](../../projects/gnu-tools/monthly-report-09-nov-20.md), which is available in the GNU tools project directory of the [CORE-V software repository](https://github.com/openhwgroup/core-v-sw). Key points

- University of Bologna contributing 2 engineer months
- Multiply-accumulate (MAC) instructions added to binutils-gdb, but not yet pushed to repository
- GCC support for HW loop and MAC implemented, but testing awaits a suitable simulator

### CORE-V IDE

Alexander Fedorov, project leader, presented a monthly update. Working on Embedded CDT as basis. No concrete dates. Preparing sources to go through Eclipse IP verification. Then will be able to move repository under Eclipse Foundation control.

**Action:** Alexander Fedorov and Duncan Bees about go meet to consider full project launch.

### CORE-V Clang/LLVM

André Sintzoff of Thales has taken over project leadership from Zbigniew Chamski. Working on joint preliminary and full project proposal for next TWG meeting (23 Nov 2020).

We now have a [CORE-V mirror](https://github.com/openhwgroup/corev-llvm-project) of the `llvm-project` repository for our development pending upstreaming. Philipp Krones of Embecosm will contribute towards CV32E40P support.

**Action:** André Sintzoff, Duncan Bees and Philipp Krones to meet to put together the full project proposal for TWG on 23 Nov 2020.

## New potential projects

Slides will appear in the [meeting-materials](../meeting-materials) directory shortly after the meeting.

### PlatformIO

Ivan Kravets, CEO of PlatformIO presented the technology and led a discussion exploring its potential as a CORE-V software project.

Suggested project is to work with existing IDE project as an extension. Would give a wider choice of editors and IDE interfaces. Makes very configurable.

**Action:** Ivan Kravets, Duncan Bees and Alexander Fedorov to meet to discuss extending the IDE project proposal to include PlatformIO (combine with previous action from [CORE-V IDE](#core-v-ide)). Aim to produce a short explanation of the benefits to sell the proposal.

### FreeRTOS

Robert Balas of ETH Zürich presented FreeRTOS and explored what is needed to develop a CORE-V specific version.
- kernel + optional libraries
- upstream on GitHub, owned by Amazon
- MIT license

CORE-V minimal version for `core-v-mcu` would need
- crt0.S
- linker script
- hardware initialization
- interrupt controller driver
- periodic timer

Could add drivers for I/O. ETH Zürich already has FreeRTOS for Pulpissimo (on which `core-v-mcu` is based).

Mike Thompson finds it attractive and would like to participate. Hugh Pollit-Smith have discussed with both FPGA demo and the QuickLogic SoC.

Florian could provide project support alongside Robert Balas.

**Action:** Duncan Bees to convene a meeting of all interested parties to see if a preliminary project proposal is feasible.

### Rust for CORE-V

Philipp Krones of Embecosm and lead of the Rust linter project, Clippy, presented the technology and led a discussion exploring whether there is interest from members in a CORE-V specific version.

## AOB

## Dates for future meetings

The task group meets monthly at 07:00 Pacific Time on the second Monday of the month.

- 14 Dec 2020
- 11 Jan 2020
- 08 Feb 2020
- 08 Mar 2020
- 12 Apr 2020
- 10 May 2020
- 14 Jun 2020
- 12 Jul 2020
- 09 Aug 2020
- 13 Sep 2020
- 11 Oct 2020
- 08 Nov 2020
- 13 Dec 2020

Jeremy Bennett, Chair\
Yunhai Shang, Vice-Chair

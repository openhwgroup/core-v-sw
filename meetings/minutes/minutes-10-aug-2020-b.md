# OpenHW Software Task Group Monthly Meeting Minutes

Monday 10 August 2020, 14:00 UTC

## Attendees

See separate [attendance register](https://github.com/openhwgroup/core-v-docs/blob/master/program/TGSoftware_Attendance_2020.md)

## Summary of actions

- **Duncan Bees** to post his slides on promoting the SW ecosystem to the SW TG mailing list
- **Duncan Bees** to convene a follow-on meeting dedicated to this topic in a couple of weeks.
- **Jeremy Bennett** to merge [PR #11](https://github.com/openhwgroup/core-v-sw/pull/11).
- **Duncan Bees** to take Alexander Fedorov through the new process of setting up the IDE subgroup.
- **All** to advise on any status updates on Core-V software.

# Meeting topics

## Review of actions

- **Jeremy Bennett:** Ask the TWG to confirm the charter

  - see agenda item [Charter](#charter)

- **Mike Thompson and Alexander Fedorov:** Coordinate setting up a `core-v-ide` repository for experiments with Eclipse.

  - see agenda item [IDEs](#ides)

- **Craig Blackmore:** Push detailed GNU plans to SW TG repository.

  - complete.
  - see also agenda item [GNU tools project](#gnu_tools_project)

- **Jeremy Bennett:** Convene meeting with cores group to identify priorities.

  - complete: was held at 12:00 UTC time on Monday 10 August
  - see also agenda item [GNU tools project](#gnu_tools_project)

- **Florian Zaruba and Duncan Bees:** Pursue promotion of work of SW TG through the website.

  - Florian/Duncan to report at future meeting

- **Andrea Barnard:** Coordinate OpenHW TV input with Jeremy Bennett

  - complete.

- **Jeremy Bennett:** Prototype a web page for promoting the software ecosystem and discuss via MM and email.

  - see agenda item [Promoting the software ecosystem](#promoting_the_software_ecosystem)

- **Duncan Bees:** Drive sorting out how we properly do promotion.

  - see agenda item [Promoting the software ecosystem](#promoting_the_software_ecosystem)

## Charter

The TWG meeting approved the charter, but have decided to formally confirm the charter via an email vote from all member companies.  Pending this vote, the charter has been merged into the main core-v-sw repository

## Promoting the software ecosystem

Our Charter's #1 goal is to create a thriving commercial ecosystem for CORE-V software tools, models and ecosystem.  We discussed last month the importance of promoting our members work, and driving interest to their websites.

Duncan Bees gave an update on the current OpenHW thinking as it applies to the ST TG. Six possible approaches suggested

1. Coordinating input to GCC
2. Specification
3. OpenHW publishes tools from its own website
4. OpenHW "shepherds" companies doing the work on their website
5. Enabling events or processes
6. Combination of all the above

Risks

3. Does not provide incentive to SW tool companies to engage
4. OpenHW does not have the critical mass of contributors to sufficiently influence the SW tool work

**Action:** Duncan Bees to post his slides to the SW TG mailing list

* **Zbigniew Chamski.** Use case in OpenHW Group. Thales is developing the CV64A and preparing a distribution of tools for use in the OpenHW group. So users can build tools easily and get stable baseline (Option 4). Just doing integration of known sources.

* **Jeremy Bennett.** Embecosm does something similar with binary downloads (and associated sources, build scripts and test results).

* **Hugh O'Keeffe.** Important something to use "out-of-the-box". Ashling also putting together free version of all components (tools, IDE, OpenOCD, reference platform support) together. Question of how to keep that maintained.

* **Arjan Bink** talked about the idea of generic extension interface, to allow easy addition of hardware and then a process that will allow provision of tools. This then facilitates business for pure software businesses to provide the tool support. Thereby incentivising such companies to ensure the core SW tools are impressive.

**Action:** Duncan Bees to convene a follow-on meeting dedicated to this topic in a couple of weeks.

## GNU tools project

**Embecosm** has committed three additional engineers for the next 8 weeks to work alongside Craig Blackmore on improving the GNU tool chain for CV32E40P. The three engineers, Mary Bennett, Pietra Ferreira and Jessica Mills presented themselves at the meeting.

In addition, **Zbigniew Chamski** at **Thales** continues to work on the CVA6 (32- and 64-bit) tool chain.  The work of the two groups will be mutually beneficial and they will coordinate.

The work will be based on Craig Blackmore's analysis presented last month and available in the planning directory of the repository (see [gnu-toolchain-effort-estimate-13-jul-2020.md](https://github.com/openhwgroup/core-v-sw/blob/master/planning/gnu-toolchain-effort-estimate-13-jul-2020.md>).

This envisaged 15 engineer months of effort to achieve a minimal tool chain to commercial standard, more than the 6 engineer months currently being provided by Embecosm. A joint meeting with the Cores TG earlier in the day set the overall work plan to be

- adding robust testing to the PULP binutils-gdb repository (first 4 weeks, led by Pietra Ferreira).
- migrating the 27 PULP GCC patches to be based on upstream GCC (second 4 weeks, led by Jessica Mills).

The priority extensions will be:

- post-increment
- PULP ALU
- immediate branch
- HW loop

Full details in the [minutes](https://github.com/openhwgroup/core-v-sw/blob/master/meetings/minutes/minutes-10-aug-2020-a.md) of the earlier meeting.

## IDEs

**Alexander Fedorov**, leader of the IDE initiative for the Software TG, presented the requirements for an open soruce IDE (see [PR #11](https://github.com/openhwgroup/core-v-sw/pull/11).

- should we use Java 8 or Java 11
- should we use GitHub repository in OpenHW Group organization?
- open issue of how to include binary components (tool chains)
- how should we sign the content?
- how whould we brand it?

**Ashling** are making a commitment to support this work. First version in 4-5 weeks. Ashling are very experienced on putting packages like this together, not so experienced on engaging with open source communities. They would appreciate support with the latter initiative.

**Action:** Jeremy Bennett to merge [PR #11](https://github.com/openhwgroup/core-v-sw/pull/11).

Agreed that IDE to be set up as a subgroup of SW Task Group

**Action:** Duncan Bees to take Alexander Fedorov through the new process of setting up the IDE subgroup.

## OpenHW TV

The third edition of OpenHW TV on Thursday 20 August will feature the SW Task Group alonside the HW Task Group.  The panel will include Jeremy Bennett (Chair), Yunhai Shang (Vice-Chair) and Florian Zaruba (OpenHW Director for HW and SW TGs).  Craig Blackmore will present the work on the open source GNU tool chain, Roisin O'Keeffe of Ashling will present both their proprietary IDE, RISCFree and the open source IDE being developed with Alexander and his team. Hugh Pollitt-Smith, Chair of the HW TG will present the digilent FPGA board with its prototype CV32E40P implementation.

**Yunhai Shang** proposed that we should give a status update on the work of the SW Task Group in all areas during the OpenHW TV session.

- Clang/LLVM tool chain
- Operating systems (RTOS, &ast;nix, &ast;bsd)
- Modeling (ISS, cycle accurate, QEMU)
- IDEs - see separate agenda item [IDEs](#ides)
- Benchmarking
- Demo applications

**Action:** All to advise on any status updates.

## AOB

## Dates for future meetings

The group meets monthly at 07:00 Pacific Time on the second Monday of the month.  I propose publishing a schedule for 2021 at next month's meeting.

- 14 Sep 2020
- 12 Oct 2020
- 09 Nov 2020
- 14 Dec 2020


Jeremy Bennett, Chair

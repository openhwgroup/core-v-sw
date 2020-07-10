# OpenHW Software Task Group Meeting Agenda

Monday 13 July 2020

- 07:00-08:00 Pacific Time
- 10:00-11:00 East Coast Time
- 15:00-16:00 UK Time
- 16:00-17:00 Central European Time
- 22:00-23:00 Beijing Time

## Location

Zoom meeting

- [us02web.zoom.us/j/85194416761](https://us02web.zoom.us/j/85194416761)
- Meeting ID: 851 9441 6761
- Find your local number: [us02web.zoom.us/u/kcVlqVA9vi](https://us02web.zoom.us/u/kcVlqVA9vi)

# Agenda topics

## Review of actions

- **Jeremy Bennett:** Revise Charter and circulate for ratification.
  - see agenda item [Charter](#charter)

- **Mike Thompson:** Create a custom branch in the `core-v-verif` repository to receive pull requests for the software Test Program Environment.
  - **Complete**

- **Verification TG:** Give the new Test Program Environment process a good workout.
  - **Complete**

- **Jeremy Bennett:** Introduce Zbigniew Chamski to the RISC-V LLVM working group.
  - **Complete**

- **Craig Blackmore:** Continue detailed analysis of the work required to migrate the tool chains to the current upstream baseline and then submit the changes for incorporation. Objective is to present a plan with broad brush estimates and priorities at the next meeting.
  - see agenda item [Work estimates](#work-estimates)

- **Mike Thompson and Alexander Fedorov:** Coordinate setting up a `core-v-ide` repository for experiments with Eclipse.
  - Mike/Alexander to report
  - see also agenda item [IDEs](#ides)

## Introducing Florian Zaruba

Florian joins OpenHW Group from ETH Zürich as Director responsible for the Software and Hardware task groups.

## Charter

The chair will present the results of voting on the [draft charter](https://github.com/jeremybennett/core-v-sw/blob/draft-charter/charter.md).  In the event of a vote in favor, the charter will be presented to the TWG for confirmation.

## Work estimates

Craig Blackmore will report his estimates for the effort required to bring the GNU tool chain up to date, and a plan for prioritizing the stages of that work and getting the code adopted into the upstream distributions.

We have a number of other areas where we need to plan effort, and I should welcome volunteers to take the lead, either on whole areas, or parts of sub-areas

- Clang/LLVM tool chain
- Operating systems (RTOS, &ast;nix, &ast;bsd)
- Modeling (ISS, cycle accurate, QEMU)
- IDEs - see separate agenda item [IDEs](#ides)
- Benchmarking
- Demo applications
- Support for OpenHW Group reference platforms

## IDEs

It became clear from the last Hardware TG meeting that other groups are also working on IDEs.  We need someone from Software TG to lead/coordinate this work.  I have reached out to interested parties, and hope as many as possible will participate in this meeting.

## Promoting the Software TG on the OpenHW Group website

On the main [Projects page](https://www.openhwgroup.org/projects/), there are links to the repositories of the Cores and Verification TG.  Florian will report on progress in getting the Software TG similarly promoted.

It is important that the Software TG get this exposure, both in light of our forthcoming OpenHW TV appearance and to help drive the commercial ecosystem (see agenda item [Promoting the software ecosystem](#promoting-the-software-ecosystem).

## OpenHW TV

For those of you who haven't seen them, we are producing monthly TV episodes promoting the OpenHW ecosystem. The [next episode](https://us02web.zoom.us/webinar/register/WN_L2lOYtxPRNyq7jYX7ENUwQ) is on 16 July.

The third episode, in August, will feature the work of the Software TG. I hope to have someone from OpenHW Group marketing available to tell us more about what is involved.

## Promoting the software ecosystem

Our Charter's #1 goal is to create a thriving commercial ecosystem for CORE-V software tools, models and ecosystem.  After last month's meeting, we had a discussion on the Mattermost channel, where I proposed that we should have a web page listing all software items and from whom they could be obtained.  Thus we might have

----

### GNU tool chain

This comprises the following components

- GNU binutils (including the linker and assembler)
- GNU Compiler Collection (GCC) supporting C and C++
- GNU Debugger (GDB)
- C and C++ libraries
  - for bare metal we use Newlib C library
  - for Linux applications we use the GlibC C library.

#### Sources

The latest stable compiler tool chain may be built by using the following releases of the software:

- **binutils:** https://www.gnu.org/software/binutils/ (2.34)
- **GCC:** https://gcc.gnu.org/releases.html (10.1)
- **GDB:** https://www.gnu.org/software/gdb/download/ (9.2)
- **newlib:** https://sourceware.org/newlib/ (3.3.0)
- **GlibC:** https://www.gnu.org/software/libc/ (2.31)

#### Precompiled binaries

These are freely available from a number of suppliers of open source services

- **Company 1: ** https://www.company1.com/downloads/gnu
- **Company 2: ** https://www.company2.com/downloads/gcc

----

This way the central repository of information is on the OpenHW website.  However it is also used to funnel users to those OpenHW Group member companies who supply services.

**Note** in particular that this works just as well for proprietary software, provided by a number of OpenHW members. The only difference is that they would not provide source code links.

I would like to get the TG's view on this. If we are happy with this I shall reach out to all OpenHW Group members to start to populate a page in our repository with as much of this information as possible.

## AOB

## Dates for future meetings

The group meets monthly at 07:00 Pacific Time on the second Monday of the month.

- 10 Aug 2020
- 14 Sep 2020
- 12 Oct 2020
- 09 Nov 2020
- 14 Dec 2020


Jeremy Bennett, Chair

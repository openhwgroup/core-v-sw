# OpenHW Software Task Group Meeting Minutes

Monday 13 June 2020, 07:00 Pacific time

## Attendees

Due to a technical issue, a complete record of the 19 attendees was not
obtained. Pull requests to amend the attendee list welcome.

- **OpenHW:** Mike Thompson, Duncan Bees, Florian Zaruba
- **Embecosm:** Jeremy Bennett (chair), Craig Blackmore, Paolo Savini
- **Alibaba:** Yunhai Syh (vice-chair)
- **Eclipse project:** Alexander Fedorov
- **Publitek:** Andrea Barnard
- **Thales:** Zbigniew Chamski

## Summary of actions

- **Jeremy Bennett:** Ask the TWG to confirm the charter
- **Craig Blackmore:** Push detailed plans to SW TG repository.
- **Jeremy Bennett:** Convene meeting with cores group to identify priorities for SW development.
- **Alexander Fedorov:** Lead work capturing requirements and prototyping solutions, communicating with all interested parties.
- **Florian Zaruba:** Create TWG: SW IDE MM channel.
- **Florian Zaruba, Duncan Bees:** Promote work of SW TG through the website.
- **Andrea Barnard, Jeremy Bennett:** Coordinate input to OpenHW.
- **Jeremy Bennett:** Prototype website promotion of software ecosystem and discuss via MM and email.
- **Duncan Bees:** Sort out how we properly do promotion.

# Meeting topics

## Follow up on actions

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
  - Not complete, action transferred to Florian
  - see also agenda item [IDEs](#ides)

## Introducing Florian Zaruba

Florian is the OpenHW Group Director responsible for the Software and Hardware
Task Groups.

## Charter

The result of the pool on the charter was

- For: **5**
- Against: **0**

(Correction to the number (4) reported at the meeting. In addition 1 more vote in favour was received just after the start of the meeting).

The meeting assented to the charter being presented to the TWG for ratification.

**Action:** Jeremy Bennett to ask the TWG to confirm the charter

## Work estimates

Craig Blackmore presented analysis for the GNU tool chain

Upstreaming
- riscv*-corev-elf
- establish OpenHW as a supplementary standardization body
- some instruction encodings prevent upstreaming
- must have tests in test suites
- cannot break non-CORE-V platforms
- start with binutils-gdb
  - solve the technical issues, upstream discussions of adding CORE-V vendor

Minimal support: assembler/disassembler, linker relocations, builtints/intrinsics, simple RTL patterns, comprehensive testing

Full support: full automatic generation/optimization in GCC

Table of effort:
```
                                Minimal support         Full support
Always enabled features         1 eng yr                3+ years
Optional features               2 eng mnths             Not applicable
Tentative features              1 eng yr                More work needed
Pipeline model (undocumented)   2 eng yrs               3+ years
```

Discussion points:
- can we justify out bitmanip and SIMD in the light of B and P
  - not in current core
- linker needs to identify if ELF is CORE-V RISC-V
- some instruction encodings prevent upstreaming
  - `reserved`
  - `custom`
  - `OP` (some should be `OP-IMM`)
- non-standard instruction formats need handling in the assembler
- differences between btimanip spec in CORE-V and RI5CY User Manual
  - constraints missing
  - semantics written differently
- undocumented features/options (not included in plan)
  - p.<opcode>i aliases
  - OpenMP?
  - many `-m` options
  - changes for `__attribute__((interrupt))` likely succeded by upstream
  - default multilib list overwritten

**Action** Craig Blackmore to push detailed plans to SW TG repository.

**Action:** Jeremy Bennett to convene meeting with cores group to identify priorities.

## IDEs

How coordinate efforts from CMC, Eclipse Foundation, Ashling, Alexander Fedorov, Jonah Graham?

Need to collect requirements and also prototype. Alexander Fedorov recommended to start with Eclipse CDT, since best today for custom tool chains. Later Theia.

**Action:** Alexander Fedorov to lead work capturing requirements and prototyping solutions, communicating with all interested parties.

**Action:** Florian Zaruba to create TWG: SW IDE MM channel.

## Promoting the Software TG on the OpenHW Group website

Florian Zaruba advised that while technically it is east to change the website, there is a larger discussion going on how to organize projects in general within OHW. That’s what is delaying this so much.

Duncan Bees: Need to clarify what is a project and what is a working group.

**Action:** Florian Zaruba and Duncan Bees to pursue promotion of work of SW TG through the website.

## OpenHW TV

Andrea Barnard from Publitek introduced. Episode 3 on 20 August 2020 will be HW and SW task group episode. 45 minute broadcasts, mostly pre-recorded. Panel live at the end.

Plan 2-3 weeks ahead. Have storyboard template. Who is speaking, what about, how long (usually 5-7 minutes). Prepare slides, then schedule in recording sessions.

Pre-live briefing and then good to go.

We need to help with completion of the storyboard, and who is speaking.
- several speakers, more breadth, bigger panel
- give spectrum of the compilers/IDEs, GCC, LLVM, IAR, Eclipse various, Platform I/O. Inclusive

**Action:** Andrea Barnard to coordinate input with Jeremy Bennett

## Promoting the software ecosystem

Duncan Bees: Would bring people to the ecosystem.

Zbigniew Chamski: Need a graphical view of the ecosystem.

Suresh: Ashling already do this with RISC-V

"Suppliers" rather than "Precompiled binaries"

Duncan Bees: Need to agree exactly what we promote.

**Action:** Jeremy Bennett to prototype and discuss via MM and email.

**Action:** Duncan Bees to drive sorting out how we properly do promotion.

## AOB

## Future meetings

The group meets monthly at 07:00 Pacific Time on the second Monday of the month.  The dates to the end of 2020 are:

- 10 Aug 2020
- 14 Sep 2020
- 12 Oct 2020
- 09 Nov 2020
- 14 Dec 2020

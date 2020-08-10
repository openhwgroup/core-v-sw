# Combined OpenHW Software and Cores Task Group Meeting Minutes

Monday 10 August 2020, 12:00 UTC

## Attendees

See separate [attendance register](https://github.com/openhwgroup/core-v-docs/blob/master/program/TGSoftware_Attendance_2020.md)

## Summary of actions

**Jeremy Bennett:** Introduce the Embecosm team to Zbigniew Chamski
**Jeremy Bennett:** Request limitations of software support to be added to the next TWG meeting agenda.
**Craig Blackmore:** Produce definitive list of opcodes which are problem and share with the Cores TG.

# Meeting topics

## Priorities for GNU tool chain development

Question: Can we use other contributors beyond the Embecosm team?

- yes
- Zbigniew Chamski of Thales is working on CV64 tool chain support
- there will be overlap of work between CV32 CV64

**Action:** Jeremy Bennett to introduce Embecosm team to Zbigniew Chamski

Proposed program of work

- get existing PULP binutils-gdb tested (12 engineer weeks)
- roll GCC patches forward to current top-of-tree (12 engineer weeks)
- roll PULP binutils-gdb forward to current top-of-tree
  - not currently scheduled
  - will likely be CGEN based for efficiency

Cores TG priorities (Arjan Bink)

- don't spend time on bitmanip/SIMD
- will be replaced by standard B/P extensions

  - bitmanip upstream is advanced
  - SIMD not so advanced (although Davide Schiavione noted it is a key differentiator)

- no preference between post-increment, PULP ALU or immediate branch extensions
- HW loop is now always enabled, and equial priority to previous items
- tentatative things

  - Xpulpzfinx low priority
  - Xpulpcluster only one instruction

- no comment on undocumented features

  - observe that upstream `interrupt` attribute may be suitable now

Overall i) post-increment, ii) PULP ALU, iii) immediate branch and iv) HW loop extensions (total 8 engineer months work) have the same priority. Embecosm GCC team will choose from these to maximize return.

Observations from Verification TG (Mike Thompson)

- PULP extensions get best effort verification by end September 2020
- will not be fully verified

Arjan Bink noted that the  next core will have none of these features, but will have a general extension interface.  There will be no prepackaged extensions.

- will want a process for supporting that with software

Discussion of why have SIMD hardware without compiler support.

- Jeremy Bennett and Arjan Bink argued that extensions cannot be promoted without tested compiler
- Jeremy Bennett noted that there was the opportunity for commercially funded development by anyone choosing that extension
  - example of general extension process
  - Arjan Bink suggested we  treat all extensions this way

Arjan Bink noted that we need to raise with the TWG that two features will have no SW support.

**Action:** Jeremy Bennett to get this added to the next TWG meeting agenda.

There was a discussion that some instructions use reserved opcodes

- may break code from the upstream compiler
- will make upstreaming impossible
- needs urgent agreement and should drive software priorities

  - avoid extensions with problems

**Action:** Craig Blackmore to produce definitive list of opcodes which are problem and share with the Cores TG.

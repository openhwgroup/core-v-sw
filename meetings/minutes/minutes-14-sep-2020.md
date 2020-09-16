# OpenHW Software Task Group Meeting Minutes

Monday 14 September 2020, 14:00 UTC

## Attendees

See separate [attendance register](https://github.com/openhwgroup/core-v-docs/blob/master/program/TGSoftware_Attendance_2020.md)

## Summary of actions

- **Jeremy Bennett:** Submit preliminary project proposal for GNU Tools development to TWG meeting on 28 September 2020.

- **Jeremy Bennett:** Revise the commercial ecosystem page in light of comments for review via Mattermost, with a view to sign-off at next month's meeting.

# Meeting topics

## Review of actions

- **Duncan Bees:** Post slides on promoting the SW ecosystem to the SW TG mailing list

  * complete: commits 00023d5 and c0f046c in the `core-v-sw` repository `meetings/materials` directory.

- **Jeremy Bennett:** Merge [PR #11](https://github.com/openhwgroup/core-v-sw/pull/11).

  * complete

- **Duncan Bees:** Take Alexander Fedorov through the new process of setting up the IDE subgroup.

  * complete

- **All:** advise on any status updates on Core-V software

  * complete: see report on IDEs and GNU tools later

## Open source Eclipse development tools

Frédéric Desbiens and Alexander Fedorov gave a preview of their talk at OSDForum on 15 September 2020. These are the slide decks.

- [Eclipse IoT and Eclipse Edge Native Overview](../meeting-materials/2020.07 - Eclipse IoT and Eclipse Edge Native Overview-14-sep-2020.pdf)
- [Being Productive with Open Source Eclipse Development Tools](../meeting-materials/2020.09 - OSDForum - Being Productive with Open Source Eclipse Development Tools-14-sep-2020.pdf)

## GNU tool chain update

[Progress report](../meeting-materials/gnu-tools-update-14-sep-2020.pdf) was presented by Mary Bennett of Embecosm. Regression test data for CORE-V binutils-gdb.

|                      | FSF gas | CORE-V gas | FSF ld | CORE-V ld |
|----------------------|--------:|-----------:|-------:|----------:|
| Expected passes      |     288 |        304 |    362 |       365 |
| Unexpected failures  |       - |          - |      - |         - |
| Unexpected successes |       - |          - |      - |         - |
| Expected failures    |      15 |         15 |      4 |         4 |
| Unresolved tests     |       - |          - |     22 |        22 |
| Unsupported tests    |      10 |         10 |    171 |       171 |

- Question (Mike Thompson): What tool chain should be used for CV32E40P RTL sign-off, which has all PULP features disabled.

  - Answer: Use FSF upstream stable (GCC 10.2, binutils 2.35, GDB 9.2, newlib 3.3.0).

**Action:** Jeremy Bennett to submit preliminary project proposal for GNU Tools development to TWG meeting on 28 September 2020.

## Promoting the software ecosystem

Draft front (`README`) and commercial ecosystem pages were presented for review.

* [front page](https://github.com/jeremybennett/core-v-sw/blob/jpb-promoting-sw/README.md)
*  [ecosystem page](https://github.com/jeremybennett/core-v-sw/blob/jpb-promoting-sw/ecosystem.md) listing all contributors to that ecosystem.

Alexander Fedorov likes, but needs to be more discoverable
- fit it into one screen
  - perhaps logos
- look at Eclipse market place
- perhaps use a table

Simon Davidmann supportive
- do it by categories
- might others in the future
- good to have pull requests

Rick O'Connor supports the direction
- marketing to guide, but content owned by SW TG

Zbigniew Chamski
- about to make available tool chain and verification for CVA6
- initially within OpenHW Group
  - in time pointers to environment for CVA6
- set up own repositories outside
  - we can reference this

**Action:** Jeremy Bennett to revise the commercial ecosystem page in light of comments for review via Mattermost, with a view to sign-off at next month's meeting.

## AOB

Alexander Fedorov asked for good times for IDE meetings
- Ashling would like to attend
- Imperas would like to attend
- recommend 14:00 UTC on any Monday apart from 2nd Monday in the month

## Dates for future meetings

The group meets monthly at 07:00 Pacific Time on the second Monday of the month.  Dates to end of 2021.

- 12 Oct 2020
- 09 Nov 2020
- 14 Dec 2020
- 11 Jan 2021
- 08 Feb 2021
- 08 Mar 2021
- 12 Apr 2021
- 10 May 2021
- 14 Jun 2021
- 12 Jul 2021
- 09 Aug 2021
- 13 Sep 2021
- 11 Oct 2021
- 08 Nov 2021
- 13 Dec 2021

Jeremy Bennett, Chair

# Joint OpenHW Software and Cores Task Groups Meeting Agenda

Monday 10 August 2020

- 05:00-05:30 Pacific Time
- 08:00-08:30 East Coast Time
- 13:00-13:30 UK Time
- 14:00-14:30 Central European Time
- 20:00-20:30 Beijing Time

## Location

Zoom meeting

- [us02web.zoom.us/j/84309061282](https://us02web.zoom.us/j/84309061282?pwd=MHZYTjBZN21uM2Y0eU8rd1JQMHNHZz09)
- Meeting ID: 843 0906 1282
- Passcode: 315236
- Find your local number: [us02web.zoom.us/u/kc8GipE4dH](https://us02web.zoom.us/u/kc8GipE4dH)

# Agenda topics

## Register of attendance

We are recording attendance at meetings, so OpenHW Group can track membership in accordance with article 4 of the membership agreement. This matters particularly when email ballots are held, to ensure the voters represent member organizations who are active on the group. The attendance records are can be seen in the [program](https://github.com/openhwgroup/core-v-docs/tree/master/program) directory of the [core-v-docs repository](https://github.com/openhwgroup/core-v-docs).

## Priorities for GNU tool chain development

Embecosm is committing 3 additional engineers to the project for the next 8 weeks to work on the GNU tool chain.  @craigblackmore provided an initial plan (https://github.com/openhwgroup/core-v-sw/blob/master/planning/gnu-toolchain-effort-estimate-13-jul-2020.md).  Just to achieve minimal support represents 15 engineer months of work, so we need to prioritise which extensions to work on first.

1. **Always enabled features**

   - bit manipulation (2 engineer months)
   - SIMD (5 engineer months)
   - post increment load/store (2 engineer months)
   - PULP ALU extensions (3 engineer months)
   - PULP immediate branch (1 engineer month)

2. **Optional features**

   -  HW loops (2 engineer months)

3. **Tentative features**

   - Xpulpzfinx (2 engineer months + 8 engineer months to hand-code `libgcc`)
   - Xpulpcluster (2 engineer weeks)

4. Other features (not in CV32E40* spec)

   - pipeline model (2 engineer weeks)

5. Undocumented features (found in source code, no effort estimate)

   - custom relocations
   - custom `-m` options, many conflicting with upstream
   - custom `__attribute__ ((interrupt))`
   - overwriting multilib list

Jeremy Bennett, Chair SW TG
Arjan Bink, Chair Cores TG

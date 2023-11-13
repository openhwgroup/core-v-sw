# Verilator modeling for Software: Monthly report 13 Nov 2023

Project lead: Jeremy Bennett

## Activities and progress since last report

Completed:
- JTAG pins to X-Heep Verilator model now working.

To do:
- get X-Heep Verilator model to run programs through GDB;
- provide a suitable linker script for general use;
- run GCC regression;
- run Embench; and
- accellerate the model using DPI memory access for program loading.

## Issues and Difficulties

- The X-Heep Verilator model is not halting in response to JTAG commands.
  - comparing with OpenOCD to try to determine cause of differences.

## Timeline and statistics

### Kanban chart

**Note.** Task list currently under review.

| Milestone                             | Open | In progress | Complete |
| :------------------------------------ | ---: | ----------: | -------: |
| CV32E40Pv2 Verilator model available  |    - |           - |        1 |
| JTAG TAP driver complete              |    - |           - |        7 |
| Initial version of Embdebug available |    1 |           - |        1 |
| Initial standalone model available    |    2 |           - |        - |
| Final version of Embdebug available   |    2 |           1 |        - |
| Final standalone model available      |    1 |           - |        - |

### GCC regression test statistics

To be provided in future

## Gate status & schedule

### Verilator modeling for software generic plan

| Gate | Original plan | Current plan  | Achieved      | Notes |
| :--- | :------------ | :------------ | :------------ | :---- |
| PC   |               | 2021-03-22    |               |       |
| PL   |               | 2023-06-05    |               | 1.    |
| PA   | N/A           |               |               |       |
| PF   | N/A           |               |               |       |

Notes:
1. Change of scope to cover purely software applications.

Document links:
- [Project concept](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/MCU-Verilator-Model/verilator-modeling-ppl.md)
- [Project launch](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/MCU-Verilator-Model/verilator-modeling-pl.md)
- Plan approved - N/A for generic software projects
- Project freeze - N/A for software projects.

### Verilator modeling for software for CV32E40Pv2

| Gate | Original plan | Current plan  | Achieved      | Notes |
| :--- | :------------ | :------------ | :------------ | :---- |
| PC   | N/A           |               |               |       |
| PL   | N/A           |               |               |       |
| PA   |               | 2023-06-05    |               |       |
| PF   | N/A           |               |               |       |

- Project concept - see generic plan
- Project launch - see generic plan
- [Plan approved](https://github.com/openhwgroup/programs/blob/master/Project-Descriptions-and-Plans/MCU-Verilator-Model/verilator-modeling-pa.md)
- Project freeze - N/A for software projects.

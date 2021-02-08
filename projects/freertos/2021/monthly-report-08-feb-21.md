## Overview

### Key activities

* Work on Component 1 as per the [original FreeRTOS PPL proposal](https://github.com/openhwgroup/core-v-docs/blob/master/program/core-v-free-rtos-ppl.md) is still ongoing
* A clean version of Core-V-MCU FreeRTOS published on Github under https://github.com/bluewww/core-v-freertos, work to move the project under the OpenHW Group github organization is in progress 
* Timer interrupts are currently working when TIMER_CFG_HI & the relevant external interrupt /11/ are used instead of the TIMER_CFG_LO is currently being configured by the public code
* A discussion on current Core-V timer implementation vs RISC-V ISA Specification definiton for mtime & proposed timer implementation improvements was held - RTL changes expected that will require some modifications to the current FreeRTOS timer handling code

### Test results


### Planned activities for coming month

* Move Core-V-Freertos repository to the OpenHW Group github organization
* boot-to-main runtime (crt0.S, board initialization)
* FreeRTOS kernel and get basic blinky working following RTL changes in timer implementation

### Risk Register

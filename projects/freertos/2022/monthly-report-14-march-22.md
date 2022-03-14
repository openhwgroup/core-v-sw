# Software TG monthly meeting - FREERTOS (March 2022)
## Overview

### Key activities
* Further meetings to discuss FreeRTOS Project Launch Preparation
* Tested out latest upstream FreeRTOS on FPGA w/ up-to-date Core-V-MCU bitstream - with minor changes a blinky application is mostly functional (using riscv mtime counters) - send/receive tasks are properly context-switched, timers are firing properly, GPIO LED adjustments still TBD, uart is still TBD (curently getting garbage output with uart_test application) 
* A preliminary startup guide & prebuilt bitstream for core-v-mcu and Nexys A7 FPGA available at https://github.com/MikeOpenHWGroup/core-v-mcu/blob/qsg/emulation/quickstart/README.md

### Test results

### Risk Register

No changes.

### Next stages
Plan for comming weeks -
* Merge kernel changes upstream
  1. Separate individual tasks & delegate to people involved
  2. Update core-v-freertos-kernel, align it with upstream
  3. Merge this updated kernel into the `core-v-freertos` repo  and test it.
  4. Fork freertos demo and add core-v-mcu demo using code from core-v-freertos
  5. Test with core-v-mcu verilator / questa and on nexys fpga
  6. Make a PR from `core-v-freertos-kernel` to upstream

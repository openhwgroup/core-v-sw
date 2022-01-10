# Software TG monthly meeting - FREERTOS (January 2022)
## Overview

### Key activities
* Minor testing of latest Core-V-MCU bitstream (built at commit [ff468b90](https://github.com/openhwgroup/core-v-mcu/commit/ff468b90) ) - with CPU id of 0x10001c05 and JTAG connected to the lower pins of JB, OpenOCD sucessfully connects to Nexys-A7-100T board and debugging FreeRTOS via GDB is working as expected

### Test results

### Risk Register

No changes.

### Next stages
Plan for comming weeks -

* Merge kernel changes upstream
  1. In `core-v-freertos-kernel` rebase `pulp-project-devel` on top of latest
     upstream freertos release of the kernel
  2. Cleanups of the main branch
  3. Merge this updated kernel into the `core-v-freertos` repo  and test it.
  4. Make a PR from `core-v-freertos-kernel` to upstream
* Double check [RTL simulation](https://github.com/openhwgroup/core-v-mcu/issues/149) and
  [interrupt handling](https://github.com/openhwgroup/core-v-mcu/issues/115) issues
* Continue work as per the [original FreeRTOS PPL
  proposal](https://github.com/openhwgroup/core-v-docs/blob/master/program/Project%20Descriptions%20and%20Plans/Free%20RTOS/core-v-free-rtos-ppl.md)

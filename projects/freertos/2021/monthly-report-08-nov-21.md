# Software TG monthly meeting - FREERTOS (November 2021)
## Overview

### Key activities
* No progress on project during the previous month

### Test results

### Risk Register

No changes.

### Next stages
Plan remains unchanged -

* Merge kernel changes upstream
  1. In `core-v-freertos-kernel` rebase `pulp-project-devel` on top of latest
     upstream freertos release of the kernel
  2. Cleanups of the main branch
  3. Merge this updated kernel into the `core-v-freertos` repo  and test it.
  4. Make a PR from `core-v-freertos-kernel` to upstream
* Blocked by [RTL simulation](https://github.com/openhwgroup/core-v-mcu/issues/149) and
  [interrupt handling](https://github.com/openhwgroup/core-v-mcu/issues/115)/ Need up-to-date status of [open Core-V issues](https://github.com/openhwgroup/core-v-mcu/issues)
* Blocked by [IDCODE change](https://github.com/openhwgroup/core-v-mcu/issues/168) - need an example OpenOCD configuration and ideally published pre-built bitstreams with latest RTL changes 
* Continue work as per the [original FreeRTOS PPL
  proposal](https://github.com/openhwgroup/core-v-docs/blob/master/program/Project%20Descriptions%20and%20Plans/Free%20RTOS/core-v-free-rtos-ppl.md)

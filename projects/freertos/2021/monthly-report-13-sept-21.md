# Software TG monthly meeting - FREERTOS (September 2021)
## Overview

### Key activities
* No major activity on the project during the previous month besides minor testing with latest RTL changes

### Test results
### Risk Register

No changes.

### Next stages
Plan remains unchanged compared to August -

* Merge kernel changes upstream
  1. In `core-v-freertos-kernel` rebase `pulp-project-devel` on top of latest
     upstream freertos release of the kernel (or master if we really need this)
  2. Do some cleanups of the branch (for example there are references to PULPissimo etc.)
  3. Merge this updated kernel into the `core-v-freertos` repo  and test it.
  4. Make a PR from `core-v-freertos-kernel` to upstream
* Blocked by [RTL simulation](https://github.com/openhwgroup/core-v-mcu/issues/149) and
  [interrupt handling](https://github.com/openhwgroup/core-v-mcu/issues/115)/ Need up-to-date status of [open Core-V issues](https://github.com/openhwgroup/core-v-mcu/issues/149)
* Continue work on Component 1 as per the [original FreeRTOS PPL
  proposal](https://github.com/openhwgroup/core-v-docs/blob/master/program/Project%20Descriptions%20and%20Plans/Free%20RTOS/core-v-free-rtos-ppl.md)

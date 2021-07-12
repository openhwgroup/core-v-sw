# Software TG monthly meeting - FREERTOS (July 2021)
## Overview

### Key activities
* Added build time configuration switches
  [options](https://github.com/openhwgroup/core-v-freertos/pull/2) to make
  addtional targets such as the cva6 easier.
* Updated tests accordingly
* Formulated plan for merging kernel changes upstream
  1. In `core-v-freertos-kernel` rebase `pulp-project-devel` ontop of latest
     upstream freertos release of the kernel (or master if we really need this)
  2. Do some cleanups of the branch (for example there are references to PULPissimo etc.)
  3. Merge this updated kernel into the `core-v-freertos` repo  and test it.
  4. Make a PR from `core-v-freertos-kernel` to upstream

### Test results
### Risk Register

No changes.

### Next stages
* Blocked by [RTL simulation](https://github.com/openhwgroup/core-v-mcu/issues/149) and
  [interrupt handling](https://github.com/openhwgroup/core-v-mcu/issues/115)
* Continue work on Component 1 as per the [original FreeRTOS PPL
  proposal](https://github.com/openhwgroup/core-v-docs/blob/master/program/core-v-free-rtos-ppl.md)

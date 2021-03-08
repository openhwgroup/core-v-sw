# Software TG monthly meeting - FREERTOS (March 2021)
## Overview

### Key activities

* Work on Component 1 as per the [original FreeRTOS PPL
  proposal](https://github.com/openhwgroup/core-v-docs/blob/master/program/core-v-free-rtos-ppl.md)
  is still ongoing
* A clean version of core-v-mcu freertos was published under the OpenHW github
  organization as https://github.com/openhwgroup/core-v-freertos (full
  distribution) and https://github.com/openhwgroup/core-v-freertos-kernel
  (downstream for kernel changes). The core-v-freertos is self-contained to make
  it easier to use (i.e. no download scripts or git submodules).

### Test results
### Risk Register

No changes.


### Next stages

* Use new timer interface. We are currently waiting for a bitstream/rtl changes
  to be able to develop against it. Related PR is
  https://github.com/openhwgroup/timer_unit/pull/3.
* Add FreeRTOS kernel and get basic blinky working.
* core-v GCC toolchain should be used
* Add an Eclipse launch configuration to core-v freertos

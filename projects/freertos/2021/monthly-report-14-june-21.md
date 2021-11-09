# Software TG monthly meeting - FREERTOS (June 2021)
## Overview

### Key activities
* Regenerate new bitstream from [latest rtls](https://github.com/openhwgroup/core-v-mcu/tree/master/rtl)
* Re-tested current CORE-V FreeRTOS implementation with new bitstream on Nexus
A7-100 - timer interrupts are not triggered, GPIO LED not working (possibly due
to register changes); basic programming examples (using pseudocode) are needed

### Test results
### Risk Register

No changes.

### Next stages
* Update register definitions & hardware setup routine as per the
[updated documentation](https://github.com/openhwgroup/core-v-mcu/tree/master/docs] &
test/re-validate current CORE-V FreeRTOS implementation
* Continue work on Component 1 as per the [original FreeRTOS PPL
  proposal](https://github.com/openhwgroup/core-v-docs/blob/master/program/core-v-free-rtos-ppl.md)

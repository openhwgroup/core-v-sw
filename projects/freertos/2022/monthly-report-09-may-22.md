# Software TG monthly meeting - FREERTOS (May 2022)
## Overview

### Key activities
* No progress on the FreeRTOS project during the previous month.

### Test results

### Risk Register

No changes.

### Next stages
  1. Analyze and fix timer interrupt issues with latest [core-v-mcu FreeRTOS port](https://github.com/bluewww/Freertos/tree/core-v-mcu).
   Move from custom timer code to `mtime` based solution.
  2. Get blinky and full demo to work
  3. Test with core-v-mcu verilator / questa and on nexys fpga

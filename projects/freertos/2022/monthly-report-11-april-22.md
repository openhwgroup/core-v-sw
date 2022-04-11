# Software TG monthly meeting - FREERTOS (April 2022)
## Overview

### Key activities
* Ported the FreeRTOS Demo application(s) to the core-v-mcu. Currently,
  development happens at https://github.com/bluewww/Freertos/tree/core-v-mcu. as
  a fork of the classic FreeRTOS distribution. A simple hello world works.
  Blinky doesn't work due to the periodic timer interrupt not firing. Needs more
  analysis.
* Reviewed changes in core-v-freertos-kernel that qualify for upstreaming.
  Currently, no changes need to be upstreamed to get a rv32imc baseline
  working.

### Test results

### Risk Register

No changes.

### Next stages
  1. Analyze and fix timer interrupt issue. Move from custom timer code to
     `mtime` based solution.
  2. Get blinky and full demo to work
  3. Test with core-v-mcu verilator / questa and on nexys fpga

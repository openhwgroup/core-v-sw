# Software TG monthly meeting - FREERTOS (July 2022)
## Overview

### Key activities
* Ported the FreeRTOS Demo application(s) to the core-v-mcu. Currently,
  development happens at https://github.com/bluewww/Freertos/tree/core-v-mcu. as
  a fork of the classic FreeRTOS distribution. A simple hello world works.
  Blinky doesn't work due to the periodic timer interrupt not firing. Needs more
  analysis.
* Working on getting questasim setup for core-v-mcu running. We had trouble with
  loading binaries into the simulation. Added jtag testbench that is able to
  load srec files to core-v-mcu at
  https://github.com/bluewww/core-v-mcu/commits/jtag-tb. Still working in progress.
* Debugging silent UART on genesys2

### Test results

### Risk Register

No changes.

### Next stages
  1. Analyze and fix timer interrupt issue. Move from custom timer code to
     `mtime` based solution.
  2. Get blinky and full demo to work
  3. Test with core-v-mcu verilator / questa and on nexys fpga

## Overview

### Key activities

* PULP FreeRTOS published on Github under https://github.com/pulp-platform/pulp-freertos-kernel and https://github.com/pulp-platform/pulp-freertos
* Unmodified pulp-freertos tested on Nexus A7 - the code making bad memory accesses while configuring the FLL revealed an error in the RTL emulating the FLL - fixed here - https://github.com/openhwgroup/core-v-mcu/pull/36/commits/7f3402058eda1dce9ca8f75831aab0ea86ae70a8 ;
* A new prebuilt bitstream for Nexus A7 with applied change uploaded at https://github.com/shteryana/core-v-mcu/tree/bitstream-update
* Work on proper timer interrupt configuration ongoing 
* Prototyping a more simplified version of pulp-freertos (removing all off the pulp-specific code such as cluster, custim insn, unnecessary abstractions, etc) is ongoing.

### Test results


### Planned activities for coming month

* Genesys2 pre-built bitstream from latest RTL
* Open repository with basic boot boilerplate
* boot-to-main runtime (crt0.S, board initialization)
* Add FreeRTOS kernel and get basic blinky working

### Risk Register

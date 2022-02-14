# Software TG monthly meeting - FREERTOS (February 2022)
## Overview

### Key activities
* Two meeting were held to discuss current status of project, revise goals/milestones & agree on a plan to move the project ahead

### Test results

### Risk Register

No changes.

### Next stages
Plan for comming weeks -

* Working software CORE-V emulation needed & explanation how to be run to interested parties 
* Merge kernel changes upstream
  1. In `core-v-freertos-kernel` rebase `pulp-project-devel` on top of latest
     upstream freertos release of the kernel
  2. Cleanups of the main branch
  3. Merge this updated kernel into the `core-v-freertos` repo  and test it.
  4. Make a PR from `core-v-freertos-kernel` to upstream


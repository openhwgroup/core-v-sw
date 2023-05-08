Software TG monthly meeting - CORE-V LLVM Tool Chain

## Overview

* CV32E40P (Embecosm)
    * Prepared for presentation on CORE-V LLVM at EuroLLVM.
    * Rolled forward patches for changing march prefix.
    * Rolled forward patches for removing xcv extension group.
    * Reviewed patch to match the behavior for hardware loop.
    * Reviewed patch for implementing writeback and signedness for CORE-V SIMD extension.
    * Reviewed patch to support CORE-V SIMD Builtins in Clang.

* CV32E40P (PLCT)
    * Committed patch to match behavior for Hardware Loop.
    * Committed patch to implement writeback and signedness for CORE-V SIMD.
    * Committed patch to support CORE-V SIMD builtins in clang.
    * Committed fix for MAC instructions.
    * Committed support for xcvsimd option.
    * Committed patch to update MAC instructions.

### Planned activities for coming month

* CV32E40P (Embecosm)

    * Plan to review patch to implement xcvelw encoding and intrinsics.

* CV32E40P (PLCT)
    * Plan to review patch to re-enable Windows testing as part of CI.
    * Plan to review patch to remove xcv extension.
    * Plan to review patch to update CORE-V Extension name prefix from xcorev to xcv.

# CORE-V Tool Chain supplementary notes

## Repositories

Binutils-gdb - https://github.com/openhwgroup/corev-binutils-gdb
GCC - https://github.com/openhwgroup/corev-gcc
CORE-V docs - https://github.com/openhwgroup/core-v-sw

Create your own fork until ready to create pull request into one of these repositories – all pull request must be reviewed before merging. Ensure you sign-off any pull requests to pass Eclipse foundation checks.

## -march options

All instructions must be enabled for the xcorev -march option as well as their instruction set specific option: 
    • hardware loop: xcorevhwlp
    • multiply-accumulate: xcorevmac
    • post-increment and register-indexed load/store: xcorevpostinc
    • direct branches: xcorevbi
    • general ALU operations: xcorevalu

## Other information
      
    • All instructions begin with a cv prefix e.g. cv.starti/cv.endi
    • Use GNU coding standards - https://www.gnu.org/prep/standards/
    • Relocation numbers are not yet fixed until a mechanism for vendor specific linker relocations in the psABI is decided
    • FSF assignment must be in place before any pull requests can be accepted into the OpenHW repositories
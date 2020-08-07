# `toolchain`: Basic scripts for building RISC-V compiler toolchains

## Overview

This directory contains basic scripts for building local instances of CORE-V toolchains.
The scripts provide the means of fetching the source code and building the executables
and libraries for well-defined toolchain configurations.  The intention is to
simplify the processs of building such toolchains and make it as "push-button"
(and as accessible to CORE-V users) as reasonably possible.

Currently, the scripts support only 'bare metal' toolchain configurations
intended for hardware verification of 32- and 64-bit RISC-V targets.
These configurations are deliberately lightweight and consist of:

* `binutils`: assembler, linker, and object file utilities
* `GCC`: the GNU GCC compiler configured for C only
* `newlib`: an open-source C library suitable for embedded applications.

Several extensions are envisioned:

* Explicit selection of GDB version
* Addition of LLVM/Clang compilers
* Support for Linux-based target environments
* Addition of full-featured C library implementations

## Getting started

Once the prerequisites (see [below](#Prerequisites)) are satisfied, you can fetch and build the
latest supported upstream GCC toolchain for bare-metal 32-bit and 64-bit applications in just three steps:

    # 1. Select an installation location for the toolchain (e.g., the 'toolchain' subdirectory of $RISCV).
    INSTALL_DIR=$RISCV/toolchain
    
    # 2. Fetch the source code of the toolchain (assumes Internet access.)
    sh get-toolchain.sh
    
    # 3. Build and install the toolchain (requires write+create permissions for $INSTALL_DIR.)
    sh build-toolchain.sh $INSTALL_DIR

## File and directory structure

The base infrastructure for building compilation toolchains consists of two scripts
and a directory holding configuration files:

 * `get-toolchain.sh`: script in charge of obtaining the source code and
extracting the correct code baselines.
 * `build-toolchain.sh`: script in charge of building and installing the
different toolchain components in suitable order.
 * `config/`: directory containing the configuration files for the various configurations.

In the process of building the toolchain, two new directory trees are created
under the current working directory:

 * `src/`: Source code is fetched and checked out into subdirectories of `src` in
 the current working directory.

 * `build/`: The building of the various components of the toolchain occurs in
 subdirectories of `build` in the current working directory.

This directory structure was chosen to keep the source and build directories
local to the user's workspace while supporting systematic out-of-source-tree
building of toolchain components.

## Prerequisites

**Disk space:** Approximately 7 GB of disk space are needed to build and install a bare-metal toolchain
from source code:

 * 5GB are occupied by source code (including Git history);
 * 1GB is needed for the build space;
 * 0.4GB is needed for the installed toolchain.

Several **standard packages** are needed to build the GCC-based compiler
toolchains.  On Debian/Ubuntu, executing the following command should suffice:

    $ sudo apt-get install autoconf automake autotools-dev curl git libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool bc zlib1g-dev

On Fedora/CentOS/RHEL OS, executing the following command should suffice:

    $ sudo yum install autoconf automake git libmpc-devel mpfr-devel gmp-devel gawk  bison flex texinfo gcc gcc-c++ zlib-devel

On macOS, you can use [Homebrew](http://brew.sh) to install the dependencies:

    $ brew install gawk gnu-sed gmp mpfr libmpc isl zlib

## Building a bare-metal toolchain (Newlib-based)

In order to build a toolchain you need to select a _toolchain configuration_ and
an _installation location_ (an "install prefix"):

 * the toolchain configuration name must match one of the predefined `config/CONFIG_NAME.sh`
files under `config` directory.
 
 * the installation location can be an arbitrary path.  It needs not to exist
yet: any missing directories will be created during the building process. _The user running the
`build-toolchain.sh` script must have sufficient permissions to create the
missing directories of the installation location._

Once a configuration name `CONFIG_NAME` and an installation location
`INSTALL_LOCATION` are chosen, use

    sh get-toolchain.sh CONFIG_NAME
    # E.g.,
    # sh get-toolchain.sh gcc-10.2.0-baremetal

to fetch/update the source code and to check out the matching baseline of code.

_**NOTE:** The first invocation of 'get-toolchain.sh' can take approximately half an hour as there
are 3 GB of data that will be first fetched from remote Git repositiories, then
unpacked for each of the components.  Subsequent executions take usually between
5 and 15 seconds as they only fetch new updates from remote servers and check
out the requested baseline._

If the name of the toolchain configuration is omitted, a default configuration
will be selected implicitly.  _The default configuration is currently named
`gcc10-baremetal` and points to the most recent GCC 10.x configuration defined
under `config/`._

To build the toolchain from the retrieved source baseline, use

    sh build-toolchain.sh CONFIG_NAME INSTALL_DIR
    # E.g.,
    # sh build-toolchain.sh gcc-10.2.0-baremetal $RISCV/toolchain

The `build-toolchain.sh` script incorporates fallbacks for several commonly encountered configuration and
build issues. However, it is not meant to auto-detect major reconfigurations of source
code such as a change of baseline configuration.  _Whenever the source
configuration is changed, please use the `-f` (or `--force`)
option to forcibly rebuild the entire toolchain_:

    sh build-toolchain.sh -f CONFIG_NAME INSTALL_DIR
    # E.g.,
    # sh build-toolchain.sh -f gcc-10.2.0-baremetal $RISCV/toolchain

## Defining new configurations

Users involved with toolchain validation and development may be interested in
creating new configurations that cater for specific needs:

 * use of local Git mirrors to enable toolchain development and to shorten
   Git query times
 * building of experimental toolchains combining specific versions of individual
   components.

New configurations can be easily introduced by copying existing
configuration files in subdirectory `config/` under a different name and
adjusting the values of per-component variables.  Taking `GCC` as an example:

 * `GCC_DIR` defines the location of GCC source code.
 * `GCC_REPO` selects the Git repository to fetch GCC code from. 
 * `GCC_COMMIT` identifies the revision of source code to use: a specific commit,
   tag, or branch. \
   _**NOTE:** If you set `GCC_COMMIT` to the name of a branch, the
   `get-toolchain.sh` will update the local repository to the tip of the remote
   branch at every invocation._

 * `GCC_CONFIGURE_OPTS` is the list of options to pass to the configure script. \
   _**NOTE:** Since `GCC_CONFIGURE_OPTS` is a Bourne shell variable, any double-quotes in
   the option list must be duly escaped to be correctly handled by the shell._

#!/bin/sh

#############################################################################
#
# Copyright 2020 Thales
#
# Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://solderpad.org/licenses/
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#############################################################################
#
# Original Author: Zbigniew Chamski (zbigniew.chamski@invia.fr)
#
#############################################################################

# Prerequisites:
#
# - autotools
# - GNU make
# - flex (which flex)
# - bison (which bison)
# - isl
# - gmp
# - mpz
# - mpc
# - texinfo
# - 15 GB of disk space

# Helper function to print usage information.
function print_usage()
{
    echo Usage:
    echo "        your-favorite-shell $0 [CONFIG_NAME]"
    echo ""
    echo "        CONFIG_NAME    Use configuration from file config/CONFIG_NAME.sh"
}   

# Helper function to parse the cmdline args.
# Takes the complete list of positional args as input, drops them locally as they get parsed.
function parse_cmdline()
{
    # There must be exactly one positional arg.
    if [ $# -gt 1 ]; then
	echo "*** Incorrect number of cmdline arguments ($#), exiting!"
	echo ""
	print_usage
	exit 11
    fi
	
    # The only, optional arg is supposed to be the config name.
    if [ $# -eq 1 ]; then
	CONFIG_NAME=$1
	shift
    fi
}

# ======== Default settings: GCC 10 baremetal ========
# - toolchain configuration
#   NOTE: config/$CONFIG_NAME.sh can be a symbolic link.
CONFIG_NAME="gcc10-baremetal"

# ======== Parse the command line ========
parse_cmdline $@

# ======== Read configuration information =========
# Check for the presence of source code and build configuration file.

CONFIG_FILE="config/$CONFIG_NAME.sh"

if [ -f $CONFIG_FILE ]; then
    # File present: read the settings.
    . $CONFIG_FILE
else
    echo "*** Configuration file '$CONFIG_FILE' missing, bailing out!"
    echo ""
    print_usage
    exit 12
fi
# ========= Populate/update the directories =========

# Hook for the future tarball-only option
# if [ $# -lt 2 -o $1 == "git"]; then
#    # populate directories from Git
# else
#    # populate directories from tarballs
# fi

# Overall directory infrastructure: make sure `pwd`/src exists.
[ ! -d src ] && mkdir src

# All Git-based source trees are handled in the same way.
# Positional args:
# - $1: the Git repository to use
# - $2: the local directory for the source code
# - $3: the actual commit to check out (SHA1, tag, etc.)
function setup_sources_from_git()
{
    # make sure the source directory exists and is populated
    # with Git information.  If a stale non-Git directory exits,
    # remove it unless it is write-protected.
    [ -d $2 -a -d $2/.git ] || \
    { rm -rf $2 &&  \
	  git clone $1 $2 ; }

    # Fetch any possible updates and check out the required revision.
    cd $2
    git fetch origin
    git checkout $3
    cd -
}

# Binutils
setup_sources_from_git $BINUTILS_REPO $BINUTILS_DIR $BINUTILS_COMMIT

# GCC
setup_sources_from_git $GCC_REPO $GCC_DIR $GCC_COMMIT

# Newlib
setup_sources_from_git $NEWLIB_REPO $NEWLIB_DIR $NEWLIB_COMMIT

# Exit happily.
exit 0

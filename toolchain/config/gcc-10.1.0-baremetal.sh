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

# Name of the target to use for the toolchain.
export TARGET=riscv-none-elf

# ======= Source code setup: path, repo, commit, configure options ========

# Each *_COMMIT variable can designate any valid 'commit-ish' entity:
# typically a tag, a commit or the output of "git describe" of a Git tree.

# Binutils
BINUTILS_DIR=src/binutils-gdb
BINUTILS_REPO=https://sourceware.org/git/binutils-gdb.git
# Use the first commit past the 'bintuils-2_34' tag.
# The commit at the tag does not build with 'make all ; make install',
# and a binutils-only approach with 'make all-binutils ; make install-binutils'
# does not work for binutils 2.35 + GCC 10.2.0.
BINUTILS_COMMIT=binutils-2_34-1-g871ac467f5
BINUTILS_CONFIGURE_OPTS="\
	--prefix=$PREFIX \
	--target=$TARGET \
 	--disable-nls \
 	--disable-werror"

# GCC
GCC_DIR=src/gcc
GCC_REPO=https://github.com/gcc-mirror/gcc.git
GCC_COMMIT=releases/gcc-10.1.0

GCC_CONFIGURE_OPTS="\
	--prefix=$PREFIX \
	--target=$TARGET \
	--enable-languages=c,lto \
	--disable-libssp \
	--disable-libgomp \
	--disable-libmudflap"

# newlib
NEWLIB_DIR=src/newlib
NEWLIB_REPO=https://sourceware.org/git/newlib-cygwin.git
NEWLIB_COMMIT=newlib-3.3.0

NEWLIB_CONFIGURE_OPTS="\
	--prefix=$PREFIX \
	--target=$TARGET \
	--enable-multilib"

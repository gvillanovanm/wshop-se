#!/usr/bin/env bash
#
# install-tools.sh
#
# This script automates the installation of:
#   1. RISC-V GNU Toolchain (bare-metal only, multilib enabled)
#   2. Spike (RISC-V ISA Simulator)
#   3. RISC-V Proxy Kernel (riscv-pk)
#   4. QEMU RISC-V packages
#
# By default, everything is installed under:
#   /workspace/riscv-tools
#
# Adjust WORKDIR if you prefer a different installation directory.

set -e
set -o pipefail

###########################
#  User‐Adjustable Section
###########################

# Base directory for all RISC-V installations
WORKDIR="/workspace/riscv-tools"

# Installation prefix for the RISC-V GNU Toolchain, Spike, and PK
# All binaries and libraries will be placed under $RISCV
RISCV="${WORKDIR}/main"

# Number of parallel jobs for 'make'
JOBS="$(nproc)"

###########################
#  Helper Functions
###########################

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

###########################
#  Begin Installation
###########################

log "Creating workspace directory at $WORKDIR"
mkdir -p "${WORKDIR}"
cd "${WORKDIR}"

# Export RISCV environment variable for subsequent installations
export RISCV

###########################
#  1. RISC-V GNU Toolchain
###########################

if [ ! -d "${WORKDIR}/riscv-gnu-toolchain" ]; then
    log "Cloning riscv-gnu-toolchain into ${WORKDIR}/riscv-gnu-toolchain"
    git clone https://github.com/riscv/riscv-gnu-toolchain.git
else
    log "Directory riscv-gnu-toolchain already exists; skipping clone"
fi

log "Building RISC-V GNU Toolchain (bare-metal, multilib enabled)"
cd "${WORKDIR}/riscv-gnu-toolchain"
./configure --prefix="${RISCV}" --enable-multilib
make -j"${JOBS}"
log "RISC-V GNU Toolchain installed to ${RISCV}"

###########################
#  2. Spike (ISA Simulator)
###########################

cd "${WORKDIR}"

if [ ! -d "${WORKDIR}/spike" ]; then
    log "Cloning spike (riscv-isa-sim) into ${WORKDIR}/"
    git clone https://github.com/riscv-software-src/riscv-isa-sim.git
else
    log "Directory spike already exists; skipping clone"
fi

log "Building Spike"
mkdir -p spike/build
cd spike/build
../configure --prefix="${RISCV}"
make -j"${JOBS}"
make install
log "Spike installed under ${RISCV}"

###########################
#  3. RISC-V Proxy Kernel (riscv-pk)
###########################

cd "${WORKDIR}"

if [ ! -d "${WORKDIR}/riscv-pk" ]; then
    log "Cloning riscv-pk into ${WORKDIR}/riscv-pk"
    git clone https://github.com/riscv-software-src/riscv-pk.git
else
    log "Directory riscv-pk already exists; skipping clone"
fi

log "Building RISC-V Proxy Kernel (64-bit, riscv64-unknown-elf host)"
mkdir -p riscv-pk/build
cd riscv-pk/build
../configure --prefix="${RISCV}" --host=riscv64-unknown-elf
make -j"${JOBS}"
make install
log "riscv-pk installed under ${RISCV}"

###########################
#  Notes for VSCode C/C++ Extension
###########################

echo
log "NOTE: To enable native debugging and IntelliSense in VSCode, install the 'ms-vscode.cpptools' extension manually."
log "Installation complete. Please add ${RISCV}/bin to your PATH:"
echo
echo "    export PATH=\"\$PATH:${RISCV}/bin\""
echo
log "You can verify the installation by running:"
echo
echo "    riscv64-unknown-elf-gcc --version"
echo "    spike --version"
echo "    riscv64-unknown-elf-ld --version"
echo "    qemu-system-riscv64 --version"
echo

exit 0

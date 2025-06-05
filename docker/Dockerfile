# syntax=docker/dockerfile:1.4
FROM ubuntu:22.04

# noninteractive installs
ENV DEBIAN_FRONTEND=noninteractive

# System packages & build tools
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
      build-essential make ninja-build wget curl git cmake \
      autotools-dev autoconf automake libtool patchutils bison flex \
      texinfo device-tree-compiler \
      libgmp-dev libmpfr-dev libmpc-dev libexpat-dev zlib1g-dev \
      libjson-c-dev libevent-dev libslirp-dev libboost-all-dev \
      libusb-1.0-0-dev pkg-config \
      python3 python3-pip python3-tomli meson gtkterm gawk \
      openocd verilator bc wget vim tree bash-completion \
      qemu-system-misc qemu-user-static opensbi u-boot-qemu && \
    rm -rf /var/lib/apt/lists/*

# Enable bash-completion and makefile completion
RUN echo 'if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi' >> /etc/bash.bashrc && \
    mkdir -p /etc/bash_completion.d && \
    echo '#!/bin/bash\n\
_make_targets()\n\
{\n\
    local curr\n\
    curr="${COMP_WORDS[COMP_CWORD]}"\n\
    COMPREPLY=( $(compgen -W "$(make -pRrq : 2>/dev/null | awk -v RS= -F: '\''/^[^.#%][^=]*:/ {print $1}'\'' | sort -u)" -- "$curr") )\n\
}\n\
complete -F _make_targets make' > /etc/bash_completion.d/make && \
    chmod +x /etc/bash_completion.d/make

WORKDIR /workspace
CMD ["/bin/bash"]

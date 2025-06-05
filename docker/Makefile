# Setup
IMAGE          = dk-riscv-wshop-se
CONTAINER_NAME = dk-riscv-wshop-se
HOST_PATH      = $(PWD)
CONTAINER_PATH = /workspace
HOSTNAME       = dk-riscv-wshop-se

# Docker cmds
dk_run:
	docker run -h $(HOSTNAME) -it --rm \
	  --name $(CONTAINER_NAME) \
	  --memory=6g \
	  --memory-swap=6g \
	  --ulimit nproc=4096:8192 \
	  --ulimit nofile=65536:65536 \
		 -e DISPLAY=host.docker.internal:0 \
	  -v $(HOST_PATH):$(CONTAINER_PATH) \
	  $(IMAGE) \
	  /bin/bash -c "cd $(CONTAINER_PATH) && /bin/bash"

# validated only in macos
dk_run_eyes:
	docker run -h $(HOSTNAME) -it --rm -e DISPLAY=host.docker.internal:0 -v $(HOST_PATH):$(CONTAINER_PATH) $(IMAGE) /bin/bash -c "cd $(CONTAINER_PATH) && /bin/bash"

dk_build:
	docker build -t $(IMAGE) .

# only macos users
dk_help:
	echo "open xquartz and type: xhost +gvillanovanm.local for graphical support"

# 1) run it
# 2) open xquartz and type: xhost +gvillanovanm.local 

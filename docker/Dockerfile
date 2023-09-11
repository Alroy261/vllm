FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
		  vim git curl tmux wget unzip apt-utils software-properties-common \
		  libglib2.0-0 python3-dev python3-pip && \
		rm -rf /var/lib/apt/lists/*

RUN pip install vllm

# TODO: revert to main if everything is working properly
RUN git clone -b dev-alroy https://github.com/Alroy261/vllm.git

EXPOSE 8000

ENTRYPOINT ["python3", "-m", "vllm.entrypoints.api_server"]

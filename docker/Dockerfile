FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
		  vim git curl tmux wget unzip apt-utils software-properties-common \
		  libglib2.0-0 python3-dev python3-pip && \
		rm -rf /var/lib/apt/lists/*

RUN pip install vllm

ADD ./vllm/entrypoints/api_server.py .

EXPOSE 8000

ENTRYPOINT ["python3", "api_server.py"]

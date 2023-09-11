#!/bin/bash

docker build \
    -t vllm_image:latest \
    -f ./docker/Dockerfile \
    --progress=plain \
    .

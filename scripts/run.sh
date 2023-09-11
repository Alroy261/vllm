IMAGE_NAME="vllm_alroy"
CONTAINER_NAME="vllm_container"

docker build \
    -t $IMAGE_NAME \
    -f ./docker/Dockerfile \
    --progress=plain \
    .

docker run -p 8000:8000 --name $CONTAINER_NAME $IMAGE_NAME:latest


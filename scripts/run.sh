IMAGE_NAME="vllm_image"
CONTAINER_NAME="vllm_container"

docker build \
    -t $IMAGE_NAME \
    -f ./docker/Dockerfile \
    --progress=plain \
    .

docker run --name $CONTAINER_NAME -p 8000:8000 $IMAGE_NAME:latest

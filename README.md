# Poetry CUDA Docker image

## Usage
```bash
docker run --pull always --gpus all --shm-size 8g --rm -it -e UID=$(id -u) -e GID=$(id -g) -v $(pwd):/home/user/workspace -w /home/user/workspace ghcr.io/shuyana/docker-python-gpu:latest
```

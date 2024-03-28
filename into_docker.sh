xhost +local:root 1>/dev/null 2>&1

CONTAINER_NAME=ubuntu-ros

docker exec -u root -it $CONTAINER_NAME /bin/bash

xhost -local:root 1>/dev/null 2>&1


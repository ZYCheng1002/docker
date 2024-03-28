#docker kill $(docker ps -a -q); docker rm $(docker ps -a -q )

CONTAINER_NAME=ubuntu-ros

docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

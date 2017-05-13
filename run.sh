#!/bin/bash

IMAGENAME=miyatama/chrome-pdf:1.0
CONTAINERNAME=chrome-pdf

exists=`docker ps -a | grep "${CONTAINERNAME}" | grep -c "" ; true`
if [ ${exists} -ge 1 ] ; then
  echo "stopping container"
  id=`docker ps -a -q -f name=${CONTAINERNAME}`
  docker stop ${id}
  docker rm ${id}
fi

docker run \
  --rm \
  --name ${CONTAINERNAME} \
  --volume $PWD/data:/data \
  ${IMAGENAME}

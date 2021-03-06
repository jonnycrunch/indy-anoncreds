#!/usr/bin/env bash

set -x
set -e

if [ -z $1 ]; then
    CMD="/root/build-3rd-parties.sh /output"
else
    CMD=$1
fi

PKG_NAME=indy-anoncreds
IMAGE_NAME=${PKG_NAME}-build-u1604
OUTPUT_VOLUME_NAME=${PKG_NAME}-deb-u1604

docker build -t ${PKG_NAME}-build-u1604 -f Dockerfile .
docker volume create --name ${OUTPUT_VOLUME_NAME}

docker run \
    -i \
    --rm \
    -v ${OUTPUT_VOLUME_NAME}:/output \
    ${IMAGE_NAME} \
    $CMD

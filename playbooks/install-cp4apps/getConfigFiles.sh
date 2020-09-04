#! /bin/bash

export ENTITLED_REGISTRY=cp.icr.io
export ENTITLED_REGISTRY_USER=cp
export ENTITLED_REGISTRY_KEY=$1

if [ ! -d ./data ]; then
    echo "Data directory not found, downloading configuration files."
    # curl 

    mkdir data
    docker run -v $PWD/data:/data:z -u 0 \
            -e LICENSE=accept \
            "$ENTITLED_REGISTRY/cp/icpa/icpa-installer:4.2.1" cp -r "data/*" /data

else 
    echo "Files already exist locally."
fi
#!/bin/bash

ADDR=$1
NODE=$2

IGNITION_FILE="${NODE}-ignition.json"
make -C ignition output/${IGNITION_FILE}

mkdir -p payload
cp ignition/output/${IGNITION_FILE} payload/ignition.json
cp install-flatcar.sh payload/
scp -r payload root@${ADDR}:/root
ssh root@${ADDR} bash ./payload/install-flatcar.sh
rm -rf payload

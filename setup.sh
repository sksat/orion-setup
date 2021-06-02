#!/bin/bash

function setup_master(){
	local temp_addr
	read -rp "temporary addr> " temp_addr
	./ignition.sh ${temp_addr} master
	sleep 30
	scp -r k8s core@192.168.10.201:~
	ssh core@192.168.10.201 k8s/setup-common.sh
	ssh core@192.168.10.201
}

case $1 in
	"master") setup_master ;;
esac

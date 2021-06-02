.ONESHELL:
SHELL=/bin/bash

CT_REPO="https://github.com/kinvolk/container-linux-config-transpiler"
CT_BIN=./ct/bin/ct

depend: $(CT_BIN)

clean:
	rm -rf output
	rm -f node-*.yml
	rm -f networkd-*.yml

node-%.yml: passwd.yml networkd-%.yml storage.yml
	@cat $^ > $@

networkd-%.yml: networkd.yml
	@NODE_NAME=$$(echo $@ | sed 's/networkd-//' | sed 's/\.yml//')
	echo "node name: $$NODE_NAME"
	if [ $$NODE_NAME = "master" ]; then
		ADDR=192.168.10.201
	elif [[ $$NODE_NAME == "worker"* ]]; then
		WORKER_NUMBER=$$(echo $$NODE_NAME | sed 's/worker//')
		LAST=$$(echo $$(( 201 + $$WORKER_NUMBER )) )
		ADDR=$$(echo "192.168.10.$$LAST")
	else
		echo unknown
	fi
	echo "address: $$ADDR"
	cp $< $@
	echo "        Address=$$ADDR/24" >> $@

output/%-ignition.json: node-%.yml $(CT_BIN)
	@mkdir -p output
	cat $< | $(CT_BIN) > $@

$(CT_BIN):
	git clone $(CT_REPO) ct
	make -C ct


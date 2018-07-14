#!/usr/bin/env bash

if [ ! -d "bitshares-core/" ]; then
	git clone https://github.com/shuvozula/bitshares-core.git
fi

if [ ! -d "bitshares-ui/" ]; then
	git clone https://github.com/shuvozula/bitshares-ui.git
fi

if [[ -z $(docker ps -a | grep fullnode | awk {'print $1'}) ]]; then
	echo "Creating core docker image...."
	cd bitshares-core/
	docker build -t core .
	cd -
fi

if [[ -z $(docker ps -a | grep ui | awk {'print $1'}) ]]; then
	echo "Creating ui docker image...."
	cd bitshares-ui/
	docker build -t ui .
	cd -
fi

echo "Starting services...."
docker-compose \
	-f docker-compose-nodes.yml \
	-f docker-compose-ui.yml \
	up

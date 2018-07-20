#!/usr/bin/env bash

echo "Stopping services...."
docker-compose \
	-f docker-compose-nodes.yml \
	-f docker-compose-ui.yml \
	stop

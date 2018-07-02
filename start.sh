#!/usr/bin/env bash

echo "Creating core docker image...."
cd bitshares-core/
docker build -t core .
cd -

echo "Creating ui docker image...."
cd bitshares-ui/
docker build -t ui .
cd -

echo "Starting services...."
docker-compose up

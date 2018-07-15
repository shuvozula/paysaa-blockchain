# Paysaa Blockchain

## Prerequisites:

### Memory
Minimum of *20GB* of memory required, since it runs 2 graphene/bitshares nodes (full and delayed), as well as the UI node.

### Docker, Docker-Compose
[Install](https://docs.docker.com/install/linux/docker-ce/ubuntu/) docker for your platform.
[Install](https://docs.docker.com/compose/install/) docker-compose for your platform.

## Fire up the nodes

Run `./start.sh` and that will do the following:
1. Clones the `bitshares-core` and `bitshares-ui` repos. Change the URLs as necessary for your own custom builds.
2. Builds the docker-images for the core and ui nodes.
3. Starts the orchestration of the docker nodes (Full-node, Delayed-Node and UI) using Docker-Compose.
4. Use a tool like `wscat` (npm install -g wscat) to test whether the RPC endpoints are active (Fullnode=8090, DelayedNode=8091):
```
$ wscat -c http://localhost:8090
```
5. Visit `http://localhost:82` to interact with the UI node and configure it to connect to either of the core nodes (once they're sycnced and their RPC endpoints are active).

NOTE: These endpoints are active only after the nodes are fully synced, which may take a few minutes, to an hour depending on network bandwidth and system resources.

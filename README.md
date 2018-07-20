# Paysaa Blockchain

## Prerequisites:

### Memory
Minimum of *20GB* of memory required, since it runs:
1. Full Graphene/Bitshare node
2. Delayed Graphene/Bitshare node.
3. Graphene/Bitshare UI node powered by Nginx.

### Docker, Docker-Compose

1. [Install](https://docs.docker.com/install/linux/docker-ce/ubuntu/) docker for your platform.
2. [Install](https://docs.docker.com/compose/install/) docker-compose for your platform.

### Proxy services
Disable any proxy services, like OpenVPN. These will prevent Docker from creating network interfaces.

## Fire up the nodes

Run `./start.sh` and that will do the following:
1. Clones the `bitshares-core` and `bitshares-ui` repos. Change the URLs as necessary for your own custom builds.
2. Builds the docker-images for the core and ui nodes.
3. Starts the orchestration of the docker nodes (Full-node, Delayed-Node and UI) using Docker-Compose.

## Test
* Once the nodes are fully synced, Use a tool like `wscat` (`npm install -g wscat`) to test whether the RPC endpoints are active (Fullnode=`localhost:8090`, DelayedNode=`localhost:8091`):
```
$ wscat -c http://localhost:8090
```
* Visit [http://localhost:82](http://localhost:82) to interact with the UI node and configure it to connect to either of the core nodes (once they're sycnced and their RPC endpoints are active).

NOTE: These endpoints are active only after the nodes are fully synced, which may take a few minutes, to an hour depending on network bandwidth and available system resources.

## Ports
The ports can be subject to change since they're controlled by `docker-compose-(nodes/ui).yml` files.	

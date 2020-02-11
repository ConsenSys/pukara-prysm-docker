# Ethereum 2 client: Prysm docker image

Ethereum 2 client, beacon and validator nodes docker images with probes

Upstream repository: https://github.com/prysmaticlabs/prysm

## Usage

Starting a beacon-node with an JSON RPC endpoint on port 4001

 ```docker run --rm -p4000:4000 -p4001:4001 consensys/prysm beacon-chain --grpc-gateway-port 4001```

## How to update the image

Select the appropriate prysm sha256 digests and edit the present Dockerfile

## Version

Current version is fixed at **LATEST** at gcr.io/prysmaticlabs/prysm/{beacon-chain,validator} build time https://github.com/prysmaticlabs/prysm

## Docker-fu

### Debugging

> docker run --rm consensys/prysm --help

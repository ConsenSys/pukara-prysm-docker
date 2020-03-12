# Ethereum 2 client: Prysm docker image

Ethereum 2 client, beacon and validator nodes docker images with probes

Upstream repository: https://github.com/prysmaticlabs/prysm

## Usage

Starting a beacon-node with an JSON RPC endpoint on port 4001

 ```docker run --rm -p4000:4000 -p4001:4001 consensys/prysm beacon-chain --grpc-gateway-port 4001```

## How to update the image

 1. Watch for recent changelog at https://github.com/prysmaticlabs/prysm/releases
 2. Watch for latest releases and issues associated if any
 3. Select the appropriate prysm sha256 digest (Filter using HEAD-$COMMIT_TAG{1-7}):
  - beacon-chain: https://console.cloud.google.com/gcr/images/prysmaticlabs/GLOBAL/prysm/beacon-chain
  - validator: https://console.cloud.google.com/gcr/images/prysmaticlabs/GLOBAL/prysm/validator
 4. Replace digests in the Dockerfile

## Version

Current version is fixed at 0.3.3 @ 2020-03-07

## Docker-fu

### Debugging

> docker run --rm consensys/prysm --help

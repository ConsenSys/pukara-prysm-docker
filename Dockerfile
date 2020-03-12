FROM gcr.io/prysmaticlabs/prysm/beacon-chain@sha256:94aad38139ca8f50c80879bdd6e4684102e7e629fe7b3d9b293932bd65a46eac as beacon
FROM gcr.io/prysmaticlabs/prysm/validator@sha256:808b5dd020c12ffb3472a10fdbe113dbfa89bf1ed740f5a110406e725e4ff900 as validator
MAINTAINER Sylvain Laurent <sylvain.laurent@consensys.net>
LABEL version="0.1.2"
LABEL appversion="0.3.3"
LABEL description="Ethereum 2 Prysm client, beacon and validator node"

FROM debian:10-slim

RUN apt-get update && apt-get -y install \
	libssl1.1 jq curl

COPY --from=beacon /app/beacon-chain/image.binary.runfiles/prysm/beacon-chain/linux_amd64_stripped/image.binary /beacon-chain
COPY --from=validator /app/validator/image.binary.runfiles/prysm/validator/linux_amd64_stripped/image.binary /validator

COPY readiness_probe.sh /

EXPOSE 4000
EXPOSE 4001
ENTRYPOINT [ "/beacon-chain" ]
CMD [ "" ]

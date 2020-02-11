FROM gcr.io/prysmaticlabs/prysm/beacon-chain@sha256:1ed9ff5f012fa6419ab507b327ee6d5a9e4c45918adb62e3c06f8ba9c99db8df as beacon
FROM gcr.io/prysmaticlabs/prysm/validator@sha256:56244949688e11dc7f5bd7b15461440f83bfea2d6f93abc40ccd60fd2cd8ebd0 as validator
MAINTAINER Sylvain Laurent <sylvain.laurent@consensys.net>
LABEL version="0.1"
LABEL description="Ethereum 2 Prysm client, beacon and validator node"

FROM debian:10-slim

#RUN apt-get update && apt-get -y install \
#	libssl1.1 jq curl

COPY --from=beacon /app/beacon-chain/image.binary.runfiles/prysm/beacon-chain/linux_amd64_stripped/image.binary /beacon-chain
COPY --from=validator /app/validator/image.binary.runfiles/prysm/validator/linux_amd64_stripped/image.binary /validator

COPY readiness_probe.sh /

EXPOSE 4000
EXPOSE 4001
ENTRYPOINT [ "/beacon-chain" ]
CMD [ "" ]

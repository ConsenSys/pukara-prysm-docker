#!/bin/bash

host=$1
port=$2

peer_count=`curl -s "http://${host}:${port}/eth/v1alpha1/node/peers" | jq '.peers|length'`
syncing=`curl -s "http://${host}:${port}/eth/v1alpha1/node/syncing" | jq '.syncing'`

# Ready if beacon node has peer and is not syncing

[[ $peer_count -gt 0 ]] && [[ x"$syncing" != "xtrue" ]]

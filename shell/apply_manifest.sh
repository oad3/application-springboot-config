#!/bin/bash

# ex) ./shell/apply_manifest.sh 0.0.4-4

# 共通関数
source ./shell/function_common.sh

# apply_manifest
if [ "${1}" = "" ]; then
  log "##### Insufficient arguments"
  exit 1
fi

log "##### start #####"
log "##### tag   : ${1}"

sed -i "s/@tag@/${1}/g" ./app-deployment.yml

log "##### apply manifest #####"
log "##### kubectl apply -f ./app-deployment.yml"
kubectl apply -f ./app-deployment.yml

log "##### kubectl apply -f ./app-service.yml"
kubectl apply -f ./app-service.yml

exit 0

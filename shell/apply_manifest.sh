#!/bin/bash

# ex) ./apply_manifest.sh 0.0.2

# 共通関数
source ./function_common.sh

# apply_manifest
if [ "${1}" = "" ]; then
log "##### Insufficient arguments"
exit 1
fi

log "##### start #####"
log "##### tag   : ${1}"

log "##### apply manifest #####"
log "##### kubectl apply -f ../${1}/app-deployment.yml"
kubectl apply -f ../${1}/app-deployment.yml
log "##### kubectl apply -f ../app-service.yml"
kubectl apply -f ../app-service.yml

exit 0

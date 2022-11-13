#!/bin/bash

# ex) ./shell/apply_manifest.sh application-springboot 0.0.4-4

# 共通関数
source ./shell/function_common.sh

# apply_manifest
if [ -z "${1}" ] || [ -z "${2}" ]; then
  log "##### Insufficient arguments"
  exit 1
fi

log "##### start #####"
log "##### app   : ${1}"
log "##### tag   : ${2}"

sed -i "s/@tag@/${2}/g" ./${1}-deployment.yml

log "##### apply manifest #####"
log "##### kubectl apply -f ./${1}-deployment.yml"
kubectl apply -f ./${1}-deployment.yml

log "##### kubectl apply -f ./${1}-service.yml"
kubectl apply -f ./${1}-service.yml

exit 0


#!/bin/bash

# 共通関数
source ./function_common.sh

# マニフェストファイル名
TARGET_FILE='app-deployment.yml'

# ヘルプ
# ex) ./add_manifest.sh -a oad3jp999\\\/application-springboot 2.0.0
function usage() {
cat <<_EOT_
Usage:
  $0 [-a image_name tag]

Description:
  add manifest for arguments version

Options:
  -a          add manifest
  -h (-help)  help

_EOT_
exit 1
}

# マニフェスト追加
add_manifest() {

  if [ "${1}" = "" -o "${2}" = "" ]; then
    log "##### Insufficient arguments"
    exit 1
  fi

  log "##### start #####"
  log "##### image : ${1}"
  log "##### tag   : ${2}"

  log "##### make directory #####"
  mkdir -p ${2}
  target_dir="$(pwd)/${2}"
  log "##### ${target_dir}"

  log "##### copy manifest #####"
  cp ./${TARGET_FILE} ./${2}/${TARGET_FILE}
  log "##### $(ls -la ${target_dir})"

  log "##### mod manifest #####"
   sed -i "s/${1}.*/${1}:${2}/g" ./${2}/${TARGET_FILE}
  log "##### $(grep ${1} ${target_dir}/${TARGET_FILE})"

  exit 0
}

# オプション
if [ "$OPTIND" = 1 ]; then
  while getopts abf:h OPT
  do
    case $OPT in
      a)
        add_manifest ${2} ${3}
        ;;
      h)
        echo "h option. display help"
        usage
        ;;
      help)
        echo "help option. display help"
        usage
        ;;
      \?)
        echo "Try to enter the h option." 1>&2
        ;;
    esac
  done
else
  echo "No installed getopts-command." 1>&2
  exit 1
fi

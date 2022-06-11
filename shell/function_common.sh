#!/bin/bash

# ログ出力先
LOG_PATH="$(pwd)" 

# ログファイル名を設定。
LOG_NAME="$(basename $0 | sed -e 's/.sh//g').log"

# ログ関数
function log () {
  # ログ出力先とログ名を関数に設定。
  LOG=$LOG_PATH/$LOG_NAME
  # ログ出力日時のフォーマット yyyy/mm/dd hh:mm:ss 
  time=$(date '+%Y/%m/%d %T')

  # 最初の引数の文字列をログ出力
  echo -e "$time" "$1" | tee -a $LOG

  # 2番目の引数があればそれもログに出力（エラーログで使用）
  if [[ $2 != "" ]]; then
      echo -e "$2" | tee -a $LOG
  fi   
}

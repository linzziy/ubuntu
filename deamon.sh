#!/bin/bash

WORKDIR="$1"
CMD="$2"

if [ -z "$WORKDIR" ] || [ -z "$CMD" ]; then
  echo "用法: $0 <工作目录> <启动命令>"
  echo "示例: $0 ~/my-app 'python3 app.py'"
  exit 1
fi

cd "$WORKDIR" || {
  echo "工作目录不存在：$WORKDIR"
  exit 1
}

while true; do
  echo "启动命令：$CMD"
  eval "$CMD"
  echo "进程退出，5秒后重启..."
  sleep 5
done
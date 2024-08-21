#!/bin/bash

# 定义目标目录
TARGET_DIR="/mnt/kaiwu-group-z6/leoniuschen/Project/StableDub.github.io/static/video"

# 检查目标目录是否存在
if [ ! -d "$TARGET_DIR" ]; then
  echo "目录 $TARGET_DIR 不存在"
  exit 1
fi

# 使用 find 命令递归查找所有 .mp4 文件
find "$TARGET_DIR" -type f -name "*.mp4" | while read -r file; do
  # 检查文件名中是否包含 #
  if [[ "$file" == *"#"* ]]; then
    # 构建新的文件名
    new_file="${file//\#/_}"
    # 重命名文件
    mv "$file" "$new_file"
    echo "重命名: $file -> $new_file"
  fi
done

echo "所有文件处理完毕"

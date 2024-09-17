#!/bin/bash

# 遍历src目录下的所有文件夹
for dir in src/*/; do
    # 提取文件夹编号
    num=$(basename "$dir" | cut -d'-' -f1)
    
    # 检查Swift文件
    for file in "$dir"*.swift; do
        if [ -f "$file" ]; then
            # 构造新文件名
            new_name="S${num}$(basename "$file" .swift).swift"
            
            # 确定目标子文件夹
            target_dir="swift-solutions/Sources/Slns${num:0:1}kTo$((${num:0:1}+1))k"
            
            # 移动并重命名文件
            mv "$file" "$target_dir/$new_name"
            
            echo "已移动 $file 到 $target_dir/$new_name"
        fi
    done
done
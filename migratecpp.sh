#!/bin/bash

# 函数:将驼峰命名转换为蛇形命名
to_snake_case() {
    echo "$1" | sed -r 's/([a-z0-9])([A-Z])/\1_\2/g' | tr '[:upper:]' '[:lower:]'
}

# 遍历src目录下的所有文件夹
for dir in src/*/; do
    # 提取文件夹编号
    num=$(basename "$dir" | cut -d'-' -f1)
    
    # 检查C++文件
    for file in "$dir"*.cpp; do
        if [ -f "$file" ]; then
            # 获取文件名(不含扩展名)并转换为蛇形命名
            base_name=$(basename "$file" .cpp)
            snake_name=$(to_snake_case "$base_name")
            
            # 构造新文件名
            new_name="s${num}_${snake_name}.cpp"
            
            # 确定目标子文件夹
            target_dir="cpp-solutions/src/slns${num:0:1}kto$((${num:0:1}+1))k"
            
            # 移动并重命名文件
            mv "$file" "$target_dir/$new_name"
            
            echo "已移动 $file 到 $target_dir/$new_name"
        fi
    done
done
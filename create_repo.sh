#!/bin/bash

# 检查参数
if [ $# -ne 2 ]; then
    echo "用法: $0 <本地目录路径> <GitHub仓库名>"
    exit 1
fi

local_dir="$1"
repo_name="$2"

# 检查目录是否存在
if [ ! -d "$local_dir" ]; then
    echo "错误：目录 '$local_dir' 不存在"
    exit 1
fi

# 读取配置文件
config_file="$(dirname "$0")/config.ini"
if [ ! -f "$config_file" ]; then
    echo "错误：配置文件 '$config_file' 不存在"
    exit 1
fi

# 加载GitHub配置
source "$config_file"

# 验证配置
if [ -z "$GITHUB_USERNAME" ] || [ -z "$GITHUB_TOKEN" ]; then
    echo "错误：请在配置文件中设置 GITHUB_USERNAME 和 GITHUB_TOKEN"
    exit 1
fi

# 创建GitHub仓库
echo "正在创建GitHub仓库..."
curl -s -H "Authorization: token $GITHUB_TOKEN" \
     https://api.github.com/user/repos \
     -d "{\"name\":\"$repo_name\"}" > /dev/null

if [ $? -ne 0 ]; then
    echo "错误：创建GitHub仓库失败"
    exit 1
fi

# 初始化Git仓库并推送
cd "$local_dir" || exit 1

# 初始化Git仓库
echo "正在初始化本地Git仓库..."
git init

# 添加所有文件
echo "正在添加文件..."
git add .

# 创建首次提交
echo "正在创建首次提交..."
git commit -m "Initial commit"

# 添加远程仓库
echo "正在配置远程仓库..."
git remote add origin "https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$repo_name.git"

# 推送到GitHub
echo "正在推送到GitHub..."
git push -u origin master

echo "完成！仓库已成功创建并推送到GitHub：https://github.com/$GITHUB_USERNAME/$repo_name"
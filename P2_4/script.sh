#!/bin/bash

# 获取今天日期，以重命名图片
today=$(date +%Y%m%d)

# 获取当前脚本路径
current_script_location="$(cd "$(dirname "$0")"; pwd)"
echo "current_script_location = ${current_script_location}"

# 下载今天的图片
wget -O "${current_script_location}/bg/${today}.jpg" "https://dailybing.com/api/v1/today/zh-cn/FHD"

# 获取图片绝对地址
path=$(realpath "${current_script_location}/bg/${today}.jpg")

# 设置桌面壁纸为下载图片
gsettings set org.gnome.desktop.background picture-uri "file://${path}"

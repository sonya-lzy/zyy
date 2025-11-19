#!/bin/bash
echo "=== Git配置脚本 ==="

# 配置用户信息
read -p "请输入您的用户名 (建议使用GitHub用户名): " username
read -p "请输入您的邮箱: " email

if [ -z "$username" ]; then
    username="sonya-Lzy"
fi

if [ -z "$email" ]; then
    email="sonya-Lzy@users.noreply.github.com"
fi

echo "设置: 用户名=$username, 邮箱=$email"

git config --global user.name "$username"
git config --global user.email "$email"

echo -e "\nGit配置完成:"
git config --global --list

echo -e "\n现在可以提交代码了:"
echo "git add ."
echo "git commit -m '您的提交信息'"
echo "git push -u origin main"

#!/bin/bash
echo "=== Git状态检查 ==="

echo "1. 用户配置:"
git config --global user.name
git config --global user.email

echo -e "\n2. 当前分支:"
git branch

echo -e "\n3. 远程仓库:"
git remote -v

echo -e "\n4. 文件状态:"
git status

echo -e "\n5. 如果需要提交:"
echo "   git add ."
echo "   git commit -m '提交信息'"
echo "   git push -u origin main"

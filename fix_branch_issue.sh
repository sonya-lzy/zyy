#!/bin/bash
echo "=== 修复分支匹配问题 ==="

echo "1. 检查当前状态..."
echo "本地分支:"
git branch
echo "远程分支:"
git branch -r

echo -e "\n2. 分析问题..."
current_branch=$(git branch --show-current)
if [ -z "$current_branch" ]; then
    echo "当前不在任何分支上，创建main分支..."
    git checkout -b main
elif [ "$current_branch" = "master" ]; then
    echo "当前分支是master，重命名为main..."
    git branch -M main
else
    echo "当前分支: $current_branch"
fi

echo -e "\n3. 尝试推送..."
git push -u origin main

if [ $? -ne 0 ]; then
    echo -e "\n4. 尝试推送到master分支..."
    git push -u origin master
    
    if [ $? -ne 0 ]; then
        echo -e "\n5. 强制创建远程分支..."
        git push -u origin HEAD:main
    fi
fi

echo -e "\n=== 修复完成 ==="

#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t hugo-universal-theme

# Go To Public folder
# shellcheck disable=SC2164
cd ./public
# 원격 저장소와 로컬 저장소의 상태를 동일하게 만듬
git pull
# Add changes to git.
git add .

# Commit changes.
msg="dir public rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ../


# 저장소 Commit & Push
git add .

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin master
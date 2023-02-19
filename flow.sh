#!/bin/bash

# 체크아웃할 브랜치 이름
BRANCH="release-release"
echo "test"
echo "test"
echo "test"
echo "test"
echo "test"
echo "test"
echo "test"
echo "test"

# 1. 현재 브랜치를 release로 체크아웃
git checkout $BRANCH

# 2. origin release repository pull
git pull origin release-release

# 3. 해당 브랜치를 기반으로 master 브랜치에 머지
git checkout master
git merge --no-ff $BRANCH

# 4. 머지가 완료되면 master브랜치로 체크아웃
git checkout master

# 5. local, origin에 있는 release 브랜치 삭제
git branch -D $BRANCH
git push origin --delete $BRANCH
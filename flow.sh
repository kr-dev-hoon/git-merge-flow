#!/bin/bash

# git 명령어 실행 후 결과를 변수에 저장
output=$(git status)

# 결과를 파싱
if [[ $output == *"Changes not staged for commit"* ]]; then
  echo "변경사항이 스테이지에 추가되지 않았습니다."
elif [[ $output == *"Changes to be committed"* ]]; then
  echo "변경사항이 스테이지에 추가되었습니다."
else
  echo "변경사항이 없습니다."
fi
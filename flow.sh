#!/bin/bash

BRANCH="release-release"

echo test
echo test
echo test
echo test

new_branches=(
  qa
  test
  release-release
)

managed_braches=(
  master
  dev
  test
  qa
  release-release
)

DATE=$(date +%Y.%m.%d)

git checkout $BRANCH

git pull origin $BRANCH

tempfile=$(mktemp)

echo "#Enter Commit Feature Message ( ex. - feature (BE-XXXX) : ... )" >"$tempfile"

vim "$tempfile"
commit_message=$(grep -v '^#' "$tempfile")

echo "$commit_message" >"$tempfile"
rm -f "$tempfile"

master_msg="Merge branch '$BRANCH'

$commit_message"

git checkout master

git merge --no-ff $BRANCH -m "$master_msg"

git checkout dev

dev_msg="feature (배포) $DATE

$commit_message"

git merge --no-ff master -m "$dev_msg"

for new_branch in "${new_branches[@]}"; do
  git branch -D "$new_branch"
  git branch "$new_branch" dev
done

for push_branch in "${managed_braches[@]}"; do
  git push -u -f origin "$push_branch"
done

git push -f origin "$push_branch"

echo "Success"
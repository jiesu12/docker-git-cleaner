#!/bin/bash

REPO='/repo'

if [ "$#" -eq 0 ];then
  echo "Usage: docker run --rm -v <git repo>:/repo jiesu/docker-git-cleaner [options...]"
  echo "See examples for the options: https://rtyley.github.io/bfg-repo-cleaner"
  exit 1
fi

if [ ! -f "${REPO}/config" ] || ! grep -q 'mirror = true' "${REPO}/config";then
  echo "The git repo is not a mirror clone."
  echo "Clone the repo using: git clone --mirror <remote repo>"
  exit 1
fi

cd /home/jie
java -jar bfg-1.13.0.jar "$@" /repo

echo "Next step:"
echo "cd <git repo>"
echo 'git reflog expire --expire=now --all && git gc --prune=now --aggressive'
echo 'git push # will update remote repo because this is a mirror repo'

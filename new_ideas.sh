#!/bin/bash
# Utility script for adding new ideas.
# Usage:
# ./new_ideas.sh          - add new ideas, starting at the highest detected number in _yanis
# ./new_ideas.sh startnum - add new ideas, but start at custom startnum

if [ -z $1 ]; then
  next=$(ls _yanis | sort -n | tail -n 1 | sed -e 's/^0*//' -e 's/.md//')
else
  next=$1
fi

while true; do
  next=$((next + 1))
  fname=$(printf "_yanis/%05d.md" $next)
  if [ -e $fname ]; then
    echo "$fname exists; skipping..."
    continue
  fi
  read -p "Add new YANI file $fname? [Ynq] " -n1 yn
  if [ -z "$yn" ]; then
    yn=" "
  fi
  echo
  if echo "$yn" | grep -q '[Yy ]'; then
    cat <<EOF > $fname
---
layout: singleidea
authors: []
category: [vanilla]
tags: []
---
EOF
    vim $fname '+normal 3G11|' '+startinsert'
  else
    # n and q both end the loop
    break;
  fi
done

#!/bin/bash
# Utility script for adding/editing tags on ideas.
# Usage:
# ./tagadder.sh                        - add tags to untagged ideas in the range specified below
# ./tagadder.sh grep-pattern           - edit tags on ideas where the tags match grep-pattern
# ./tagadder.sh --full grep-pattern    - as above, but where anything in the file matches
# ./tagadder.sh --showall grep-pattern - instead of opening vim, just print all matching files in less

if [ -z "$1" ]; then
  # mode for adding tags to new as-yet-untagged ideas
  # it will only ask to edit files without any tags; beware of adding only some
  # tags to an idea, then closing it and forgetting to come back to it!
  # range of files must be manually specified in the below range.
  files=$(for i in {00001..00100}; do echo _yanis/$i.md; done)
  tagsearch=false
elif [ "$1" == "--showall" ]; then
    files=$(grep -rl "$2" _yanis)
    more $files | less
    exit 0
elif [ "$1" == "--full" ]; then
  # full text search
  files=$(grep -rl "$2" _yanis)
  tagsearch=true
elif [ "$1" == "--empty" ]; then
  # find improperly tagged files with an empty tag
  files=$(grep -rl "^tags.*, *[][,]" _yanis)
  tagsearch=true
else
  # tag search
  files=$(grep -rl "^tags.*$1" _yanis)
  tagsearch=true
fi

echo "`echo "$files" | wc -l` matching files"
for file in $files; do
  grep -q 'tags: \[\]' "$file"
  if [ $? -eq 0 ] || $tagsearch; then
    read -p "Edit next file $file? [Ynq] " -n1 yn
    if [ -z "$yn" ]; then
      yn=" "
    fi
    echo
    if echo "$yn" | grep -q '[Yy ]'; then
      if $tagsearch; then
        vim $file '+normal 5G8|'
      else
        vim $file '+normal 5G8|' '+startinsert'
      fi
    elif echo "$yn" | grep -q '[Qq]'; then
      break;
    fi
    # n is offered as a placebo :-)
  fi
done

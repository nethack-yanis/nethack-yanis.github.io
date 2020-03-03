#!/bin/bash

if [ -z $1 ] || [ $1 != "--histogram" ]; then
  grep --no-filename '^tag' _yanis/*.md | \
    sed -e 's/tags: \[//' -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
    tr ',' '\n' | \
    sort | \
    uniq -c | \
    less
else
  grep --no-filename '^tag' _yanis/*.md | \
    sed -e 's/tags: \[//' -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
    tr ',' '\n' | \
    sort | \
    uniq -c | \
    awk '{ print $1; }' | \
    sort -n | \
    uniq -c | \
    awk '{ printf("%2s %s\n", $2, $1); }'
fi

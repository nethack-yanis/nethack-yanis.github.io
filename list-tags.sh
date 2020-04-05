#!/bin/bash

if [ -z $1 ]; then
  # no args: view mode
  grep --no-filename '^tag' _yanis/*.md | \
    sed -e 's/tags: \[//' -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
    tr ',' '\n' | \
    sort | \
    uniq -c | \
    less
elif [ $1 == "--write-csv" ]; then
  datafile="_data/tagfreq.csv"
  echo "count,tag" > $datafile
  grep --no-filename '^tag' _yanis/*.md | \
    sed -e 's/tags: \[//' -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
    tr ',' '\n' | \
    sort | \
    uniq -c | \
    sed 's/^ *\([0-9]*\) *\(.*\)$/\1,\2/' >> $datafile
elif [ $1 == "--histogram" ]; then
  # fun diagnostic
  grep --no-filename '^tag' _yanis/*.md | \
    sed -e 's/tags: \[//' -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
    tr ',' '\n' | \
    sort | \
    uniq -c | \
    awk '{ print $1; }' | \
    sort -n | \
    uniq -c | \
    awk '{ printf("%3s\t%s\n", $2, $1); }'
else
  echo "Unrecognized argument $1."
fi

#!/bin/sh
# Script that will parse through the YANIs, find all the listed authors, and
# autogenerate all the appropriate author/foo.html pages.
# Will not overwrite existing pages.

for author in $(grep --no-filename '^author' _yanis/*.md | \
                sed -e 's/authors: \[//' -e 's/\]//' -e 's/,//g' | \
                tr ' ' '\n' | sort | uniq); do
  fname="author/$author.html"
  if [ ! -e $fname ]; then
    echo --- >> $fname
    echo layout: filterpage >> $fname
    echo author: $author >> $fname
    echo --- >> $fname
    echo "Wrote new file $fname"
  fi
done

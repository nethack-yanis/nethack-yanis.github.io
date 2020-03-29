#!/bin/sh
# Script that will parse through the YANIs, find all the listed authors, and
# autogenerate all the appropriate author/foo.html pages. Same for tags.
# Will not overwrite existing pages.

NOTHING=0
PRINT=1
WRITE=2

authors=$WRITE
tags=$WRITE

if [ ! -z $1 ]; then
  if [ $1 = "--print-authors" ]; then
    authors=$PRINT
    tags=$NOTHING
  elif [ $1 = "--print-tags" ]; then
    authors=$NOTHING
    tags=$PRINT
  fi
fi

if [ $authors != $NOTHING ]; then
  for author in $(grep --no-filename '^author' _yanis/*.md | \
                  sed -e 's/authors: \[//' -e 's/\]//' -e 's/, /,/g' | \
                  tr ',' '\n' | sort | uniq); do

    if [ $authors = $PRINT ]; then
      echo $author
      continue
    fi
    fname="author/$author.html"
    if [ ! -e $fname ]; then
      echo --- >> $fname
      echo layout: filterpage >> $fname
      echo author: $author >> $fname
      echo --- >> $fname
      echo "Wrote new file $fname"
    fi

  done
fi

# Tags can contain spaces; don't let this break the looping.
if [ $tags != $NOTHING ]; then
  SAVEDIFS=$IFS
  IFS=$(echo -en "\n\b")
  for tag in $(grep --no-filename '^tags' _yanis/*.md | \
              sed -e 's/tags: \[//' -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
              tr ',' '\n' | sort | uniq); do

    if [ $tags = $PRINT ]; then
      echo $tag
      continue
    fi
    fname=$(echo "tag/$tag.html" | sed 's/ /_/g')
    if [ ! -e $fname ]; then
      echo --- >> $fname
      echo layout: filterpage >> $fname
      echo tag: $tag >> $fname
      echo --- >> $fname
      echo "Wrote new file $fname"
    fi
  done
  IFS=$SAVEDIFS
fi

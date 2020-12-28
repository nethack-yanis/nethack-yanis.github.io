#!/bin/sh
# Script that will parse through the YANIs, find all the listed authors, and
# autogenerate all the appropriate author/foo.html pages. Same for tags.
# Will not overwrite existing pages.

NOTHING=0
PRINT=1
WRITE=2

authors=$NOTHING
tags=$NOTHING

function usage {
  echo "Usage: $0 [--print-authors|--print-tags|--write-both]"
}

if [ ! -z $1 ]; then
  if [ $1 = "--print-authors" ]; then
    authors=$PRINT
    tags=$NOTHING
  elif [ $1 = "--print-tags" ]; then
    authors=$NOTHING
    tags=$PRINT
  elif [ $1 = "--write-both" ]; then
    authors=$WRITE
    tags=$WRITE
  else
    usage
    exit 1
  fi
else
  usage
  exit 1
fi

if [ $authors != $NOTHING ]; then
  SAVEDIFS=$IFS
  IFS=$(echo -en "\n\b")
  for author in $(grep --no-filename '^author' _yanis/*.md | \
                  sed -e 's/authors: \[//' -e 's/\]//' -e 's/, /,/g' -e 's/"//g' | \
                  tr ',' '\n' | sort | uniq); do

    fname=$(echo "author/$author.html" | sed 's/ /_/g')
    if [ $authors = $PRINT ]; then
      if [ -e $fname ]; then
        echo $author
      else
        echo NEW: $author
      fi
      continue
    fi
    if [ ! -e $fname ]; then
      echo --- >> $fname
      echo layout: filterpage >> $fname
      echo author: $author >> $fname
      echo --- >> $fname
      echo "Wrote new file $fname"
    fi
  done
  IFS=$SAVEDIFS
fi

# Tags can contain spaces; don't let this break the looping.
if [ $tags != $NOTHING ]; then
  SAVEDIFS=$IFS
  IFS=$(echo -en "\n\b")
  for tag in $(grep --no-filename '^tags' _yanis/*.md | \
               sed -e 's/tags: \[//' -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
               tr ',' '\n' | sort | uniq); do

    fname=$(echo "tag/$tag.html" | sed 's/ /_/g')
    if [ $tags = $PRINT ]; then
      if [ -e $fname ]; then
        echo $tag
      else
        echo NEW: $tag
      fi
      continue
    fi
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

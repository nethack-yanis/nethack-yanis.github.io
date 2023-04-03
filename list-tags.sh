#!/bin/bash

DOWRITE=false
HISTOGRAM=false
CATEGORIES=false
TAG_IDENTIFIER='^tags' # regex passed to grep to identify tag lines
TAG_PREFIX='s/tags: \[//' # first regex passed to sed to strip out of the line

while [[ $# -gt 0 ]]; do
    case "$1" in
        --write-csv)
            DOWRITE=true
            shift;;
        --histogram)
            HISTOGRAM=true
            shift;;
        --categories)
            CATEGORIES=true
            TAG_IDENTIFIER='^category'
            TAG_PREFIX='s/category: \[//'
            shift;;
        *)
            echo "Unrecognized argument $1"
            exit 1;;
    esac
done

if [[ "$HISTOGRAM" == true ]]; then
    # fun diagnostic
    grep --no-filename $TAG_IDENTIFIER _yanis/*.md | \
      sed -e "$TAG_PREFIX" -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
      tr ',' '\n' | \
      sort | \
      uniq -c | \
      awk '{ print $1; }' | \
      sort -n | \
      uniq -c | \
      awk '{ printf("%3s\t%s\n", $2, $1); }'
elif [[ "$DOWRITE" == true ]]; then
    if [[ "$CATEGORIES" == true ]]; then
        echo "You cannot write the csv with categories"
        exit 1
    fi
    DATAFILE="_data/tagfreq.csv"
    echo "count,tag" > $DATAFILE
    grep --no-filename $TAG_IDENTIFIER _yanis/*.md | \
      sed -e "$TAG_PREFIX" -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
      tr ',' '\n' | \
      sort | \
      uniq -c | \
      sed 's/^ *\([0-9]*\) *\(.*\)$/\1,\2/' >> $DATAFILE
else
    # no option specified, default behavior is to view tags in less
    grep --no-filename $TAG_IDENTIFIER _yanis/*.md | \
      sed -e "$TAG_PREFIX" -e 's/\]//' -e 's/, /,/g' -e '/^$/ d' | \
      tr ',' '\n' | \
      sort | \
      uniq -c | \
      less
fi

#!/bin/bash
# Utility script for adding/editing tags on ideas.

function usage() {
    echo Usage:
    echo $0 [grep-pattern]           - edit tags on ideas where the tags match grep-pattern
    echo $0 --full [grep-pattern]    - as above, but where anything in the file matches
    echo $0 --showall [grep-pattern] - instead of opening vim, just print all matching files in less
    echo $0 --empty                  - locate files with an erroneous empty-string tag
}

if [ -z "$1" ]; then
    usage
    exit 1
elif [ "$1" == "--showall" ]; then
    files=$(grep -rl "$2" _yanis)
    if [[ $files == "" ]]; then
        echo 'There are no matching files to show.'
        exit 0
    fi
    more $files | less
    exit 0
elif [ "$1" == "--full" ]; then
    # full text search
    files=$(grep -rl "$2" _yanis)
elif [ "$1" == "--empty" ]; then
    # find improperly tagged files with an empty tag
    files=$(grep -rl "^tags.*, *[][,]" _yanis)
else
    # tag search
    files=$(grep -rl "^tags.*$1" _yanis)
fi

if [[ $files == "" ]]; then
    echo 'There are no matching files to edit.'
    exit 0
fi

echo "`echo "$files" | wc -l` matching files"
for file in $files; do
    read -p "Edit next file $file? [Ynq] " -n1 yn
    if [ -z "$yn" ]; then
        yn=" "
    fi
    echo
    if echo "$yn" | grep -q '[Yy ]'; then
        vim $file '+normal 5G8|'
    elif echo "$yn" | grep -q '[Qq]'; then
        break;
    fi
    # n is offered as a placebo :-)
done

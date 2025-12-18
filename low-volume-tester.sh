#!/bin/bash
# Detect tags in low_volume_exclude that don't appear just once anymore.
# ASSUMPTION: This is run from the root of the repo like the other scripts.
# ASSUMPTION: The site code excludes low_volume_exclude tags that appear exactly
#             once. If it starts excluding tags at some other low frequency like
#             2, this script won't behave properly anymore.

TEMPFILE1="/tmp/lv_tagfreq.csv"
TEMPFILE2="/tmp/sorted_tagfreq.csv"

sed -e '/^#/ d' -e 's/^- /1,/' _data/low_volume_exclude.yml | sort > $TEMPFILE1
sort _data/tagfreq.csv > $TEMPFILE2

# now both TEMPFILEs should be in the same format and sorted
# show only lines unique to low_volume_exclude.yml, which indicates that the
# assumed "1," from being in that file is no longer in tagfreq
echo 'The following lines are currently in low_volume_exclude.yml but appear at least twice across all ideas:'
comm -23 $TEMPFILE1 $TEMPFILE2 | sed 's/^1,//'

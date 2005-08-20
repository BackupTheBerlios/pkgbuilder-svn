#!/bin/sh
# Download slackware current base packages

SLACKWARE_MIRROR="http://www.slackware.at/data/slackware-current"

FETCH_TRIES="5"
FETCH_DIR="/home/tomby/tmp/current"
FETCH_OPTIONS="--tries=$FETCH_TRIES --directory-prefix=$FETCH_DIR"

if [ ! -d $FETCH_DIR ] ; then
    mkdir -p $FETCH_DIR
fi

for i in `grep -v ^# BASEPKGS | grep -v ^$ | cut -d'#' -f 1` ; do
    url="$SLACKWARE_MIRROR/slackware/$i.tgz"
    file="$FETCH_DIR/`basename $url`"
    if [ ! -f $file ] ; then
        wget -c $FETCH_OPTIONS $url
    fi
done
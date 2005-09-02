#!/bin/sh
#
# Copyright 2003-2005 Antonio G. Muñoz Conejo <tomby (AT) users.berlios.de>
# Distributed under the terms of the GNU General Public License v2
#
# Download slackware current base packages
#

source build.rc

source scripts/functions.sh

FETCH_OPTIONS="$CURRENT_FETCH_OPTIONS"

if [ ! -d $CURRENT_DIR ] ; then
    mkdir -p $CURRENT_DIR
fi

for i in `grep -v ^# BASEPKGS | grep -v ^$ | cut -d'#' -f 1` ; do
    url="$SLACKWARE_MIRROR/slackware/$i.tgz"
    file="$CURRENT_DIR/`basename $url`"
    if [ ! -f $file ] ; then
        fetch $url || echo "$url download ERROR"
    else
        echo "$file already fetched"
    fi
done
#!/bin/sh
#
# Copyright 2003-2005 Antonio G. Muñoz Conejo <tomby (AT) users.berlios.de>
# Distributed under the terms of the GNU General Public License v2
#

source build.rc

source scripts/functions.sh

PKG_LIST="`find ./ -type f -name '*.build' -exec dirname {} \; | grep -v example | grep -v common | grep -v CVS | grep -v test | sort | uniq`"

rm -f PACKAGES

for i in $PKG_LIST ; do
    pkg_meta="`echo "$i" | cut -d/ -f2`"
    pkg_name="`echo "$i" | cut -d/ -f3`"

    echo $pkg_meta/$pkg_name-`latest_version $pkg_meta $pkg_name` >> PACKAGES
done


#!/bin/sh

source build.rc

source scripts/functions.sh

PKG_LIST="`find ./ -type f -name '*.build' -exec dirname {} \; | grep -v example | grep -v common | grep -v .svn | grep -v test | sort | uniq`"

for i in $PKG_LIST ; do
    meta="`echo "$i" | cut -d/ -f2`"
    pkg="`echo "$i" | cut -d/ -f3`"
    
    if [ "$meta" != "$metaold" ] ; then
        test "$metaold" != "" && echo "</ul>"
        echo "<p><b>$meta:</b></p>"
        echo "<ul>"
    fi

    echo "    <li>$pkg-`latest_version $meta $pkg`</li>"
    
    metaold="$meta"
done

echo "</ul>"

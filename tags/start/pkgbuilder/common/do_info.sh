# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_info.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

do_info() {
    echo
    echo $PKG_NAME-$PKG_VERSION
    echo
    
    if [ -f $PKG_HOME/INFO ] ; then
        cat $PKG_HOME/INFO      
    else
        echo package information not avaible
    fi
}

# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_fetch_cvs.sh,v 1.1 2003/10/21 19:22:57 tomby Exp $

do_fetch() {
    cd $TMP
    
    cvs -d $PKG_CVSROOT login &&    
    cvs -d $PKG_CVSROOT co -d $PKG_NAME-$PKG_VERSION $PKG_MODULE
    
    return $?
}

# Copyright 2003 Antonio G. Mu�oz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/common/Attic/do_fetch.sh,v 1.1 2003/10/21 18:19:56 tomby Exp $

do_fetch() {
    fetch $PKG_URL
    
    return $?
}

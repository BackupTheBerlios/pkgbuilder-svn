# Copyright 2003 Antonio G. Mu�oz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/ruby-gnome2/0.7.0/Attic/build.sh,v 1.1 2003/10/21 19:31:03 tomby Exp $
#
# example pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch

include do_build
include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

do_configure() {
    cd $PKG_SRC
    
    ruby extconf.rb
    
    return $?
}

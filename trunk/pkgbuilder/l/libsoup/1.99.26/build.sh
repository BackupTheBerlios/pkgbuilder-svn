# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/libsoup/1.99.26/Attic/build.sh,v 1.1 2003/10/28 22:23:16 tomby Exp $
#
# example pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_bzip2
include do_patch
include do_configure
include do_build
include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/l/libzvf/2.0.1/Attic/build.sh,v 1.1 2003/10/30 22:19:01 tomby Exp $
#
# libzvt pkgbuilder script
#

include do_info
include do_fetch
include do_uncompress_gzip
include do_patch
include do_configure
include do_build
include do_install
include do_postinstall
include do_buildpkg
include do_installpkg
include do_upgradepkg
include do_clean

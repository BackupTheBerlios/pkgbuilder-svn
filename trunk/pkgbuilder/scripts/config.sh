# Copyright 2003 Antonio G. Muñoz, tomby (AT) tomby.homemelinux.org
# Distributed under the terms of the GNU General Public License v2
# $Header: /cvsroot/pkgbuilder/pkgbuilder/scripts/Attic/config.sh,v 1.2 2003/10/31 19:07:49 tomby Exp $

BUILDPKG_HOME="/home/tomby/proyectos/pkgbuilder"

VERSION="20031031"

FETCH_TRIES="5"
FETCH_RATE="25K"
FETCH_DIR="/home/tomby/tmp/distfiles"
FETCH_OPTIONS="--tries=$FETCH_TRIES --limit-rate=$FETCH_RATE --directory-prefix=$FETCH_DIR"

TMP="/home/tomby/tmp"

CFLAGS="-O2 -march=i486 -mcpu=i686"
CXXFLAGS="$CFLAGS"

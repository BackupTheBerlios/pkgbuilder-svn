#!/bin/sh
#
# $Header: /cvsroot/pkgbuilder/pkgbuilder/build.sh,v 1.1 2003/10/21 18:19:45 tomby Exp $
#
# Copyright (C) 2003 Antonio G. Muñoz Conejo <tomby (AT) tomby.homelinux.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# Script general para la compilación y creación de paquetes
# Tal vez, futuro embrión de un arbol de ports para Slackware
#

#scripts globales y de configuración
source scripts/config.sh
source scripts/functions.sh

#imprimo la versión
version

#obtengo primero el paquete a utilizar
if [ "$1" = "" ] ; then
    usage
    exit 1
fi

PKG_HOME=`pwd`/"$1"

source $PKG_HOME/config.sh
source $PKG_HOME/build.sh

#ahora obtengo la acción a ejecutar
ACTION="auto"

if [ "$2" != "" ] ; then
    ACTION=$2
fi

#inicialización de variables
if [ "$TMP" = "" ]; then
  TMP="/tmp"
fi

if [ ! -d $TMP ]; then
  mkdir -p $TMP # directorio donde compilar los fuentes
fi

if [ ! -d $PKG_DEST ]; then
  mkdir -p $PKG_DEST # directorio donde instalar el paquete
fi

#ahora ejecuto la acción correspondiente
case "$ACTION" in
    'info')
        do_info
    ;;
    'fetch')
        do_fetch
    ;;
    'uncompress')
        do_uncompress
    ;;
    'patch')
        do_patch
    ;;
    'configure')
        do_configure
    ;;
    'build')
        do_build
    ;;
    'install')
        do_install
    ;;
    'postinstall')
        do_postinstall
    ;;
    'buildpkg')
        do_buildpkg
    ;;
    'installpkg')
        do_installpkg
    ;;
    'upgradepkg')
        do_upgradepkg
    ;;
    'clean')
        do_clean
    ;;
    'auto')
        do_fetch && 
        do_uncompress &&
        do_patch && 
        do_configure &&
        do_build &&
        do_install &&  
        do_postinstall && 
        do_buildpkg
    ;;
    'help')
        usage
    ;;
    *)
        echo "unrecognized action"
esac



#!/bin/csh
# GNOME additions:
if ( ! $?GNOMEDIR ) then
    setenv GNOMEDIR /opt/gnome
endif

if ( $?GNOME2_PATH ) then
    setenv GNOME2_PATH /opt/gnome
else
    setenv GNOME2_PATH /opt/gnome
endif

if ( $?PATH ) then
    setenv PATH $PATH:$GNOMEDIR/bin
else
    setenv PATH $GNOMEDIR/bin
endif

if ( $?MANPATH ) then
    setenv MANPATH $MANPATH:$GNOMEDIR/man
else
    setenv MANPATH $GNOMEDIR/man
endif

if ( $?PKG_CONFIG_PATH ) then
    setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH:$GNOMEDIR/lib/pkgconfig
else
    setenv PKG_CONFIG_PATH $GNOMEDIR/lib/pkgconfig
endif

if ( $?LIBGLADE_MODULE_PATH ) then
    setenv LIBGLADE_MODULE_PATH $LIBGLADE_MODULE_PATH:$GNOMEDIR/lib/libglade/2.0
else
    setenv LIBGLADE_MODULE_PATH $GNOMEDIR/lib/libglade/2.0
endif

if ( $?ACLOCAL_FLAGS ) then
    setenv ACLOCAL_FLAGS "$ACLOCAL_FLAGS -I $GNOME2_PATH/share/aclocal"
else
    setenv ACLOCAL_FLAGS "-I $GNOME2_PATH/share/aclocal"
endif

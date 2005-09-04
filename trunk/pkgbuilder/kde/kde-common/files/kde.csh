if ( ! $?KDEDIR ) then
    setenv KDEDIR /opt/kde
endif

if ( ! $?KDEDIRS ) then
    setenv KDEDIRS $KDEDIR:/usr
endif

if ( $?PATH ) then
    setenv PATH $PATH:$KDEDIR/bin
else
    setenv PATH $KDEDIR/bin
endif

if ( $?MANPATH ) then
    setenv MANPATH $MANPATH:$KDEDIR/man
else
    setenv MANPATH $KDEDIR/man
endif

if ( $?PKG_CONFIG_PATH ) then
    setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH:$KDEDIR/lib/pkgconfig
else
    setenv PKG_CONFIG_PATH $KDEDIR/lib/pkgconfig
endif

if ( $?XDG_DATA_DIRS ) then
    setenv XDG_DATA_DIRS $XDG_DATA_DIRS:$KDEDIR/share
else
    setenv XDG_DATA_DIRS $KDEDIR/share
endif

if ( $?XDG_CONFIG_DIRS ) then
    setenv XDG_CONFIG_DIRS $XDG_CONFIG_DIRS:$KDEDIR/etc/xdg
else
    setenv XDG_CONFIG_DIRS $KDEDIR/etc/xdg
endif
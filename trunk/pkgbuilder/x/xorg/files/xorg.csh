if ( ! $?XDG_DATA_HOME ) then
    setenv XDG_DATA_HOME $HOME/.local/share
endif

if ( ! $?XDG_CONFIG_HOME ) then
    setenv XDG_CONFIG_HOME $HOME/.config
endif

if ( ! $?XDG_CACHE_HOME ) then
    setenv XDG_CACHE_HOME $HOME/.cache
endif

if ( $?PKG_CONFIG_PATH ) then
    setenv PKG_CONFIG_PATH $PKG_CONFIG_PATH:/usr/X11R6/lib/pkgconfig
else
    setenv PKG_CONFIG_PATH /usr/X11R6/lib/pkgconfig
endif

if ( $?XDG_DATA_DIRS ) then
    setenv XDG_DATA_DIRS $XDG_DATA_DIRS:/usr/share
else
    setenv XDG_DATA_DIRS /usr/share
endif

if ( $?XDG_CONFIG_DIRS ) then
    setenv XDG_CONFIG_DIRS $XDG_CONFIG_DIRS:/etc/xdg
else
    setenv XDG_CONFIG_DIRS /etc/xdg
endif
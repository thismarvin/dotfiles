#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps.

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Test for an existing bus daemon, just to be safe.
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
	# If not found, launch a new one.
	eval `dbus-launch --sh-syntax`
	echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
fi

# Make sure XDG_DATA_DIRS is setup correctly.
source /etc/profile.d/flatpak.sh

pipewire &
picom &
emacs --daemon &
kitty &
(sleep 0.75; emacsclient -c) &
(sleep 1; kitty --class=dev) &
kitty --class=btm -e btm &
(sleep 0.25; kitty --class=btm -e btm -ab) &
exec awesome

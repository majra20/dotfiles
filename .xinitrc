#!/bin/sh

# Merge in resources and keymaps
xrdb -merge $HOME/.Xresources
xmodmap $HOME/.Xmodmap

# Dunno what this does, but it should be here
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Fading
compton -o 0.3 --backend glx --vsync opengl -b -i 1.0 --config ~/.config/compton.conf

# Fonts
xset +fp $HOME/.fonts
xset +fp /usr/share/fonts/Microsoft

# Fix cursor
xsetroot -cursor_name left_ptr &

# Set wallpaper
wallpaper

# Start urxvt daemon
urxvtd -q -o -f

# FIX STARTUP FLICKER
$HOME/.config/lemonbar/launcher.sh & disown
applets &

# Lock screen
lock &

# Start bspwm
sxhkd &
exec bspwm

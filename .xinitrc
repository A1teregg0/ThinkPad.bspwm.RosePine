#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# while true; do
   # xsetroot -name " $( date +"%F %R" ) "
   # sleep 5s
# done &

setxkbmap -layout us,ru -option grp:alt_shift_toggle &
feh --bg-fill /home/anon/IMG_20241207_232609_577.jpg &
# pgrep -x dusnt > /dev/null || dunst &
pgrep -x picom > /dev/null || picom &
# pgrep -x stalonetray > /dev/null || stalonetray &
polybar &
exec bspwm
# exec gnome-session
# exec dwm
# exec herbstluftwm
# exec fvwm
# exec awesome
# exec /home/anon/Documents/xwm/xwm
# alacritty &
# exec /home/anon/Documents/Projects/sourwm/sourwm
# alacritty &
# firefox &
# exec /home/anon/Documents/tinywm/tinywm

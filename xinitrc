#!/bin/sh

setxkbmap de

cd ~
#feh --bg-scale ~/pictures/gimp/end_prodcuts/gentoo_dharma_colorful.jpg &
nitrogen --restore
xrdb -merge .Xdefaults
xrdb -merge .Xresources
xfce4-power-manager &
exec volumeicon &
eval $(gnome-keyring-daemon --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
exec ck-launch-session dbus-launch --exit-with-session nm-applet &
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xfce4-power-manager
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3

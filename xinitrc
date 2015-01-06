#!/bin/sh

cd ~
nitrogen --restore
xrdb -merge .Xdefaults
xrdb -merge .Xresources
eval $(gnome-keyring-daemon --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session cbatticon &
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xfce4-power-manager &
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session pulseaudio &
#exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session startlxqt

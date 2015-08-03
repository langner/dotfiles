#!/bin/sh

# Disable audible bell
xset -b

# Standby/suspend after 10 minutes
xset dpms 600

# Background color
xsetroot -solid "#333333"

# Start urxvtd
urxvtd -q -f -o

[ -f ~/.xprofile ] && source ~/.xprofile ]
[ -f ~/.xsession_private ] && source ~/.xsession_private ]

exec i3

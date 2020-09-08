#
# .xinitrc
# 

# Merge Xresources files to get working colors in URxvt
[ -f ~/.config/Xresources ] && xrdb -merge ~/.config/Xresources
[ -f ~/.cache/wal/colors.Xresources ] && xrdb -merge ~/.cache/wal/colors.Xresources

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"
grep -q "MJ12" /etc/hostname && ~/.local/share/xhost

# Applications to run in the background + default mouse pointer 
xsetroot -cursor_name left_ptr
xset b off
xset dpms 300 300 300
xset r rate 300 25
~/.config/fehbg

# Applications to run in the background
grep -q "MJ12" /etc/hostname && pgrep mpd &>/dev/null || mpd &
devilspie -a &
picom --vsync-use-glfinish &
urxvtd -q -o -f
sxhkd -t 1 &
redshift &
unclutter -idle 6 &
fcitx &
#nm-applet &
#blueman-applet &
pulseeffects --gapplication-service &

# Start WM/DE of choice
exec bspwm

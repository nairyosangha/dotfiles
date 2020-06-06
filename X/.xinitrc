#
# .xinitrc
# 

# Merge Xresources files to get working colors in urxvt
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
#[[ -f ~/.cache/wal/colors.Xresources ]] && xrdb -merge -I$HOME ~/.cache/wal/colors.Xresources

[ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || export QT_QPA_PLATFORMTHEME="qt5ct"

# Applications to run in the background + default mouse pointer 
xsetroot -cursor_name left_ptr
xset b off
xset dpms 300 300 300
xset r rate 300 25
~/.config/fehbg

# Applications to run in the background
devilspie -a &
picom &
urxvtd -q -o -f
sxhkd -t 1 &
redshift &
unclutter -idle 6 &
fcitx &
#nm-applet &
#blueman-applet &
pulseeffects --gapplication-service &

# Start WM/DE of choice
bar &
exec bspwm

feh --bg-scale ~/Pictures/challenger.png &
picom --expiremental-backend --config ~/.config/picom/picom.conf &
dwmstatus 2>&1 &
exec dwm

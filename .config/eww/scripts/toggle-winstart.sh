#!/usr/bin/bash
state=$(eww get rev_winstart)

if [[ "$state" == "true" || "$1" == "--close" ]]; then
    eww update anim_open_winstart=false
    eww update rev_winstart=false
    sleep 0.1
    eww close winstart
    eww update winsearch=''
    eww update winstart_allapps=false
    eww update allapps=''
else
    cd ~/.config/eww
    eww update anim_open_winstart=true
    eww open winstart
    eww update rev_winstart=true
    eww update allapps_get="$(scripts/allapps --mode 2)" &
fi
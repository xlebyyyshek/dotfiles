if [[ "$(tty)" = "/dev/tty1" ]]; then 
#    exec dwl
#    exec Hyprland
#    exec dwl -s "somebar"
#    exec river
    exec dwl >  ~/.cache/dwltags
fi


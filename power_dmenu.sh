#!/bin/sh

    
case "$(echo -e "Suspend\nReboot\nShutdown" | dmenu \
    -nb "${COLOR_BACKGROUND:-#151515}" \
    -nf "${COLOR_DEFAULT:-#aaaaaa}" \
    -sf "${COLOR_HIGHLIGHT:-#589cc5}" \
    -sb "#1a1a1a" \
    -i -p \
    "Power:" -c -l 5)" in
        Suspend) exec systemctl suspend;;
        Reboot) exec systemctl reboot;;
        Shutdown) exec systemctl poweroff;;
esac

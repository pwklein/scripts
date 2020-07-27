#!/bin/sh

    
case "$(echo -e "Suspend\nReboot\nShutdown" | dmenu \
    -i -p \
    "Power:" -c -l 5)" in
        Suspend) exec systemctl suspend;;
        Reboot) exec systemctl reboot;;
        Shutdown) exec systemctl poweroff;;
esac

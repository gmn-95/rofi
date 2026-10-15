#!/bin/bash

chosen=$(echo -e "🔊 Áudio\n📶 Wi-Fi\n🔵 Bluetooth\n🔒 Bloquear\n🔁 Reiniciar\n⏻ Desligar\n🚪 Logout" | rofi -dmenu -i -p "Sistema" -theme-str 'window {width: 20%; height: 20%;}' )

case "$chosen" in
    "🔊 Áudio") pavucontrol ;;
    "📶 Wi-Fi") ~/.config/rofi/scripts/rofi-wifi.sh ;;
    "🔵 Bluetooth") ~/.config/rofi-bluetooth/rofi-bluetooth ;;
    "🔒 Bloquear") i3lock ;;
    "🔁 Reiniciar") systemctl reboot ;;
    "⏻ Desligar") systemctl poweroff ;;
    "🚪 Logout") i3-msg exit ;;
esac
git clone https://github.com/izzqz/nm-dmenu ~/.config/nm-dmenu
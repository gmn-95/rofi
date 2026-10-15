#!/bin/bash

# Lista redes disponíveis com sinal e segurança
networks=$(nmcli -t -f SSID,SIGNAL,SECURITY dev wifi | grep -v '^--' | awk -F: '!seen[$1]++ {printf "%s (%s%%) [%s]\n", $1, $2, $3}' )

# Se não houver redes, sai
[ -z "$networks" ] && notify-send "Wi-Fi" "Nenhuma rede encontrada" && exit

# Mostra no Rofi
chosen=$(echo "$networks" | rofi -dmenu -p "Wi-Fi" -theme-str 'window {width: 30%;}')

# Extrai SSID
ssid=$(echo "$chosen" | awk -F' (' '{print $1}')

# Se algo foi escolhido
if [ -n "$ssid" ]; then
    # Tenta conectar sem senha primeiro
    nmcli dev wifi connect "$ssid" && exit

    # Se falhar, pede senha via Rofi
    password=$(rofi -dmenu -password -p "Senha para $ssid" -theme-str 'window {width: 30%;}')

    # Tenta conectar com senha
    nmcli dev wifi connect "$ssid" password "$password"
fi

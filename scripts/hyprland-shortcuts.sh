#!/usr/bin/env bash
set -euo pipefail

# Selecionar um item apenas fecha o menu; não executa o trabalho
[ $# -gt 0 ] && exit 0

hyprctl -j binds | jq -r '
	def modificadores:
  		{
			"0":  "",
			"1":  "SHIFT + ",
			"4":  "CTRL + ",
			"8":  "ALT + ",
			"64": "SUPER + ",
			"65": "SUPER + SHIFT + ",
			"68": "SUPER + CTRL + ",
			"72": "SUPER + ALT + "
  		}[.modmas | tostring]
		// ("SUPER + ");
	.[]
	| select(.description? != null and .description != "")
	| "? \(modificadores)\(.key)\t\(.description)"
       '| sort -f	


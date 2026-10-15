# Rofi + Hyprland

Minha configuração do [Rofi](https://github.com/davatorium/rofi), usada como
launcher de aplicações e consulta de atalhos no Hyprland. O launcher ativo é o
`type-4`, personalizado com a paleta **Catppuccin Mocha** para acompanhar a
Waybar.

## Recursos

- Launcher de aplicações (`drun`) com ícones;
- busca unificada de aplicações e atalhos do Hyprland;
- atalhos exibidos ao pesquisar por `?`, sem executar a combinação selecionada;
- tema escuro com fonte JetBrainsMono Nerd Font;
- coleções adicionais de launchers, applets e menus de energia.

## Dependências

O launcher principal requer:

- [Rofi](https://github.com/davatorium/rofi) 1.7 ou superior;
- `hyprctl`, disponível em uma sessão do Hyprland;
- [`jq`](https://jqlang.github.io/jq/), para ler os atalhos;
- uma Nerd Font, de preferência **JetBrainsMono Nerd Font**, para renderizar os
  ícones corretamente.

No Arch Linux:

```sh
sudo pacman -S rofi jq ttf-jetbrains-mono-nerd
```

## Instalação

O tema usa caminhos em `~/.config/rofi`; portanto, a cópia deve terminar nesse
diretório. Faça um backup se já tiver uma configuração local:

```sh
mv ~/.config/rofi ~/.config/rofi.backup
git clone https://github.com/gmn-95/rofi.git ~/.config/rofi
```

Se preferir manter sua configuração atual, clone o repositório em outro local
e copie apenas os arquivos que deseja usar. O launcher principal depende de
`launchers/type-4/`, `scripts/hyprland-shortcuts.sh` e dos respectivos arquivos
de tema.

## Uso

Execute o launcher ativo com:

```sh
~/.config/rofi/launchers/type-4/launcher.sh
```

Ele abre o modo combinado do Rofi:

- digite o nome de um programa para encontrá-lo e executá-lo;
- digite `?` para listar os atalhos que possuem descrição no Hyprland;
- selecione um atalho apenas para fechar o menu — nenhum comando é disparado.

Para acioná-lo por um atalho no Hyprland, adicione ao seu `hyprland.conf`:

```ini
bind = SUPER, R, exec, ~/.config/rofi/launchers/type-4/launcher.sh
```

## Estrutura

```text
.
├── config.rasi                         # Configuração global do Rofi
├── launchers/type-4/
│   ├── launcher.sh                     # Launcher ativo
│   ├── style-4.rasi                    # Layout do tema
│   └── waybar-colors.rasi              # Paleta Catppuccin Mocha
├── scripts/
│   └── hyprland-shortcuts.sh           # Fonte do modo de atalhos
├── applets/                            # Applets auxiliares
├── powermenu/                          # Menus de energia alternativos
└── colors/                             # Paletas para os demais temas
```

## Personalização

- **Cores:** edite `launchers/type-4/waybar-colors.rasi`.
- **Layout:** edite `launchers/type-4/style-4.rasi`.
- **Atalhos exibidos:** o script lê `hyprctl -j binds` e mostra somente entradas
  com `description`. Descreva os binds no `hyprland.conf`, por exemplo:

  ```ini
  bindd = SUPER, R, Abrir o launcher, exec, ~/.config/rofi/launchers/type-4/launcher.sh
  ```

## Validação

Após modificar o launcher ou o tema, valide sem abrir a interface gráfica:

```sh
bash -n ~/.config/rofi/launchers/type-4/launcher.sh
rofi -no-config -theme ~/.config/rofi/launchers/type-4/style-4.rasi -dump-theme
```

Para conferir os atalhos, execute dentro de uma sessão do Hyprland:

```sh
~/.config/rofi/scripts/hyprland-shortcuts.sh
```

## Créditos

A estrutura de launchers, applets e menus de energia parte do projeto
[adi1090x/rofi](https://github.com/adi1090x/rofi). As personalizações deste
repositório concentram-se no launcher `type-4`, na integração com Hyprland e na
paleta visual alinhada à Waybar.

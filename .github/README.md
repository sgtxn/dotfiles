# sgtxn's dotfiles

## Prerequisites

```bash
yay -S  yadm \
        alacritty \
        btop \
        dunst \
        firefox \
        k9s kubectx azure-kubelogin azure-cli \
        mpv \
        rofi-wayland \
        sway swaybg swaylock swayidle \
        waybar \
        zsh \
        direnv fzf grim slurp swappy jq reflector tldr wget inetutils \
        neovim visual-studio-code-bin go dbeaver docker docker-compose docker-buildx \
        capitaine-cursors catppuccin-gtk-theme-frappe nwg-look papirus-icon-theme \
        noto-fonts-cjk noto-fonts-extra otf-font-awesome \
        ttf-font-awesome ttf-droid ttf-firacode-nerd ttf-mononoki-nerd \
        discord telegram-desktop-bin slack-desktop \
        nemo nemo-fileroller nemo-preview nemo-share \
        networkmanager network-manager-applet networkmanager-openconnect \
        oxygen oxygen-icons qt5ct qt6ct qbittorrent \
        spotify
```

## Setup

```bash
cd "$HOME"
yadm clone https://github.dev/sgtxn/dotfiles.git
yadm submodule update --recursive --init

# permissions
chmod 700 ~/.cache ~/.config

# sparse checkout
yadm gitconfig core.sparseCheckout true
yadm sparse-checkout set --non-cone '/*' '!README.md' '!UNLICENSE.md'
```
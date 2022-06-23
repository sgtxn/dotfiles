## User creation
#useradd -m sgtxn
#passwd sgtxn
#gpasswd -a sgtxn wheel
#visudo
#su sgtxn

## Network
#sudo systemctl enable --now NetworkManager.service

## Multilib repo
#sudo vim /etc/pacman.conf
#sudo pacman -Syyy

## Keys
#sudo pacman-key --init
#sudo pacman-key --populate
#sudo pacman -S inetutils

## Git
#sudo pacman -S git
#git config --global url.ssh://git@github.com/.insteadOf https://github.com/
#git config --global credential.helper store
#git config --global user.name "sgtxn"
#read -p "Github email: " email
#git config --global user.email "$email"

## AUR
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si

## Dotfiles
#mkdir Downloads
#cd Downloads
#git clone https://github.com/sgtxn/dotfiles
#cd ~

## ZSH
#yay -S zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting starship direnv fzf
#cp ~/Downloads/dotfiles/.config/aliasrc ~/.config/
#cp -R ~/Downloads/dotfiles/.config/zsh ~/.config/
#cp -R ~/Downloads/dotfiles/.config/starship ~/.config/
#cp ~/Downloads/dotfiles/.zprofile ~/.config/
#touch ~/.profile
#chsh
#rm ~/.bash*

## GUI
#yay -S xorg nvidia nvidia-settings bspwm sxhkd polybar lightdm lightdm-webkit2-greeter dunst arandr
#cp -r ~/Downloads/dotfiles/.config/bspwm ~/.config/bspwm
#cp -r ~/Downloads/dotfiles/.config/sxhkd ~/.config/sxhkd
#cp -r ~/Downloads/dotfiles/.config/polybar ~/.config/polybar
#cp -r ~/Downloads/dotfiles/.config/dunst ~/.config/dunst
#cp -r ~/Downloads/dotfiles/.Xresources ~/
#sudo vim /etc/lightdm/lightdm.conf
#sudo systemctl enable lightdm
#sudo sh -c 'echo "Section \"InputClass\"
#        Identifier \"system-keyboard\"
#        MatchIsKeyboard \"on\"\
#        Option \"XkbLayout\" \"us,ru\"
#        Option \"XkbModel\" \"pc104\"
#        Option \"XkbOptions\" \"grp:caps_toggle,terminate:ctrl_alt_bksp\"
#EndSection" > /etc/X11/xorg.conf.d/00-keyboard.conf'
#sudo sh -c 'echo "Section \"InputClass\"
#	Identifier \"My Mouse\"
#	Driver \"libinput\"
#	MatchIsPointer \"yes\"
#	Option \"AccelProfile\" \"flat\"
#	Option \"AccelSpeed\" \"0\"
#EndSection" > /etc/X11/xorg.conf.d/50-mouse-acceleration.conf'

## Basic aliased/hotkeyed software
#yay -S exa alacritty rofi tldr xkb-switch nitrogen reflector
#cp -r ~/Downloads/dotfiles/.config/rofi ~/.config/
#cp -r ~/Downloads/dotfiles/.config/alacritty ~/.config/

## Fonts/themes
#yay -S ttf-mononoki nerd-fonts-mononoki noto-fonts noto-fonts-cjk otf-font-awesome ttf-font-awesome noto-fonts-emoji noto-fonts-extra
#yay -S capitaine-cursors qt5ct qt6ct lxappearance papirus-icon-theme
#qt5ct && qt6ct && lxappearance

## Sound server
#yay -S pipewire pipewire-jack pipewire-pulse pipewire-alsa pipewire-media-session lib32-pipewire lib32-pipewire-jack pavucontrol

## Browsers
#yay -S firefox chromium
#firefox &
#sleep 2 && killall firefox
#fxpath=$(grep -oP "^Default=\K.{6,}" .mozilla/firefox/profiles.ini)
#cp -R ~/Downloads/dotfiles/.mozilla/firefox/profilename/chrome ~/.mozilla/firefox/$fxpath/
#cp -r ~/Downloads/dotfiles/.config/homepage ~/.config/

## Messengers
#yay -S telegram-desktop discord

## Keyring
#yay -S gnome-keyring seahorse

## Development
#yay -S visual-studio-code-bin k9s insomnia-bin dbeaver docker
#sudo systemctl enable --now docker
#sudo gpasswd -a sgtxn docker

## File manager
#yay -S nemo nemo-fileroller nemo-image-converter nemo-seahorse nemo-share nemo-preview gvfs-smb 

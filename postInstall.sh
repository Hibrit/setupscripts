#!/bin/bash
#! not working
# Author: hibrit
# Purpose: setting up a freshly installed arch linux instance
# Date Created: 20/09/2020
# Date Modified: 20/09/2020

echo 'Script has started'
echo

#######################
#      INSTALLS
#######################

# yay
echo 'Installing yay if needed'
if ! command yay --noconfirm &> /dev/null
then
    git clone https://aur.archlinux.org/yay.git
    cd yay
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | makepkg -si
  Y
EOF
    cd ..
    rm -rf yay
fi

# essentials
echo 'Installing some essential packages through yay and pacman'
sudo pacman -S --needed --noconfirm alacritty zsh fzf thefuck plasma kde-applications xorg xorg-server xorx-xinit

yay -S --needed --noconfirm visual-studio-code-bin brave-bin bibata-cursor-theme ruby-colorls ookla-speedtest-bin

# fonts
echo 'Installing necessary fonts'
sudo pacman -S --needed --noconfirm ttf-fira-code ttf-ubuntu-font-family noto-fonts-emoji texlive-core texlive-fontsextra

yay -S --needed --noconfirm ttf-input nerd-fonts-meslo

# oh my zsh
echo 'Installing oh-my-zsh'
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# powerlevel10k
echo 'Installing powerlevel10k'
yay -S --needed --noconfirm zsh-theme-powerlevel10k-git


#######################
#       CONFIGS
#######################

# zsh
echo 'Making zsh config'
rm ~/.zshrc
cd ~/
wget https://github.com/Hibrit/archlinuxsettings/raw/master/zsh/.zshrc

# vs code
echo 'Making vscode config'
code --install-extension monokai.theme-monokai-pro-vscode
code --install-extension pkief.material-icon-theme
code --install-extension ms-python.python
code --install-extension esbenp.prettier-vscode
# rm this one
code --install-extension tomphilbin.gruvbox-themes
code --install-extension oderwat.indent-rainbow
code --install-extension 2gua.rainbow-brackets
code --install-extension christian-kohler.path-intellisense
code --install-extension aaron-bond.better-comments

rm ~/.config/Code/User/keybindings.json
rm ~/.config/Code/User/settings.json

cd ~/.config/Code/User/
wget https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/keybindings.json
wget https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/settings.json

# alacritty
echo 'Making alacritty config'
rm -rf ~/.config/alacritty
mkdir ~/.config/alacritty
cd ~/.config/alacritty
wget https://github.com/Hibrit/archlinuxsettings/raw/master/alacritty/alacritty.yml

echo
echo 'Script has been finished successfully'

# cloning .xinitrc
cd ~
wget https://github.com/Hibrit/archlinuxsettings/raw/master/.xinitrc

# rm itself
cd ~
rm postInstall.sh
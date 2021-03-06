#!/bin/bash
# Author: hibrit
# Purpose: setting up a freshly installed arch linux instance minimally
# Date Created: 20/09/2020
# Date Modified: 17/03/2021

echo 'Script has started'
echo

#######################
#      INSTALLS
#######################

# essentials
echo 'Installing some essential packages through yay and pacman'
sudo pacman -S --needed --noconfirm fzf thefuck

yay -S --needed --noconfirm visual-studio-code-bin protonvpn-cli-ng ruby-colorls


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

# alacritty
echo 'Making alacritty config'
rm -rf ~/.config/alacritty
mkdir ~/.config/alacritty
cd ~/.config/alacritty
wget https://github.com/Hibrit/archlinuxsettings/raw/master/alacritty/alacritty.yml

echo
echo 'Script has been finished successfully'

#! before running this script please run minimal_setup_script and then open vs code atleast once!

#* installing default extensions of vs code

code --install-extension jdinhlife.gruvbox
code --install-extension oderwat.indent-rainbow
code --install-extension ms-toolsai.jupyter
code --install-extension pkief.material-icon-theme
code --install-extension esbenp.prettier-vscode
code --install-extension ms-python.vscode-pylance
code --install-extension ms-python.python
code --install-extension 2gua.rainbow-brackets
code --install-extension aaron-bond.better-comments
code --install-extension christian-kohler.path-intellisense

#* download keybindings and default settings

cd ~/.config/Code/User
wget https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/keybindings.json
wget https://github.com/Hibrit/archlinuxsettings/raw/master/vscode/settings.json
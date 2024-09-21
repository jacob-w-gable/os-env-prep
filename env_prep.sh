#!/bin/bash

# Install the required packages
sudo apt-get install zsh curl git -y

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
# pull in the powerlevel10k configuration: ~/.p10k.zsh

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Add plugins to ~/.zshrc
sed -i 's/^plugins=(.*)/plugins=(git pip zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search sudo colored-man-pages command-not-found)/' ~/.zshrc

# Configure zsh
sed -i 's/^# \(COMPLETION_WAITING_DOTS="true"\)/\1/' ~/.zshrc

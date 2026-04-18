#!/bin/bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install zsh tmux coreutils vim gnu-sed openssl fzf tree rsync
brew install --cask alacritty
sudo bash -c 'echo "/opt/homebrew/bin/zsh" >> /etc/shells'
chsh -s /opt/homebrew/bin/zsh

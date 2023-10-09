#!/usr/bin/env bash
set -e

echo "[i] Ask for sudo password"
sudo -v

# move to ~ if we are not there yet
cd

# Create our code & dotfiles directoy
mkdir -p ~/Code/Private/dotfiles

# install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
  echo "[i] Install macOS Command Line Tools"
  xcode-select --install
fi

# install homwbrew
if [[ ! -x /usr/local/bin/brew ]]; then
  echo "[i] Install Homebrew"
  # get this from https://brew.sh/
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# add homebrew to $PATH
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$($(brew --prefix)/bin/brew shellenv)"

# install ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    echo "[i] Install Ansible"
    brew install ansible
fi

# check if we need to clone dotfiles
if [[ ! -d ~/Code/Private/dotfiles/ ]]; then
    echo "[i] Cloning dotfiles directory"
    git clone https://github.com/jansroka/dotfiles.git ~/Code/Private/dotfiles/
fi

# Make sure we cd into the dotfiles directory
# See https://stackoverflow.com/questions/255414/why-cant-i-change-directories-using-cd-in-a-script
cd ~/Code/Private/dotfiles
$SHELL

echo "[i] Git pull'ing dotfiles repo from Github"
cd ~/Code/Private/dotfiles/ && git pull origin main

# Run main playbook
echo "[i] Run Playbook"
cd ~/Code/Private/dotfiles/ && time ansible-playbook -i hosts dotfiles.yml -v

echo "[i] Done."
exit 0

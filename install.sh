#!/usr/bin/env bash

# Debian-based Distros' Installation Script

# Builds neovim from source to make sure it's v0.11.0+

# make sure everything is up-to-date
sudo apt update
sudo apt upgrade

# make sure git and stow is installed
sudo apt install git make tmux alacritty stow

if [[ $? -eq 0 ]]; then
    # bash
    if [[ -f $HOME/.bashrc ]]; then
        mv $HOME/.bashrc $HOME/.bashrc.bak
        echo "[INFO] Default .bashrc moved to $HOME/.bashrc.bak"
    fi
    if [[ -f $HOME/.bash_aliases ]]; then
        mv $HOME/.bash_aliases $HOME/.bash_aliases.bak
        echo "[INFO] Default .bash_aliases moved to $HOME/.bash_aliases.bak"
    fi

    # git
    if [[ -f $HOME/.gitconfig ]]; then
        mv $HOME/.gitconfig $HOME/.gitconfig.bak
        echo "[INFO] Default .gitconfig moved to $HOME/.gitconfig.bak"
    fi

    # neovim
    if [[ -d $HOME/.config/nvim ]]; then
        mv $HOME/.config/nvim $HOME/nvim.bak
        echo "[INFO] Default .config/nvim moved to $HOME/nvim.bak"
    fi

    # alacritty
    if [[ -d $HOME/.config/alacritty ]]; then
        mv $HOME/.config/alacritty $HOME/alacritty.bak
        echo "[INFO] Default .config/alacritty moved to $HOME/alacritty.bak"
    fi

    # tmux
    if [[ -d $HOME/.tmux.conf ]]; then
        mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
        echo "[INFO] Default .tmux.conf moved to $HOME/.tmux.conf.bak"
    fi
    if [[ -d $HOME/.config/tmux ]]; then
        mv $HOME/.config/tmux $HOME/tmux.bak
        echo "[INFO] Default .config/tmux moved to $HOME/tmux.bak"
    fi
else
    echo "[ERROR] Something went wrong with the installation of the programs."
    echo "[INFO] Please check the installation, then re-run this script."
fi


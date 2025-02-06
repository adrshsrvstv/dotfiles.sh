#!/usr/bin/env bash

BRANCH=$(hostname -s)

git clone -b $BRANCH --single-branch --separate-git-dir=$HOME/.dotfiles git@github.com:adrshsrvstv/.dotfiles.git $HOME/temp-dotfiles

rsync --recursive --verbose --exclude '.git' $HOME/temp-dotfiles/ $HOME/

rm -rf $HOME/temp-dotfiles

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

echo "Done! Restart your shell for your settings to take effect."
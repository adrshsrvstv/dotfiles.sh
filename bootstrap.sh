#!/usr/bin/env bash

set -e

BRANCH=$(hostname -s)

echo "Cloning repo to $HOME/temp-dotfiles ..."

git clone -b $BRANCH --single-branch --separate-git-dir=$HOME/.dotfiles git@github.com:adrshsrvstv/.dotfiles.git $HOME/temp-dotfiles

echo "Cloned repo. Putting the files back to $HOME ..."

rsync --recursive --verbose --exclude '.git' $HOME/temp-dotfiles/ $HOME/

echo "Deleting $HOME/temp-dotfiles ..."

rm -rf $HOME/temp-dotfiles

echo "Setting git status.showUntrackedFiles to no ..."

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

echo "Done! Restart your shell for your settings to take effect."
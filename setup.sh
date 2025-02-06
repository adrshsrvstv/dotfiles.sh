#!/usr/bin/env bash

BRANCH=$(hostname -s)

git config --global --type bool push.autoSetupRemote true

git init --bare $HOME/.dotfiles

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout --orphan $BRANCH

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME remote add origin git@github.com:adrshsrvstv/.dotfiles.git

echo "Done. Export your alias and then add your dotfiles as shown in the README."

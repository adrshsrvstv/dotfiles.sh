#!/usr/bin/env bash

set -e

BRANCH=$(hostname -s)

echo "Setting git push.autoSetupRemote to true ..."

git config --global --type bool push.autoSetupRemote true

echo "Initializing a bare git repo at $HOME/.dotfiles ..."

git init --bare $HOME/.dotfiles

echo "Setting git status.showUntrackedFiles to no ..."

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

echo "Checking out a new branch..."

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout --orphan $BRANCH

echo "Adding the remote origin..."

git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME remote add origin git@github.com:adrshsrvstv/.dotfiles.git

echo "Done! Execute the following to add the 'dotfiles' alias to your shell: alias dotfiles='git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'"
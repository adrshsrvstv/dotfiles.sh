export BRANCH=$(hostname -s)

git clone -b $BRANCH --single-branch --separate-git-dir=$HOME/.dotfiles git@github.com:adrshsrvstv/.dotfiles.git $HOME/temp-dotfiles

rsync --recursive --verbose --exclude '.git' $HOME/temp-dotfiles/ $HOME/

rm -rf $HOME/temp-dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no

echo "Done!"
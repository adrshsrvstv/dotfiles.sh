git init --bare ~/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no

export BRANCH=$(hostname -s)

dotfiles checkout --orphan $BRANCH

git config --global --type bool push.autoSetupRemote true

dotfiles remote add origin git@github.com:adrshsrvstv/.dotfiles.git

echo "Done. Add your files using the dotfiles alias and push to the remote as usual."
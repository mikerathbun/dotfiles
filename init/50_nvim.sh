# Backups, swaps and undos are stored here.
mkdir -p $DOTFILES/caches/nvim

# Download Vim plugins.
if [[ "$(type -P nvim)" ]]; then
  nvim +PlugUpgrade +PlugUpdate +qall
fi


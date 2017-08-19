# Backups, swaps and undos are stored here.
mkdir -p $DOTFILES/caches/nvim
curl -fLo $DOTFILES/link/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Download Vim plugins.
if [[ "$(type -P nvim)" ]]; then
  nvim +PlugUpgrade +PlugUpdate +qall
fi


# is_ubuntu || return 1

# Backups, swaps and undos are stored here.
mkdir -p $DOTFILES/caches/nvim

curl -fLo $DOTFILES/link/.config/nvim/colors/molokai.vim --create-dirs \
  https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

curl -fLo /Users/mike/.dotfiles/link/.config/nvim/colors/github.vim --create-dirs \
  https://raw.githubusercontent.com/endel/vim-github-colorscheme/master/colors/github.vim

curl -fLo $DOTFILES/link/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# add python support to neovim
sudo pip3 install neovim
# Download Vim plugins.
if [[ "$(type -P nvim)" ]]; then
  nvim +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qall
fi


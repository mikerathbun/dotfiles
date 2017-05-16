# Sets up necessary rbenv settings
export PATH

# rbenv init.
PATH="$(path_remove $DOTFILES/vendor/rbenv/bin):$DOTFILES/vendor/rbenv/bin"
PATH="$(path_remove $DOTFILES/vendor/rbenv/plugins/ruby-build/bin):$DOTFILES/vendor/rbenv/plugins/ruby-build/bin"

if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
  eval "$(rbenv init -)"
fi


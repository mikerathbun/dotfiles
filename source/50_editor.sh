# Editing

if [[ ! "$SSH_TTY" ]] && is_osx; then
  export EDITOR='nvim'
  export LESSEDIT='nvim ?lm+%lm -- %f'
else
  export EDITOR='nvim'
fi

export VISUAL="$EDITOR"
alias q="$EDITOR"
# alias qv="q $DOTFILES/link/.{,g}vimrc +'cd $DOTFILES'"
alias qs="q $DOTFILES"

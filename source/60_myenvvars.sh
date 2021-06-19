export MYVIMRC=$HOME/.config/nvim/init.vim
if [[ $MYENV == "macos" ]]; then
  export MYDBDEV=$HOME/Dropbox/dev
elif [[ $MYENV == "cloud" ]]; then
  export MYDBDEV=$HOME/Dropbox/dev
elif [[ $MYENV == "vagrant" ]]; then
  export MYDBDEV=$HOME/Dropbox/dev
else
  echo "****** You need to set the 000_setthisenv.sh - 60_myenvvars.sh"
fi

# Set the current project you are working on for convenience
# also get into the virtualenv

# Disable warning of change to zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

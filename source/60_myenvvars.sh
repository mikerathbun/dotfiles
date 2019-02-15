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

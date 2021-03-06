
# I think we only want this to run on macos
# Probably the best thing would be to test for .nvm and then run it
if [[ $MYENV == "macos" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm use --delete-prefix v10.15.2 --silent
fi

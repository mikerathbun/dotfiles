# Install the Go programming language

# Install needed packages
e_header "Installing Go"

source $DOTFILES/source/30_go.sh

if [[ "$(type -P go)" ]]; then
  version=(1.8.3)

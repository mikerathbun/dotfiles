# Install the Go programming language

# Install needed packages
e_header "Installing Go"

source $DOTFILES/source/30_go.sh
version="1.8.3"
goDownloadFile="go$version.src.tar.gz"
# goDownloadFile="go$version.linux-amd64.tar.gz"
downloadLocation="https://storage.googleapis.com/golang/"
# Download Go
cd /tmp

curl -O "$downloadLocation$goDownloadFile"
tar xvf $goDownloadFile


# if [[ "$(type -P go)" ]]; then
#   version=(1.8.3)

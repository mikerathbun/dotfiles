# Sets up the Go paths
export PATH

if [[ $MYENV == "linode" ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=~/dev_files/go
elif [[ $MYENV == "macos" ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=~/Documents/dev/go
elif [[ $MYENV == "cloud" ]]; then
  export PATH=$PATH:/usr/lib/go-1.10/bin
  export GOPATH=~/dev/go
elif [[ $MYENV == "vagrant" ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=~/vagrant_dev/Go
else
  echo "****** You need to set the 000_setthisenv.sh"
fi

export MYGOPATH=$GOPATH/src/github.com/mikerathbun

PATH=$PATH:$GOPATH/bin

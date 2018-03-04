# Sets up the Go paths
export PATH

if [[ $MYENV == "linode" ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=~/dev_files/go
elif [[ $MYENV == "mac" ]]; then
  echo "****** You need to set up the 30_go.sh file for mac"
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=~/Documents/dev/go
else
  echo "****** You need to set the 000_setthisenv.sh"
fi

export MYGOPATH=$GOPATH/src/github.com/mikerathbun

PATH=$PATH:$GOPATH/bin

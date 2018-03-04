# Sets up the Go paths
export PATH

if [[ $MYENV == "linode" ]]; then
  PATH=$PATH:/usr/lib/go-1.9/bin
  export GOPATH=~/dev_files/go
elif [[ $MYENV == "mac" ]]; then
  echo "****** You need to set up the 30_go.sh file for mac"
  PATH=$PATH:/usr/lib/go-1.9/bin
  export GOPATH=~/Documents/dev/go
else
  echo "****** You need to set the 000_setthisenv.sh"
fi

export MYGOPATH=$GOPATH/src/github.com/mikerathbun

PATH=$PATH:$GOPATH/bin

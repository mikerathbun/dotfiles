# Sets up the Go paths
export PATH

if [[ $MYENV == "linode" ]]; then
  echo "we are in $MYENV"
  PATH=$PATH:/usr/lib/go-1.9/bin
  export GOPATH=~/dev_files/go
fi


PATH=$PATH:$GOPATH/bin

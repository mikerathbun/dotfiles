# Install the Go programming language

# Install needed packages
e_header "Installing Go"

sudo apt-get -qq  install golang-1.9-go

# need to do something to install the go tools
go get -u golang.org/x/tools/cmd/goget
go get github.com/jgautheron/goconst/cmd/goconst
go get github.com/GoASTScanner/gas/cmd/gas/...
go get github.com/remyoudompheng/go-misc/deadcode
go get github.com/fzipp/gocyclo
go get honnef.co/go/tools/cmd/gosimple
go get github.com/gordonklaus/ineffassign


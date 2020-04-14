#!/usr/bin/env bash



# Docker aliases
alias dkps="docker ps --format 'table {{.ID}} \t {{.Names}} \t {{.Status}} \t {{.Image}}'"
alias dk='docker'
alias dkl='docker logs -f'
alias dki='docker images'
alias dks='docker service'
alias dkcr="docker container run --name"
alias dkcrm="docker container run --rm"
alias dkc="docker container"

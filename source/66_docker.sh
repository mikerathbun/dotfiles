#!/usr/bin/env bash



# Docker aliases
alias dkps="docker ps --format 'table {{.ID}} \t {{.Names}} \t {{.Status}} \t {{.Image}}'"
alias dk='docker'
alias dkl='docker logs -f'
alias dkips='docker images'
alias dki='docker image'
alias dks='docker service'
alias dkcr="docker container run --name"
alias dkcrm="docker container run --rm"
alias dkc="docker container"

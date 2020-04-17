VAGRANT_DEFAULT_PROVIDER=virtualbox

alias vga='bat $DOTFILES/source/51_vagrant.sh'
alias vg='vagrant list-commands | bat'
alias vgu='vagrant up'
alias vgv='q Vagrantfile'
alias vgh='vagrant halt'
alias vgd='vagrant destroy -f'
alias vgs='vagrant status'
alias vgssh='vagrant ssh'

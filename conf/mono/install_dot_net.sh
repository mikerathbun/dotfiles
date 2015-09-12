#!/usr/bin/env bash
# sed -i "/call plug#end/i Plug \x27omnisharp/omnisharp-vim\x27" ~/.vimrc


# Install the .NET Core
echo "Finish install mono"
e_header "dnvm upgrade -r coreclr"
e_header "dnvm upgrade -r mono"

# e_header "Install libuv"



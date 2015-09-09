#!/usr/bin/env bash
sed -i "/call plug#end/i Plug \x27omnisharp/omnisharp-vim\x27" ~/.vimrc


# Install the .NET Core
echo "Installing current coreclr"
dnvm upgrade -r coreclr

echo "Installing DNX for Mono"
dnvm upgrade -r mono

# e_header "Install libuv"



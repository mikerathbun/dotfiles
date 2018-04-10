#!/usr/bin/env bash

# https://www.dropbox.com/install-linux
if [[ $MYENV == "cloud" ]]; then
  cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
  ~/.dropbox-dist/dropboxd
fi



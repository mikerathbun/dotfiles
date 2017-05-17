# Install rbenv and everything needed for
# Ruby development

# Install needed packages
e_header "Installing rbenv"

source $DOTFILES/source/30_ruby.sh

packages=(
  libyaml-dev
  libsqlite3-dev
  sqlite3
  libxml2-dev
  libxslt1-dev
  libcurl4-openssl-dev
  python-software-properties
  libffi-dev
  nodejs
)


packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))


if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt-get -qq install "$package"
  done
fi

# Install ruby
if [[ "$(type -P rbenv)" ]]; then
  versions=(2.4.1)

  rubies=($(setdiff "${versions[*]}" "$(rbenv whence ruby)"))
  if (( ${#rubies[@]} > 0 )); then
    e_header "Installing Ruby versions: ${rubies[*]}"
    for r in "${rubies[@]}"; do
      # This is just for testing since it takes a long time to actually install it.
 #     rbenv install "$r"
      [[ "$r" == "${versions[0]}" ]] && rbenv global "$r"
    done
  fi
fi

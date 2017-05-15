# Install rbenv and everything needed for
# Ruby development

# Install needed packages
e_header "Installing rbenv"
e_header "Adding needed packages"

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

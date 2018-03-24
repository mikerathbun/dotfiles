# Exit if pip is not installed.
# We will use brew on macOS
is_ubuntu || return 1
[[ ! "$(type -P pip)" ]] && e_error "Pip needs to be installed." && return 1
# we need to update pip for some reason
pip3 install --upgrade pip
pip install --upgrade pip

# Add pip packages
pip_packages=(
  netifaces
  powerline-status
  neovim
  psutil
)

installed_pip_packages="$(pip list 2>/dev/null | awk '{print $1}')"
pip_packages=($(setdiff "${pip_packages[*]}" "$installed_pip_packages"))

if (( ${#pip_packages[@]} > 0 )); then
  e_header "Installing pip packages (${#pip_packages[@]})"
  for package in "${pip_packages[@]}"; do
    e_arrow "$package"
    pip install "$package"
  done
fi

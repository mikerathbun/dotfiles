# Ubuntu install of .NET
is_ubuntu || return 1
e_header "Installing Mono"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install -y mono-complete ca-certificates-mono

# docs.asp.net installing on linux
e_header "Installing DOT.NET Version Manager"
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | \
  DNX_BRANCH=dev sh
source ~/.dnx/dnvm/dnvm.sh
# Just see it work
dnvm

# Install the .NET Core
e_header "Installing current coreclr"
dnvm upgrade -r coreclr


sudo apt-get install -r libunwind8 \
  gettext \
  libssl-dev \
  libcurl3-dev \
  zlib1g

e_header "Installing DNX for Mono"
dnvm upgrade -r mono

e_header "Install libuv"
sudo apt-get install make automake libtool curl
curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src
cd /usr/local/src/libuv-1.4.2
sudo sh autogen.sh
sudo ./configure
sudo make
sudo make install
sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
sudo ldconfig

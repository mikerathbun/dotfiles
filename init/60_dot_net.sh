# Ubuntu install of .NET
is_ubuntu || return 1
e_header "Installing Mono"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update -qq
sudo apt-get install -y -qq mono-complete \
  ca-certificates-mono \
  libunwind8 \
  gettext \
  libssl-dev \
  libcurl3-dev \
  zlib1g \
  make \
  automake \
  libtool \
  curl

# docs.asp.net installing on linux
e_header "Installing DOT.NET Version Manager"
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | \
  DNX_BRANCH=dev sh
source ~/.dnx/dnvm/dnvm.sh
# Just see it worK
dnvm

# Install the .NET Core
e_header "Installing current coreclr"
source ~/.dnx/dnvm/dnvm.sh
dnvm upgrade -r coreclr

e_header "Installing DNX for Mono"
source ~/.dnx/dnvm/dnvm.sh
dnvm upgrade -r mono

#e_header "Install libuv"
#sudo apt-get install -y curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src
#cd /usr/local/src/libuv-1.4.2
#sudo sh autogen.sh
#sudo ./configure
#sudo make
#sudo make install
#sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
#sudo ldconfig

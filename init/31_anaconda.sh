


# Install the Anaconda Python distribution
version="5.0.1"
anacondaFileName="Anaconda3-$version-Linux-x86_64.sh"
downloadAddress="https://repo.continuum.io/archive/"
installDirectory="$DOTFILES/vendor/anaconda3/"

echo "It is $version"
echo "$downloadAddress$anacondaFileName"
echo "installDirectory is $installDirectory"

echo "Downloading to /tmp"
cd /tmp
wget "$downloadAddress$anacondaFileName"
bash $anacondaFileName -b -p $installDirectory

# This will hopefully delete it.
rm /tmp/anacondaFileName


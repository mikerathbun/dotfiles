


# Install the Anaconda Python distribution
version="4.4.0"
anacondaFileName="Anaconda3-$version-Linux-x86_64.sh"
downloadAddress="https://repo.continuum.io/archive/"

echo "It is $version"
echo "$downloadAddress$anacondaFileName"

echo "Downloading to /tmp"
cd /tmp
curl -O "$downloadAddress$anacondaFileName"
bash $anacondaFileName -b



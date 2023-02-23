# Home directory
cd ~/work

# Get the version
if [ $# -eq 0 ]
then 
    version="39"
    echo "Default Version: $version"
else
    version="$1"
    echo "Provided Version: $version"
fi

# Define variables
ngspice_path="ngspice-$version"
package="ngspice-$version.tar.gz"
url=https://sourceforge.net/projects/ngspice/files/ng-spice-rework/${version}/${package}

# Download the ngspice tar file
if test -f $package; then 
    echo "1. $package exists!"
else 
    echo "1. Downloading ngspice: $package"
    wget -L "${url}"
fi

# Extract the files 
echo "2. Extracting files"
tar -xzvf "$package"

cd "$ngspice_path"

# Create setup directory
if [-d "./release"] 
then
    echo "release exists!"
else 
  mkdir release
fi 

cd release 

# Update the system
sudo apt-get update

# Install Xaw library
sudo apt-get -y install libxaw7-dev

# Install xterm
sudo apt-get -y install xterm

# Run configuration
../configure  --with-x --with-readline=yes --disable-debug

# Compile
make 

# Install 
sudo make install


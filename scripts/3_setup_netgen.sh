# Home directory
cd ~/work

# Install GNU m4
sudo apt-get install -y m4

# Clone the repository
git clone git://opencircuitdesign.com/netgen

cd netgen

# Configure the package
./configure

# Compile the package
make

# Install the package
sudo make install

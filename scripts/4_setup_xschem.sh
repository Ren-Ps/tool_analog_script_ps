# Home directory
cd ~/work

# Update the system
sudo apt-get update 

# Install flex and bison
sudo apt-get install -y flex bison

# Install libjpeg-dev 
# sudo apt-get -y install libjpeg-dev

# Install xcb
# sudo apt-get -y install xcb

# Clone the repository
git clone https://github.com/StefanSchippers/xschem.git xschem-src

cd xschem-src

# Configure the installation
./configure

# Compile the source
make

# Install the software
sudo make install
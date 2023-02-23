# Home directory
cd ~/work

# Install setup-tools
sudo apt-get -y install python3-setuptools


# Clone the Open PDK repository
if [ -d ~/work/open_pdks]
then
    echo "Already cloned!"
else 
    git clone git://opencircuitdesign.com/open_pdks
fi

cd open_pdks

# Configure Open PDK to use Sky130 libraries
./configure --enable-sky130-pdk

# Compile the PDK
make 

# Install the PDK
sudo make install

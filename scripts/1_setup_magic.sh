#!/bin/bash


t="13"

# update your system
echo "[1/$t] Updating the system"
sudo apt update

# uncomment it if you downloaded this file from elsewhere
# install git
# echo "[2/$t] Installing Git"
# sudo apt install -y git

echo "[3/$t] Installing build essential tools"
# install build-essential tools
sudo apt install -y build-essential

echo "[4/$t] Installing csh"
# install csh
sudo apt install -y csh

echo "[5/$t] Installing x11-apps"
# install x11
sudo apt install -y x11-apps

echo "[6/$t] Installing x11-xserver"
# install X11
sudo apt install -y x11-xserver-utils

echo "[7/$t] Installing OpenGL"
# install OpenGL
sudo apt install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev

# install Tcl/Tk
echo "[8/$t] Installing Tcl/Tk"
sudo apt install -y tcl-dev tk-dev

# make a work directory
echo "[9/$t] Creating work directory"
if [-d "~/work"]
then
    echo "[*] Work exists"
else 
    mkdir -p ~/work
fi

# change to the work directory
cd ~/work

# clone the repo
echo "[10/$t] Clonning the Magic repo"
git clone git://opencircuitdesign.com/magic

# change into the magic directory
cd magic

# configure magic
echo "[11/$t] Configuring Magic"
./configure

echo "[12/$t] Compiling Magic"
# build magic
make

# install magic
echo "[13/$t] Installing Magic"
sudo make install

echo -e "\n\n\nCompleted Magic installation."
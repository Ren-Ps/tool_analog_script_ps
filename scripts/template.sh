# Create a new folder  structure
if [ $# -eq 0 ]
then 
    design="design"
else
    design="$1"
fi

mkdir "$design"
pwd=$(pwd)
cd "$pwd/$design"

# Create sub-folders for all the software
mkdir magic ngspice netgen xschem

# Copy all the required files
cp /usr/local/share/pdk/sky130A/libs.tech/magic/sky130A.magicrc ./magic/.magicrc
cp /usr/local/share/pdk/sky130A/libs.tech/ngspice/spinit ./ngspice/.spiceinit
cp /usr/local/share/pdk/sky130A/libs.tech/netgen//sky130A_setup.tcl ./netgen/
cp /usr/local/share/pdk/sky130A/libs.tech/xschem/xschemrc ./xschem/

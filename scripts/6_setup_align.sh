# Home directory
cd ~/work

# Clone the ALIGN source
git clone https://github.com/ALIGN-analoglayout/ALIGN-public

cd ALIGN-public

# Install virtual environment for python
sudo apt -y install python3.8-venv

# Install the latest pip
sudo apt-get -y install python3-pip

# Create python virtual envronment
python3 -m venv general

source general/bin/activate

python3 -m pip install pip --upgrade

pip install pandas
pip install scipy
pip install nltk
pip install gensim

pip install setuptools wheel pybind11 scikit-build cmake ninja

# Install ALIGN as a user
pip install -v .

# Install ALIGN  as a developer
pip install -e .

pip install -v -e .[test] --no-build-isolation
pip install -v --no-build-isolation -e . --no-deps --install-option='-DBUILD_TESTING=ON'
pip install -v --no-build-isolation -e . --no-deps --install-option='-DBUILD_TESTING=ON'


# Clone the Sky130 PDK
cd ~/Work/ALIGN-public/pdk

git clone https://github.com/ALIGN-analoglayout/ALIGN-pdk-sky130


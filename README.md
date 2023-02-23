# tool_analog_script

As a preparation for the work, we are going to install the following software in **Ubuntu 20.04**. I created the scripts in the following numbered order, it is best if they are run in the same order.

<br>

## Table of Contents 
| #  |         Topic          |   Description        | Status
|:--:|:-------------------------:|:--------------------:|:-----:|
| 1  | [Setting up the tools](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#1-setting-up-the-tools)      | Set up all the software and PDK required for the following labs|:white_check_mark:|
| 2  | [Pre-layout characterization of inverter using xschem and ngspice](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#2-pre-layout-characterization-of-inverter-using-xschem-and-ngspice) | Create an inverter in xschem and run simulation|:white_check_mark:|
| 3  | [Post-layout characterization of inverter using Magic, xschem, and ngspice](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#3-post-layout-characterization-of-inverter-using-magic-xschem-and-ngspice) | Create layout and extract netlist to run simulation|:white_check_mark:|
| 4  | [LVS of the Inverter](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#4-lvs-of-the-inverter) | Run layout vs schematic for two netlists |:white_check_mark:|
| 5  | [Pre-layout characterization of Fn using xchem and ngspice](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#5-pre-layout-characterization-of-fn-using-xchem-and-ngspice) | Create Fn=[(B+D).(A+C)+E.F]' in xschem and run simulation |:large_orange_diamond:|
| 6  | [Post-layout characterization of Fn using Magic, xschem and ngspice](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#6-post-layout-characterization-of-fn-using-magic-xschem-and-ngspice) | Create layout and extract netlist to run simulation |:large_orange_diamond:|
| 7  | [LVS of the Fn function](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#7-lvs-of-the-fn-function) | Run layout vs schematic for two netlists of Fn|:large_orange_diamond:|




<br><br><br>


## 1. Setting up the tools

| #  |         Software          |   Description        |
|:-----------:|:-------------------------:|:--------------------:|
| 1           | [magic](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#1-magic)                 |    Layout Editor    |
| 2           | [ngspice](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#2-ngspice)               |    SPICE Simulation  |
| 4           | [xschem](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#3-xschem)                |    Schematic Editor  |
| 3           | [netgen](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#4-netgen)                |    Netlist Generator |
| 5           | [Open PDK (Sky130)](https://github.com/rajivbishwokarma/msvsdasms/tree/master/week0#open-pdk-sky130)     |    Sky130 library    |
| 6           | [ALIGN]()     |    Analog Netlist to GDS    |


### <p align="center"> Run all the provided scripts a non-root user </p>


The [0_run_all.sh](./0_run_all.sh) script runs all the scripts one after another. It should work and you are welcome to try, but I cannot verify that it works 100% as I have not tested it. I recommend running all the scripts one by one, in the given order for a tested setup.

In addition to the above scripts, I have also written a separate small script called [template.sh](./template.sh) that creates a folder structure for the design project and initializes the sub-folders with required files. 

**BIG NOTE: You can only run this script after running all the scripts given above.**
To use the **template.sh** script, do:

```
./template.sh     or     ./template.sh <design_name>
```

[Small note] If you want to run the **template.sh** script from anywhere within the system, then run the [export_template.sh](./export_template.sh) script using the following command [note the extra dot in the beginning].

```
. ./export_template.sh
```


For example, if you just use the template.sh without any design name, it will create a folder called **design** and then populate the sub-folders. If you supply a design name, say, **week0_inverter** then it will create a folder named **week0_inverter** and populate the sub-folders.


## 1. [Magic]()

Install Magic and all its dependencies using the [1_setup_magic.sh](./1_setup_magic.sh) script. Just do:

```
chmod +x 1_setup_magic.sh

./1_setup_magic.sh
```

## 2. [ngspice]()

Install **ngspice** and all its dependencies using the [2_setup_ngspice.sh](./2_setup_ngspice.sh) script. Just do:

```
chmod +x 2_setup_ngspice.sh

./2_setup_ngspice.sh
```

## 4. [netgen]()

Install **netgen** and all its dependencies using the [3_setup_netgen.shv](./3_setup_netgen.sh) script. Just do:

```
chmod +x 3_setup_netgen.sh

./3_setup_netgen.sh
```


## 4. [xschem]()

Install **xschem** and all its dependencies using the [4_setup_xschem.sh](./4_setup_xschem.sh) script. Just do:

```
chmod +x 4_setup_xschem.sh

./4_setup_xschem.sh
```

## 5. [Open PDK with Sky130]()

Install **Open PDK with Sky130 library** and all its dependencies using the [5_setup_openpdk.sh](./5_setup_openpdk.sh) script. Just do:

```
chmod +x 5_setup_openpdk.sh

./5_setup_openpdk.sh
```

## 6. [ALIGN](https://github.com/ALIGN-analoglayout/ALIGN-public)

Install **ALIGN** with the [6_setup_align.sh](./6_setup_align.sh) script. Do:
```
chmod +x 5_setup_openpdk.sh

./5_setup_align.sh
```

To, then, run the ALIGN tool, cd into ALIGN-public and do:
```
source general/bin/activate

schematic2layout.py <NETLIST_DIR> -p <PDK_DIR> -c
```

To test an example design named **inverter_v1**, cd into **work** folder within ALIGN-public directory and do:
```
schematic2layout.py ../examples/inverter_v1/ -p ../pdks/FinFET14nm_Mock_PDK/
```

## 6.1 [ALIGN-SKY130 PDK](https://github.com/ALIGN-analoglayout/ALIGN-pdk-sky130)

The ALIGN installation script should have installed the PDK inside **ALIGN-public/pdk/** folder. But in case it did not, follow the following steps.

To install the Sky130 PDK that is compatible with ALIGN tool, clone the following repo inside **ALIGN-public/pdk** folder.

```
git clone https://github.com/ALIGN-analoglayout/ALIGN-pdk-sky130
```
And, then use one of the examples to test the setup with:

```
schematic2layout.py ../pdks/ALIGN-pdk-sky130/examples/telescopic_ota/ -p ../pdks/ALIGN-pdk-sky130/SKY130_PDK/
```

<br><br>

#!/bin/bash

# Read board_id from u-boot env
board_id=`/sbin/fw_printenv -n board_id`
num_of_cpu=1

# i2c BUS
DEV_I2C_2="/dev/i2c-2"
DEV_I2C_3="/dev/i2c-3"
I2C_BUS=2
I2C_MUX=0x70

# i3c bus
I3C_TOOL="/usr/bin/i3ctransfer"
DEV_I3C_PATH="/sys/bus/platform/drivers/dw-i3c-master"
DEV_I3C_4="1e7a6000.i3c4"
DEV_I3C_5="1e7a7000.i3c5"
I3C_MUX_0="/dev/i3c-4-4cc00000000"
I3C_MUX_1="/dev/i3c-5-4cc00000000"
i3c_mux_present=0

DEV_I3C_SBTSI_PATH="/sys/bus/i3c/drivers/sbtsi_i3c"
DEV_I3C_SBTSI_4="4-22400000001"
DEV_I3C_SBTSI_5="5-22400000001"

# DEV_I3C_SBRMI_PATH="/sys/bus/i3c/drivers/sbrmi_i3c"
# DEV_I3C_SBRMI_4="4-22400000002"
# DEV_I3C_SBRMI_5="5-22400000002"

# check num of cpu
check_num_of_cpu()
{
    # If no board_id then set num of cpu to 2 socket
    case "$board_id" in
        "40" | "41" | "42")
            echo " Onyx 1 CPU"
            num_of_cpu=1
            ;;
        "46" | "47" | "48")
            echo " Ruby 1 CPU"
            num_of_cpu=1
            ;;
        "43" | "44" | "45")
            echo " Quartz 2 CPU"
            num_of_cpu=2
            ;;
        "49" | "4A" |"4a" | "4B" | "4b")
            echo " Titanite 2 CPU "
            num_of_cpu=2
            ;;
        *)
            num_of_cpu=2
            ;;
    esac
}
# Set i2c APML
set_i2c_apml()
{
    echo "Setting I2C-2 Mux for CPU APML "
    i2cset -f -y $I2C_BUS $I2C_MUX 0x46 0x01 || retval=$?
    if [[ "$retval" -ne 0 ]]; then
        echo "Error: Setting I2C Mux Reg 0x46"
    fi
    i2cset -f -y $I2C_BUS $I2C_MUX 0x40 0x40 || retval=$?
    if [[ "$retval" -ne 0 ]]; then
        echo "Error: Setting I2C Mux Reg 0x40"
    fi
    i2cset -f -y $I2C_BUS $I2C_MUX 0x41 0x40 || retval=$?
    if [[ "$retval" -ne 0 ]]; then
        echo "Error: Setting I2C Mux Reg 0x46"
    fi
    if [ -a "$DEV_I2C_3" ]
    then
        echo "Setting I2C-3 Mux for CPU APML "
        I2C_BUS=3
        i2cset -f -y $I2C_BUS $I2C_MUX 0x46 0x01 || retval=$?
        if [[ "$retval" -ne 0 ]]; then
            echo "Error: Setting I2C Mux Reg 0x46"
        fi
        i2cset -f -y $I2C_BUS $I2C_MUX 0x40 0x40 || retval=$?
        if [[ "$retval" -ne 0 ]]; then
            echo "Error: Setting I2C Mux Reg 0x40"
        fi
        i2cset -f -y $I2C_BUS $I2C_MUX 0x41 0x40 || retval=$?
        if [[ "$retval" -ne 0 ]]; then
            echo "Error: Setting I2C Mux Reg 0x46"
        fi
    fi
}

# Set i3c APML
set_i3c_apml()
{
    echo "Setting I3C Mux for CPU 0 APML "
    if [ -a "$I3C_MUX_0" ]
    then
        $I3C_TOOL -d $I3C_MUX_0 -w 0x46 -r 1 > /dev/null 2>&1
        if [[ $? -ne 0 ]]
        then
            echo "I3C Mux 0 not present"
            i3c_mux_present=0
        else
            echo "I3C Mux 0 present"
            i3c_mux_present=1
        fi
    else
        i3c_mux_present=0
    fi
    if [[ $i3c_mux_present == 0 ]]
    then
        # Unbind sbtsi driver
        echo  $DEV_I3C_SBTSI_4 > $DEV_I3C_SBTSI_PATH/unbind
        # echo  $DEV_I3C_SBRMI_4 > $DEV_I3C_SBRMI_PATH/unbind
        sleep 1
        # Unbind platform i3c driver
        echo  $DEV_I3C_4 > $DEV_I3C_PATH/unbind
        sleep 1
        # Bind platform i3c driver
        echo  $DEV_I3C_4 > $DEV_I3C_PATH/bind
        sleep 1
    fi
    $I3C_TOOL -d $I3C_MUX_0 -w 0x46,0x00,0x01
    $I3C_TOOL -d $I3C_MUX_0 -w 0x40,0x00,0x40
    $I3C_TOOL -d $I3C_MUX_0 -w 0x41,0x00,0x40

    # Unbind sbtsi driver
    echo  $DEV_I3C_SBTSI_4 > $DEV_I3C_SBTSI_PATH/unbind
    # echo  $DEV_I3C_SBRMI_4 > $DEV_I3C_SBRMI_PATH/unbind
    sleep 1
    # Unbind platform i3c driver
    echo  $DEV_I3C_4 > $DEV_I3C_PATH/unbind
    sleep 1
    # Bind platform i3c driver
    echo  $DEV_I3C_4 > $DEV_I3C_PATH/bind

    if [[ $num_of_cpu == 2 ]]
    then
        echo "Setting I3C Mux for CPU 1 APML "
        if [ -a "$I3C_MUX_1" ]
        then
            $I3C_TOOL -d $I3C_MUX_1 -w 0x46 -r 1 > /dev/null 2>&1
            if [[ $? -ne 0 ]]
            then
                echo "I3C Mux 1 not present"
                i3c_mux_present=0
            else
                echo "I3C Mux 1 present"
                i3c_mux_present=1
            fi
        else
            i3c_mux_present=0
        fi
        if [[ $i3c_mux_present == 0 ]]
        then
            # Unbind sbtsi driver
            echo  $DEV_I3C_SBTSI_5 > $DEV_I3C_SBTSI_PATH/unbind
            # echo  $DEV_I3C_SBRMI_5 > $DEV_I3C_SBRMI_PATH/unbind
            sleep 1
            # Unbind platform i3c driver
            echo  $DEV_I3C_5 > $DEV_I3C_PATH/unbind
            sleep 1
            # Bind platform i3c driver
            echo  $DEV_I3C_5 > $DEV_I3C_PATH/bind
            sleep 1
        fi
        $I3C_TOOL -d $I3C_MUX_1 -w 0x46,0x00,0x01
        $I3C_TOOL -d $I3C_MUX_1 -w 0x40,0x00,0x40
        $I3C_TOOL -d $I3C_MUX_1 -w 0x41,0x00,0x40
        # Unbind sbtsi driver
        echo  $DEV_I3C_SBTSI_5 > $DEV_I3C_SBTSI_PATH/unbind
        # echo  $DEV_I3C_SBRMI_5 > $DEV_I3C_SBRMI_PATH/unbind
        sleep 1
        # Unbind platform i3c driver
        echo  $DEV_I3C_5 > $DEV_I3C_PATH/unbind
        sleep 1
        # Bind platform i3c driver
        echo  $DEV_I3C_5 > $DEV_I3C_PATH/bind
    fi
}


# Main()
#---------

# check num of cpu
check_num_of_cpu

# check for i2c vs i3c
if [ -a "$DEV_I2C_2" ]
then
    set_i2c_apml
else
    set_i3c_apml
fi

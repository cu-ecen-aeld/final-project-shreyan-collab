#!/bin/bash
# Script to build image for qemu.
# Author: Siddhant Jajoo.

git submodule init
git submodule sync
git submodule update

# local.conf won't exist until this step on first execution
source poky/oe-init-build-env

CONFLINE="MACHINE = \"raspberrypi3\""

#Create image of the type rpi-sdimg
IMAGE="IMAGE_FSTYPES = \"wic.bz2\""

#Set GPU memory as minimum
MEMORY="GPU_MEM = \"16\""

#Add wifi support
DISTRO_F="DISTRO_FEATURES:append = \"wifi bluetooth\""
#add firmware support 
IMAGE_ADD="IMAGE_INSTALL:append = \"linux-firmware-rpidistro-bcm43430 v4l-utils python3 ntp wpa-supplicant i2c-tools spitools libgpiod libgpiod-tools libgpiod-dev gdb gdbserver valgrind can-utils iproute2 obexftp bluez5\""

#Licence
LICENCE="LICENSE_FLAGS_ACCEPTED  = \"commercial\""
IMAGE_F="IMAGE_FEATURES += \"ssh-server-openssh tools-debug tools-profile eclipse-debug\""
#IMAGE_F="IMAGE_FEATURES += \"ssh-server-openssh tools-debug src-pkgs dbg-pkgs\""

#spi - spitools
#gdb gdbserver - gdb tools-debug 
#src-pkgs dbg-pkgs- Adavnce gdb 

#I2C
MODULE_I2C="ENABLE_I2C = \"1\""
MODULE_SPI="ENABLE_SPI_BUS = \"1\""
MODULE_CAN="ENABLE_CAN = \"1\""

AUTOLOAD_I2C="KERNEL_MODULE_AUTOLOAD:rpi += \"i2c-dev i2c-bcm2708\""
AUTOLOAD_SPI="KERNEL_MODULE_AUTOLOAD:rpi += \"spidev\""
AUTOLOAD_CAN="KERNEL_MODULE_AUTOLOAD:rpi += \"mcp251x flexcan\""

#Extra packages
CORE_IM_ADD="CORE_IMAGE_EXTRA_INSTALL += \"i2c-config server-config client-config gpio-config spi-config\""
CAN_OSCILLATOR_CONFIG="CAN_OSCILLATOR = \"8000000\""

cat conf/local.conf | grep "${CONFLINE}" > /dev/null
local_conf_info=$?

cat conf/local.conf | grep "${IMAGE}" > /dev/null
local_image_info=$?

cat conf/local.conf | grep "${MEMORY}" > /dev/null
local_memory_info=$?

cat conf/local.conf | grep "${DISTRO_F}" > /dev/null
local_distro_info=$?

cat conf/local.conf | grep "${IMAGE_ADD}" > /dev/null
local_imgadd_info=$?

cat conf/local.conf | grep "${LICENCE}" > /dev/null
local_licn_info=$?

cat conf/local.conf | grep "${IMAGE_F}" > /dev/null
local_imgf_info=$?

cat conf/local.conf | grep "${MODULE_I2C}" > /dev/null
local_i2c_info=$?

cat conf/local.conf | grep "${MODULE_SPI}" > /dev/null
local_spi_info=$?

cat conf/local.conf | grep "${MODULE_CAN}" > /dev/null
local_can_info=$?

cat conf/local.conf | grep "${AUTOLOAD_I2C}" > /dev/null
local_i2c_autoload_info=$?

cat conf/local.conf | grep "${AUTOLOAD_SPI}" > /dev/null
local_spi_autoload_info=$?

cat conf/local.conf | grep "${AUTOLOAD_CAN}" > /dev/null
local_can_autoload_info=$?

cat conf/local.conf | grep "${CAN_OSCILLATOR_CONFIG}" > /dev/null
local_can_oscillator_info=$?

cat conf/local.conf | grep "${CORE_IM_ADD}" > /dev/null
local_coreimadd_info=$?



if [ $local_conf_info -ne 0 ];then
	echo "Append ${CONFLINE} in the local.conf file"
	echo ${CONFLINE} >> conf/local.conf
	
else
	echo "${CONFLINE} already exists in the local.conf file"
fi

if [ $local_image_info -ne 0 ];then 
    echo "Append ${IMAGE} in the local.conf file"
	echo ${IMAGE} >> conf/local.conf
else
	echo "${IMAGE} already exists in the local.conf file"
fi

if [ $local_memory_info -ne 0 ];then
    echo "Append ${MEMORY} in the local.conf file"
	echo ${MEMORY} >> conf/local.conf
else
	echo "${MEMORY} already exists in the local.conf file"
fi

if [ $local_distro_info -ne 0 ];then
    echo "Append ${DISTRO_F} in the local.conf file"
	echo ${DISTRO_F} >> conf/local.conf
else
	echo "${DISTRO_F} already exists in the local.conf file"
fi

if [ $local_imgadd_info -ne 0 ];then
    echo "Append ${IMAGE_ADD} in the local.conf file"
	echo ${IMAGE_ADD} >> conf/local.conf
else
	echo "${IMAGE_ADD} already exists in the local.conf file"
fi

if [ $local_licn_info -ne 0 ];then
    echo "Append ${LICENCE} in the local.conf file"
	echo ${LICENCE} >> conf/local.conf
else
	echo "${LICENCE} already exists in the local.conf file"
fi

if [ $local_imgf_info -ne 0 ];then
    echo "Append ${IMAGE_F} in the local.conf file"
	echo ${IMAGE_F} >> conf/local.conf
else
	echo "${IMAGE_F} already exists in the local.conf file"
fi

if [ $local_i2c_info -ne 0 ];then
        echo "Append ${MODULE_I2C} in the local.conf file"
        echo ${MODULE_I2C} >> conf/local.conf
else
        echo "${MODULE_I2C} already exists in the local.conf file"
fi

if [ $local_i2c_autoload_info -ne 0 ];then
        echo "Append ${AUTOLOAD_I2C} in the local.conf file"
        echo ${AUTOLOAD_I2C} >> conf/local.conf
else
        echo "${AUTOLOAD_I2C} already exists in the local.conf file"
fi


if [ $local_spi_info -ne 0 ];then
        echo "Append ${MODULE_SPI} in the local.conf file"
        echo ${MODULE_SPI} >> conf/local.conf
else
        echo "${MODULE_SPI} already exists in the local.conf file"
fi

if [ $local_spi_autoload_info -ne 0 ];then
        echo "Append ${AUTOLOAD_SPI} in the local.conf file"
        echo ${AUTOLOAD_SPI} >> conf/local.conf
else
        echo "${AUTOLOAD_SPI} already exists in the local.conf file"
fi

if [ $local_can_info -ne 0 ];then
        echo "Append ${MODULE_CAN} in the local.conf file"
        echo ${MODULE_CAN} >> conf/local.conf
else
        echo "${MODULE_CAN} already exists in the local.conf file"
fi

if [ $local_can_autoload_info -ne 0 ];then
        echo "Append ${AUTOLOAD_CAN} in the local.conf file"
        echo ${AUTOLOAD_CAN} >> conf/local.conf
        
else
        echo "${AUTOLOAD_CAN} already exists in the local.conf file"
fi

if [ $local_can_oscillator_info -ne 0 ];then
        echo "Append ${CAN_OSCILLATOR_CONFIG} in the local.conf file"
        echo ${CAN_OSCILLATOR_CONFIG} >> conf/local.conf
        
else
        echo ${CAN_OSCILLATOR_CONFIG}  already exists in the local.conf file"
fi

if [ $local_coreimadd_info -ne 0 ];then
        echo "Append ${CORE_IM_ADD} in the local.conf file"
        echo ${CORE_IM_ADD} >> conf/local.conf       
else
        echo "${CORE_IM_ADD} already exists in the local.conf file"
fi

bitbake-layers show-layers | grep "meta-raspberrypi" > /dev/null
layer_info=$?

bitbake-layers show-layers | grep "meta-python" > /dev/null
layer_python_info=$?

bitbake-layers show-layers | grep "meta-oe" > /dev/null
layer_metaoe_info=$?

bitbake-layers show-layers | grep "meta-networking" > /dev/null
layer_networking_info=$?

bitbake-layers show-layers | grep "meta-i2c" > /dev/null
layer_i2c_info=$?


bitbake-layers show-layers | grep "meta-server" > /dev/null
layer_server_info=$?

bitbake-layers show-layers | grep "meta-client" > /dev/null
layer_client_info=$?

bitbake-layers show-layers | grep "meta-spi" > /dev/null
layer_spi_info=$?

if [ $layer_metaoe_info -ne 0 ];then
    echo "Adding meta-oe layer"
	bitbake-layers add-layer ../meta-openembedded/meta-oe
else
	echo "layer meta-oe already exists"
fi


if [ $layer_python_info -ne 0 ];then
    echo "Adding meta-python layer"
	bitbake-layers add-layer ../meta-openembedded/meta-python
else
	echo "layer meta-python already exists"
fi


if [ $layer_networking_info -ne 0 ];then
    echo "Adding meta-networking layer"
	bitbake-layers add-layer ../meta-openembedded/meta-networking
else
	echo "layer meta-networking already exists"
fi


if [ $layer_info -ne 0 ];then
	echo "Adding meta-raspberrypi layer"
	bitbake-layers add-layer ../meta-raspberrypi
else
	echo "layer meta-raspberrypi already exists"
fi

if [ $layer_i2c_info -ne 0 ];then
        echo "Adding meta-i2c layer"
        bitbake-layers add-layer ../meta-i2c
else
        echo "meta-i2c layer already exists"
fi


if [ $layer_server_info -ne 0 ];then
        echo "Adding meta-server layer"
        bitbake-layers add-layer ../meta-server
else
        echo "meta-server layer already exists"
fi

if [ $layer_client_info -ne 0 ];then
        echo "Adding meta-client layer"
        bitbake-layers add-layer ../meta-client
else
        echo "meta-client layer already exists"
fi

if [ $layer_spi_info -ne 0 ];then
        echo "Adding meta-spi layer"
        bitbake-layers add-layer ../meta-spi
else
        echo "meta-spi layer already exists"
fi

bitbake-layers show-layers | grep "meta-gpio" > /dev/null
layer_info=$?

if [ $layer_info -ne 0 ];then
	echo "Adding meta-gpio layer"
	bitbake-layers add-layer ../meta-gpio
else
	echo "meta-gpio layer already exists"
fi 

set -e

bitbake core-image-base

inherit core-image
#IMAGE_INSTALL_append = " aesd-assignments"
CORE_IMAGE_EXTRA_INSTALL += " openssh"
inherit extrausers
EXTRA_USERS_PARAMS = "usermod -P root root;"


#For adding SPI support
ENABLE_SPI_BUS = " 1"
KERNEL_MODULE_AUTOLOAD:rpi += " spidev"
IMAGE_INSTALL:append = " spitools"

#For debugging support
IMAGE_INSTALL:append = " gdb gdbserver valgrind"
IMAGE_FEATURES += " src-pkgs dbg-pkgs tools-debug tools-profile eclipse-debug"

#For Bluetooth support
DISTRO_FEATURES:append = " bluetooth"
IMAGE_INSTALL:append = " obexftp bluez5"

#For CAN support 
ENABLE_CAN = " 1"
KERNEL_MODULE_AUTOLOAD:rpi += " mcp251x flexcan"
CAN_OSCILLATOR =" 8000000"

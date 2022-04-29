inherit core-image
#IMAGE_INSTALL_append = " aesd-assignments"
CORE_IMAGE_EXTRA_INSTALL += " openssh"
inherit extrausers
EXTRA_USERS_PARAMS = "usermod -P root root;"

#Adding Bluetooth support

DISTRO_FEATURES:append = \"wifi bluetooth\"
IMAGE_INSTALL:append = \"bluez5 obexftp\"



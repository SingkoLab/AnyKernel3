### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=1
do.cleanup=1
device.name1=moonstone
device.name2=sunstone
device.name3=stone
device.name4=gemstone
'; } # end properties

# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=auto;
NO_BLOCK_DISPLAY=1;
RAMDISK_COMPRESSION=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;
. tools/ak3-custom.sh;

ui_print "   _____  _______  _  _  _  _____  _______ "
ui_print "  / ____||  ___  || |/ \| ||_   _||__   __|"
ui_print "  \____ \| |___| ||  / \  |  | |     | |   "
ui_print "  ____/ /|  ___  || /   \ | _| |_    | |   "
ui_print " |_____/ |_|   |_||_|   |_||_____|   |_|   "
ui_print "-------------------------------------------"
ui_print "        sawit menyawit menjadi satu        "
ui_print "-------------------------------------------"

ui_print " "

ui_print "Patching sawit boot partition..."
# boot install
split_boot;
flash_boot;
## end boot install

ui_print "Patching sawit dtbo partition..."
# dtbo install
flash_dtbo_manual
## end dtbo install

ui_print "Patching sawit vendor_boot partition..."
# vendor_boot shell variables
BLOCK=vendor_boot;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;
check_patches;
flash_boot;
## end vendor_boot install

ui_print "Sawit installed, enjoy the Sawit feels."

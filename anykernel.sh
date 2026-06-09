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

DEVICE=$(getprop ro.product.device)
MARKET_NAME=$(getprop ro.product.vendor.marketname)

[ -z "$DEVICE" ] && DEVICE="unknown"
[ -z "$MARKET_NAME" ] && MARKET_NAME="Unknown Device"

ui_print " "
ui_print "   ███████╗██╗███╗   ██╗ ██████╗ ██╗  ██╗ ██████╗ "
ui_print "   ██╔════╝██║████╗  ██║██╔════╝ ██║ ██╔╝██╔═══██╗"
ui_print "   ███████╗██║██╔██╗ ██║██║  ███╗█████╔╝ ██║   ██║"
ui_print "   ╚════██║██║██║╚██╗██║██║   ██║██╔═██╗ ██║   ██║"
ui_print "   ███████║██║██║ ╚████║╚██████╔╝██║  ██╗╚██████╔╝"
ui_print "   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ "
ui_print " "
ui_print "              Singko Kernel"
ui_print " "
ui_print "       Device : $MARKET_NAME ($DEVICE)"
ui_print " "

# boot install
split_boot;
flash_boot;
## end boot install

# dtbo install
erase_dtbo
## end dtbo install

# vendor_boot shell variables
BLOCK=vendor_boot;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;
check_patches;
flash_boot;
## end vendor_boot install

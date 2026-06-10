### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=0
do.cleanup=1
'; } # end properties

# boot shell variables
BLOCK=boot;
IS_SLOT_DEVICE=auto;
NO_BLOCK_DISPLAY=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=auto
NO_MAGISK_CHECK=1

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

DEVICE=$(getprop ro.product.device)
MARKET_NAME=$(getprop ro.product.marketname)

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
if [ -L "/dev/block/bootdevice/by-name/init_boot_a" -o -L "/dev/block/by-name/init_boot_a" ]; then
    split_boot # for devices with init_boot ramdisk
    flash_boot # for devices with init_boot ramdisk
else
    dump_boot # use split_boot to skip ramdisk unpack, e.g. for devices with init_boot ramdisk
    write_boot # use flash_boot to skip ramdisk repack, e.g. for devices with init_boot ramdisk
fi
## end boot install

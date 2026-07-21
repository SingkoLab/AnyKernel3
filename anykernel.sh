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

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;
. tools/ak3-custom.sh;

ui_print "Ximi is bad at OSS, hope this run perfectly without Ximi cancer."

# boot install
split_boot;
inject_cmdline
flash_boot;
flash_dtbo;
## end boot install

# vendor_boot shell variables
BLOCK=vendor_boot;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;
inject_cmdline
flash_boot;
## end vendor_boot install

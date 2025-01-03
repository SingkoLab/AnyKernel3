### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=SingkoKernel by @nullptr03v2
do.devicecheck=1
device.name1=taoyao
do.cleanup=1
'; } # end properties

### AnyKernel install
# boot shell variables
block=boot;
is_slot_device=auto;
no_block_display=1;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
split_boot;
flash_boot;
#flash_dtbo;
## end boot install

# vendor_boot shell variables
#block=vendor_boot;
#is_slot_device=auto;

# reset for vendor_boot patching
#reset_ak;

# vendor_boot install
#split_boot;
#flash_boot;
## end vendor_boot install

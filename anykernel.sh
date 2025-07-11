### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=1
device.name1=moonstone
device.name2=sunstone
device.name3=stone
do.cleanup=1
'; } 

kernel_flash_dtb=no
# end properties

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
## end boot install

if [ "$kernel_flash_dtb" = "yes" ]; then
# dtbo install
flash_dtbo
## end of dtbo install
# vendor_boot shell variables
block=vendor_boot;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;
flash_boot;
## end vendor_boot install
fi

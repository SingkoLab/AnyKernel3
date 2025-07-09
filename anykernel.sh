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
## end boot install

# vendor_boot shell variables
block=vendor_boot;

# reset for vendor_boot patching
reset_ak;

# vendor_boot install
split_boot;
flash_boot;
## end vendor_boot install

# dtbo install
dd if=/dev/zero of=/dev/block/by-name/dtbo$slot conv=fsync count=1 bs=$(blockdev --getsize64 /dev/block/by-name/dtbo$slot);
## end of dtbo install

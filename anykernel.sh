### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=SingkoKernel by @nullptr03v2
do.devicecheck=1
device.name1=moonstone
device.name2=sunstone
device.name3=gemstone
device.name4=stone
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

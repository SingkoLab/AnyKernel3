### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=1
device.name1=rosemary
device.name2=begonia
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

# dtb install
# auto check the dtb & dtbo file so
# we don't need another check
if [ -f dtbo ]; then
  flash_dtbo
elif [ -f dtb ]; then
  block=vendor_boot;
  reset_ak;
  split_boot;
  flash_boot;
else
  ui_print " " "No dtb or dtbo file found. Skipping."
fi
## end dtb install

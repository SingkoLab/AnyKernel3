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
kernel_flash_dtb=no

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

# boot install
split_boot;
flash_boot;
## end boot install

# dtb install
if [ "$kernel_flash_dtb" = "yes" ]; then
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
fi
## end dtb install

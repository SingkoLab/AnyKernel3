### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# begin properties
properties() { '
kernel.string=
do.devicecheck=0
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=1
supported.versions=15 - 16
supported.patchlevels=2025-02 -
supported.vendorpatchlevels=2025-02 -
'; } # end properties

### AnyKernel install
## boot files attributes
boot_attributes() {
set_perm_recursive 0 0 755 644 $RAMDISK/*;
set_perm_recursive 0 0 750 750 $RAMDISK/init* $RAMDISK/sbin;
} # end attributes

## boot shell variables
BLOCK="/dev/block/by-name/boot"
IS_SLOT_DEVICE=auto
RAMDISK_COMPRESSION=auto
PATCH_VBMETA_FLAG=auto
NO_MAGISK_CHECK=1
NO_VBMETA_PARTITION_PATCH=1

## Linux version check
check_linux_version() {
   version_good=$(uname -r | awk '{
      split($0, version, /[.-]/);
      if (version[1] != 6) print "N";
      else if (version[2] != 6) print "N";
      else if (version[3] < 30) print "N";
      else print "Y";
    }')

    current=$(uname -r)
    ui_print "required Linux min ver: 6.6.30"
    ui_print "current Linux: $current"

    if [ "$version_good" == "N" ]; then
        abort "current linux version not match"
    fi
}

## cmd output
print_output() {
    IFS=$(printf '\n')
    eval "$1" | while read -r line; do
        ui_print "${line}"
    done
}

## is recovery
is_recovery() {
    pgrep zygote && return 1 || return 0
}

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh

# detect bootmode
is_recovery && abort "Wrong boot mode!"

# check linux version
check_linux_version

# boot install
split_boot
flash_boot
## end boot install

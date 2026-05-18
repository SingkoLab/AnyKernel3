### AnyKernel custom methods
## dereference23@github.com
## edited by nullptr@singkolab.my.id

check_patches() {
  grep -q "/vendor " /proc/mounts || mount /vendor;
  if [ $? -eq 0 ]; then
    if [ -e /vendor/lib64/hw/consumerir.default.so -o -e /vendor/lib64/hw/consumerir.holi.so ]; then
      fdtput $AKHOME/dtb /soc/spi@4a88000/irled@0 compatible ir-spi -t s;
      dtb_patched=1;
    fi;
  fi;
}

erase_dtbo() {
  dd if=/dev/zero of=/dev/block/by-name/dtbo$SLOT conv=fsync count=1 bs=$(blockdev --getsize64 /dev/block/by-name/dtbo$SLOT);
}

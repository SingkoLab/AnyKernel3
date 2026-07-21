### AnyKernel custom methods
## nullptr03@singkolab.my.id

inject_cmdline() {
  local vendor_mounted=0;
  if grep -q "/vendor " /proc/mounts; then
    vendor_mounted=1;
  else
    mount /vendor 2>/dev/null;
    if [ $? -eq 0 ]; then
      vendor_mounted=1;
    else
      for block in /dev/block/mapper/vendor$SLOT /dev/block/mapper/vendor /dev/block/by-name/vendor$SLOT /dev/block/by-name/vendor; do
        if [ -e "$block" ]; then
          mount -o ro "$block" /vendor 2>/dev/null && vendor_mounted=1 && break;
        fi;
      done;
    fi;
  fi;

  if [ "$vendor_mounted" -eq 1 ]; then
    if grep -qs displayfeature /vendor/bin/hw/vendor.qti.hardware.display.composer-service; then
      patch_cmdline kernel.xiaomi_displayfeature kernel.xiaomi_displayfeature=1
    fi;
  fi;
}

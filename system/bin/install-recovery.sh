#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:15683584:229244942a4c0e20088f019864a6300824327527; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:14813184:e243ef83bee1d5138ba4c860efdbae94d4661188 EMMC:/dev/block/bootdevice/by-name/recovery 229244942a4c0e20088f019864a6300824327527 15683584 e243ef83bee1d5138ba4c860efdbae94d4661188:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

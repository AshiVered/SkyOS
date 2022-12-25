#!/system/bin/sh

newver=`cat /system/kaios/updater.ver`
oldver=`cat /data/local/service/updater/installed/updater-*.toml | grep version | cut -f 2 -d '"'`
newer=0

IFS="." read -a v_a <<< "$newver"
IFS="." read -a v_b <<< "$oldver"

i=0
a=${v_a[$i]}
b=${v_b[$i]}
while [[ -n "$a" || -n "$b" ]]; do
  [[ -z "$a" || "$a" -gt "$b" ]] && newer=1 && break

  i=`expr $i + 1`
  a=${v_a[$i]}
  b=${v_b[$i]}
done

if [ -f /data/local/service/updater/installed ]; then
  rm -f /data/local/service/updater/installed
fi

if [ ! -f /data/local/service/updater/init -o "$newer" = "1" ]; then
  rm -f /data/local/service/updater/init
  mkdir -p /data/local/service/updater
  cp -f /system/kaios/updater-daemon /data/local/service/updater/
  cp -f /system/kaios/updater.toml /data/local/service/updater/
  chmod 755 /data/local/service/updater/updater-daemon
  touch /data/local/service/updater/init
fi
if [ -d /system/kaios/test-fixtures -a "$newer" = "1" ]; then
  cp -rf /system/kaios/test-fixtures  /data/local/service/updater/
fi
if [ -f /system/kaios/updatercmd -a "$newer" = "1" ]; then
  cp -f /system/kaios/updatercmd /data/local/service/updater/
  chmod 755 /data/local/service/updater/updatercmd
fi

exec /data/local/service/updater/updater-daemon /data/local/service/updater/updater.toml

#!/system/bin/sh
newver=`cat /system/kaios/api-daemon.ver`
oldver=`cat /data/local/service/updater/installed/api-daemon-*.toml | grep version | cut -f 2 -d '"'`
newer=0

IFS="." read -a v_a <<< "$newver"
IFS="." read -a v_b <<< "$oldver"

i=0
a=${v_a[$i]}
b=${v_b[$i]}
while [[ -n "$a" || -n "$b" ]]; do
  [[ -z "$a" ]] && a=0
  [[ -z "$b" ]] && b=0
  [[ "$a" -gt "$b" ]] && newer=1 && break
  [[ "$a" -lt "$b" ]] && break

  i=`expr $i + 1`
  a=${v_a[$i]}
  b=${v_b[$i]}
done

SERVICE_DIR=/data/local/service
API_DAEMON_DIR=${SERVICE_DIR}/api-daemon
API_REMOTE_DIR=${API_DAEMON_DIR}/remote

if [ ! -f ${API_DAEMON_DIR}/init -o "$newer" = "1" ]; then
  rm -f ${API_DAEMON_DIR}/init
  rm -f ${SERVICE_DIR}/updater/installed/api-daemon-*.toml
  mkdir -p ${API_DAEMON_DIR}
  cp -rf /system/kaios/http_root ${API_DAEMON_DIR}
  cp -f /system/kaios/api-daemon ${API_DAEMON_DIR}
  cp -f /system/kaios/config.toml ${API_DAEMON_DIR}
  [ -n "$oldver" ] && cp -f /system/kaios/updater/installed/api-daemon-*.toml ${SERVICE_DIR}/updater/installed
  touch ${API_DAEMON_DIR}/init
fi

if [ ! -d ${API_REMOTE_DIR} ]; then
  mkdir -p ${API_REMOTE_DIR}
  chmod 755 ${SERVICE_DIR}
  chmod 755 ${API_DAEMON_DIR}
  chmod 755 ${API_REMOTE_DIR}
fi

exec ${API_DAEMON_DIR}/api-daemon ${API_DAEMON_DIR}/config.toml

#!/bin/sh
source /koolshare/scripts/base.sh

PORT=19290
MODULE_SLUG=betterapps
APP_NAME=BetterApps

remove_iptables_rule(){
	while iptables -t filter -D INPUT -p tcp --dport "${PORT}" -j ACCEPT >/dev/null 2>&1; do
		:
	done
}

cd /tmp || exit 1
killall ${APP_NAME} >/dev/null 2>&1
killall kaiplus_bin >/dev/null 2>&1
remove_iptables_rule

rm -f /koolshare/init.d/S99${APP_NAME}.sh
rm -f /koolshare/init.d/N99${APP_NAME}.sh
rm -f /koolshare/init.d/S99${MODULE_SLUG}.sh
rm -f /koolshare/init.d/N99${MODULE_SLUG}.sh
rm -rf /koolshare/bin/${APP_NAME}
rm -rf /koolshare/res/icon-betterapps.png
rm -rf /koolshare/res/icon-BetterApps.png
rm -f /koolshare/scripts/${APP_NAME}_config.sh
rm -f /koolshare/scripts/${APP_NAME}_status.sh
rm -rf /koolshare/webs/Module_${APP_NAME}.asp
rm -f /koolshare/scripts/uninstall_betterapps.sh
rm -f /koolshare/scripts/uninstall_BetterApps.sh
rm -rf /koolshare/${APP_NAME}
rm -rf /tmp/${MODULE_SLUG}* /tmp/${APP_NAME}*

dbus remove BetterApps_enable
dbus remove BetterApps_version
dbus remove betterapps_enable
dbus remove betterapps_version
dbus remove softcenter_module_betterapps_version
dbus remove softcenter_module_betterapps_install
dbus remove softcenter_module_betterapps_name
dbus remove softcenter_module_betterapps_title
dbus remove softcenter_module_betterapps_description
dbus remove softcenter_module_BetterApps_version
dbus remove softcenter_module_BetterApps_install
dbus remove softcenter_module_BetterApps_name
dbus remove softcenter_module_BetterApps_title
dbus remove softcenter_module_BetterApps_description

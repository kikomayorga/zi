#!/bin/sh

busyflag=`cat /tmp/zi/busyflag`

if [ "$busyflag" = "0" ]
then
	#forward to lua

	#when running on ubuntu
	#lua ~/Documents/zi/zi.lua key 1 $lkchain

	#when deploy on openwrt:
	lua /etc/zi/zi.lua key backspace $lkchain
fi

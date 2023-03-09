#!/bin/sh

busyflag=`cat /tmp/zi/busyflag`

if [ "$busyflag" = "0" ]
then
	#forward to lua

	#when running on ubuntu
	#lua ~/Documents/zi/zi.lua key 1 $lkchain

	#when deploy on openwrt:
	cd /etc/zi && lua zi.lua key dot 1111
fi

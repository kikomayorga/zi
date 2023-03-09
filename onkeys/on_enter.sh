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
	cd /etc/zi && lua zi.lua key enter 11111


fi

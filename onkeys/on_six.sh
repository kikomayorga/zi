#!/bin/sh

busyflag=`cat /tmp/zi/busyflag`
# busyflag='cat /tmp/busyflag' 


if [ "$busyflag" = "0" ]
then
	#read from temporary file
	lkchain_old=`cat /tmp/zi/last4keys`
	echo oldchain: $lkchain_old

	#put new key before
	lkchain="${lkchain_old:1:4}""6"
	echo newchain: $lkchain

	#save into temporary file
	echo $lkchain > /tmp/zi/last4keys

	#forward to lua

	#when running on ubuntu
	#lua ~/Documents/zi/zi.lua key 1 $lkchain

	#when deploy on openwrt:
	cd /etc/zi && lua zi.lua key 6 $lkchain

fi

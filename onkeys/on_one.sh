#!/bin/sh

busyflag=`cat /tmp/zi/busyflag`
skippableflag=`cat /tmp/zi/skippableflag`

#read from temporary file
lkchain_old=`cat /tmp/zi/last4keys`
echo oldchain: $lkchain_old


if [ "$busyflag" = "0" ]
then
	#put new key before
	lkchain="${lkchain_old:1:4}""1"
	echo newchain: $lkchain

	#save into temporary file
	echo $lkchain > /tmp/zi/last4keys

	#forward to lua

	#when running on ubuntu
	#lua ~/Documents/zi/zi.lua key 1 $lkchain

	#when deploy on openwrt:
	cd /etc/zi && lua zi.lua key 1 $lkchain

fi

if [ "$busyflag" = "1" ] && [ "$skippableflag" = "1" ]
then 
	mpg123 /etc/zi/sounds/keypress.mp3
	#kill current audio and process
	killall aplay
	killall sh
 	killall lua
	echo aaaa > /tmp/zi/last4keys
	sleep 2
	cd /etc/zi && lua zi.lua key 1 $lkchain
fi


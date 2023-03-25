#!/bin/sh

busyflag=`cat /tmp/zi/busyflag`
skippableflag=`cat /tmp/zi/skippableflag`

#read from temporary file
lkchain_old=`cat /tmp/zi/last4keys`
echo oldchain: $lkchain_old

#put new key before
lkchain="${lkchain_old:1:4}""1"
echo newchain: $lkchain

if [ "$busyflag" = "0" ]
then

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
	mpg123 /etc/zi/sounds/click.mp3
	#kill current audio and process
	killall -q aplay &
	killall -q lua
	sleep 1
	echo 0000 > /tmp/zi/last4keys
	echo 0 > /tmp/zi/busyflag
	echo 0 > /tmp/zi/skippableflag
	cd /etc/zi && lua zi.lua key 1 0000
fi


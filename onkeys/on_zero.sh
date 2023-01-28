#!/bin/sh
#
# on_one
#
# - shift 4 keys buffer
# - put "1" in latest buffer slot
# 

dialogueflag=`cat /tmp/zi/dialogueflag`

if [ "$dialogueflag" = "0" ]
then
	#read from temporary file
	lkchain_old=`cat /tmp/zi/last4keys`
	echo oldchain: $lkchain_old

	#put new key before
	lkchain="${lkchain_old:1:4}""0"
	echo newchain: $lkchain

	#save into temporary file
	echo $lkchain > /tmp/zi/last4keys

	#call script onke.sh
	sh /etc/zi/onkeys/onkeys.sh
fi

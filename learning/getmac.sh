#!/bin/sh

#usage
# sh getmac.sh d03
mac=`grep $1 /etc/zi/learning/n2mac`
mac=$(echo $mac | awk '{print $2}')
echo $mac


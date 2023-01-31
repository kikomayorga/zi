#!/bin/sh

#usage:
# sh indirect.sh d01 P1 

device_arg=`grep $1 /etc/zi/config`
device_arg=$(echo $device_arg | awk '{print $2}')
echo device_arg: ; echo $device_arg

policy_arg=`grep $2 /etc/zi/config`
policy_arg=$(echo $policy_arg | awk '{print $2}')
echo policy_arg: ; echo $policy_arg

command="uci set safedns.'$device_arg'.token='$policy_arg'"
echo $command

#!/bin/sh

saldo1=`cat /etc/zi/timers/saldo1`
saldo2=`cat /etc/zi/timers/saldo2`
saldo3=`cat /etc/zi/timers/saldo3`
saldo4=`cat /etc/zi/timers/saldo4`
saldo5=`cat /etc/zi/timers/saldo5`
saldo6=`cat /etc/zi/timers/saldo6`

saldo1=$(($saldo1 + 60))
saldo2=$(($saldo2 + 60))
saldo3=$(($saldo3 + 60))
saldo4=$(($saldo4 + 60))
saldo5=$(($saldo5 + 60))
saldo6=$(($saldo6 + 60))

echo $saldo1 > /etc/zi/timers/saldo1
echo $saldo2 > /etc/zi/timers/saldo2
echo $saldo3 > /etc/zi/timers/saldo3
echo $saldo4 > /etc/zi/timers/saldo4
echo $saldo5 > /etc/zi/timers/saldo5
echo $saldo6 > /etc/zi/timers/saldo6


#echo 180 > /etc/zi/timers/saldo2
#echo 180 > /etc/zi/timers/saldo3
#echo 180 > /etc/zi/timers/saldo4
#echo 180 > /etc/zi/timers/saldo5
#echo 180 > /etc/zi/timers/saldo6


#!/bin/sh

running1=`cat /etc/zi/timers/running1`
running2=`cat /etc/zi/timers/running2`
running3=`cat /etc/zi/timers/running3`
running4=`cat /etc/zi/timers/running4`
running5=`cat /etc/zi/timers/running5`
running6=`cat /etc/zi/timers/running6`

saldo1=`cat /etc/zi/timers/saldo1`
saldo2=`cat /etc/zi/timers/saldo2`
saldo3=`cat /etc/zi/timers/saldo3`
saldo4=`cat /etc/zi/timers/saldo4`
saldo5=`cat /etc/zi/timers/saldo5`
saldo6=`cat /etc/zi/timers/saldo6`

echo "| Running status 1: $running1 | Saldo usuario 1: $saldo1    |"
echo "| Running status 2: $running2 | Saldo usuario 2: $saldo2    |"
echo "| Running status 3: $running3 | Saldo usuario 3: $saldo3    |"
echo "| Running status 4: $running4 | Saldo usuario 4: $saldo4    |"
echo "| Running status 5: $running5 | Saldo usuario 5: $saldo5    |"
echo "| Running status 6: $running6 | Saldo usuario 6: $saldo6    |"


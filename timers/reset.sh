#!/bin/sh

echo 180 > /etc/zi/timers/saldo1
echo 180 > /etc/zi/timers/saldo2
echo 180 > /etc/zi/timers/saldo3
echo 180 > /etc/zi/timers/saldo4
echo 180 > /etc/zi/timers/saldo5
echo 180 > /etc/zi/timers/saldo6

#TODO : is it ok to kill all of the cnnections at 12pm?
echo 0 > /etc/zi/timers/running1
echo 0 > /etc/zi/timers/running2
echo 0 > /etc/zi/timers/running3
echo 0 > /etc/zi/timers/running4
echo 0 > /etc/zi/timers/running5
echo 0 > /etc/zi/timers/running6

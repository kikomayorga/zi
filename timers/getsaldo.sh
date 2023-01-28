#!/bin/sh

#make some noise
mpg123 /etc/zi/sounds/keypress.mp3

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

echo "Saldo usuario 1: $saldo1"




pico2wave -w /tmp/saldos.wav -l es-ES "Saldos. Isa. $saldo1 minutos. Sofi. $saldo2 minutos. Saldo Gabriel: Pronto... Etcetera."
aplay -q -f S16_LE -D plughw:0,0 /tmp/saldos.wav

# sleep 2
# mpg123 /etc/zi/sounds/aplausos.mp3 &



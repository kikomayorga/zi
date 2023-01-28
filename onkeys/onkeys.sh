#!/bin/sh

#make some noise
mpg123 /etc/zi/sounds/keypress.mp3 &

#read from temporary file
lkchain=`cat /tmp/zi/last4keys`
echo currentchain: $lkchain

#usuario1
if [ $lkchain -eq "1310" ]
then	
	echo "id validado"
        mpg123 /etc/zi/sounds/success.mp3
	
	# set dialogue flag
        echo 1 > /tmp/zi/dialogueflag


        running1=`cat /etc/zi/timers/var/running1`
	saldo1=`cat /etc/zi/timers/var/saldo1`

	if [ $running1 == "1" ]
        then
		sh /etc/zi/timers/pause1.sh
                sleep 0.1
		pico2wave -w /tmp/pause1.wav -l es-ES "Usuario 1. Pausa de internet. Aun tienes $saldo1 minutos."
		aplay -q -f S16_LE -D plughw:0,0 /tmp/pause1.wav
                # sleep 2
                mpg123 /etc/zi/sounds/aplausos.mp3

	else
		if [ $saldo1 -gt "0" ] 
		then
		    sh /etc/zi/timers/run1.sh
                    sleep 0.1
 		    pico2wave -w /tmp/run1.wav -l es-ES "Usuario 1. Navega. Te quedan $saldo1 minutos."
                    aplay -q -f S16_LE -D plughw:0,0 /tmp/run1.wav 
                    # sleep 2
                    mpg123 /etc/zi/sounds/ticktack.mp3
		else
		    pico2wave -w /tmp/tomorrow1.wav -l es-ES "Usuario 1. No te quedan minutos hoy."
                    aplay -q -f S16_LE -D plughw:0,0 /tmp/tomorrow1.wav 
                    # sleep 2
                    mpg123 /etc/zi/sounds/ticktack.mp3
		fi
	fi

        #reiniciamos el servicio para grabar los cambios
        /etc/init.d/safedns restart
fi

#usuario2
if [ $lkchain -eq "1358" ]
then
        echo "id validado"
	mpg123 /etc/zi/sounds/success.mp3

        # set dialogue flag
        echo 1 > /tmp/zi/dialogueflag

        running2=`cat /etc/zi/timers/var/running2`
        saldo2=`cat /etc/zi/timers/var/saldo2`

        if [ $running2 == "1" ]
        then
		sh /etc/zi/timers/pause2.sh
                sleep 0.1
                pico2wave -w /tmp/pause2.wav -l es-ES "Usuario 2. Pausa de internet. Aun tienes $saldo2 minutos."
                aplay -q -f S16_LE -D plughw:0,0 /tmp/pause2.wav
                # sleep 2
                mpg123 /etc/zi/sounds/aplausos.mp3

        else
                if [ $saldo2 -gt "0" ]
                then
                    sh /etc/zi/timers/run2.sh
                    sleep 0.1
                    pico2wave -w /tmp/run2.wav -l es-ES "Usuario 2. Navega. Te quedan $saldo2 minutos."
                    aplay -q -f S16_LE -D plughw:0,0 /tmp/run2.wav
                    # sleep 2
                    mpg123 /etc/zi/sounds/ticktack.mp3
                else
                    pico2wave -w /tmp/tomorrow2.wav -l es-ES "Usuario 2. No te quedan minutos hoy."
                    aplay -q -f S16_LE -D plughw:0,0 /tmp/tomorrow2.wav
                    # sleep 2
                    mpg123 /etc/zi/sounds/ticktack.mp3
                fi
        fi

        #reiniciamos el servicio para grabar los cambios
        /etc/init.d/safedns restart
fi

#superusuario_reset_pass
if [ $lkchain -eq "6660" ]
then

        # set dialogue flag
        echo 1 > /tmp/zi/dialogueflag

        echo "supersuaurio validado"
        mpg123 /etc/zi/sounds/alarma.mp3
	sh /etc/zi/timers/reset.sh       
        pico2wave -w /tmp/voz.wav -l es-ES "Se ha agregado 60 minuts a cada usuario."
        aplay -q -f S16_LE -D plughw:0,0 /tmp/voz.wav

fi

# reset dialogue flag
echo 0 > /tmp/zi/dialogueflag

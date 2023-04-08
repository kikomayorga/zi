#!/bin/sh 

if [[ $2 == "AP-STA-CONNECTED" ]]
then
  echo "someone has connected with mac id $3 on $1"
fi

if [[ $2 == "AP-STA-DISCONNECTED" ]]
then 
  echo "someone has disconnected with mac id $3 on $1"
fi

cd /etc/zi/ && lua zi.lua hostapd $1 $2 $3


# how it went before:

# mac_u1d1=`uci get safedns.cfg038c89.mac`

# mac_u1d1=`echo $mac_u1d1 | tr '[A-Z]' '[a-z]'`

# before

# if [[ $2 == "AP-STA-CONNECTED" ]]
# then
#   echo "someone has connected with mac id $3 on $1"
# fi

# if [[ $2 == "AP-STA-DISCONNECTED" ]]
# then
#   echo "someone has disconnected with mac id $3 on $1"

#  if [[ $3 == $mac_u4d1 ]]; then sh /etc/zi/timers/pause4.sh && echo "Pausa a Usuario 4 Dispositivo 1"; fi

#Reiniciamos el servicio para grabar los cambios
#  /etc/init.d/safedns restart
# fi


# if [[ $2 == "AP-STA-DISCONNECTED" ]]
# then
#   echo "avisamos de la pausa..."

#   if [ "$3" = "$mac_u1d1" ] || [ "$3" = "$mac_u1d2" ] || [ "$3" = "$mac_u1d3"  ]
#   then
#     mpg123 /etc/zi/sounds/success.mp3
#     pico2wave -w /tmp/voz.wav -l es-ES "Isa. Se ha desconectado uno de tus dispositivos. Estas en pausa."
#     aplay -q -f S16_LE -D plughw:0,0 /tmp/voz.wav
#     mpg123 /etc/zi/sounds/aplausos.mp3 &
#   fi 

#   if [ "$3" = "$mac_u2d1" ] || [ "$3" = "$mac_u2d2" ] || [ "$3" = "$mac_u2d3"  ]
#   then
#     mpg123 /etc/zi/sounds/success.mp3
#     pico2wave -w /tmp/voz.wav -l es-ES "Sofi. Se ha desconectado uno de tus dispositivos. Estas en pausa."
#     aplay -q -f S16_LE -D plughw:0,0 /tmp/voz.wav
#     mpg123 /etc/zi/sounds/aplausos.mp3 &
#   fi

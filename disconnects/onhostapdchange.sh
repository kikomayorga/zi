#!/bin/sh 

mac_u1d1=`uci get safedns.cfg038c89.mac`
mac_u1d2=`uci get safedns.cfg048c89.mac`
mac_u1d3=`uci get safedns.cfg058c89.mac`

mac_u2d1=`uci get safedns.cfg068c89.mac`
mac_u2d2=`uci get safedns.cfg078c89.mac`
mac_u2d3=`uci get safedns.cfg088c89.mac`

mac_u3d1=`uci get safedns.cfg098c89.mac`
mac_u3d2=`uci get safedns.cfg0a8c89.mac`
mac_u3d3=`uci get safedns.cfg0b8c89.mac`

mac_u4d1=`uci get safedns.cfg0c8c89.mac`
mac_u4d2=`uci get safedns.cfg0d8c89.mac`
mac_u4d3=`uci get safedns.cfg0e8c89.mac`

mac_u5d1=`uci get safedns.cfg0f8c89.mac`
mac_u5d2=`uci get safedns.cfg108c89.mac`
mac_u5d3=`uci get safedns.cfg118c89.mac`

mac_u6d1=`uci get safedns.cfg128c89.mac`
mac_u6d2=`uci get safedns.cfg138c89.mac`
mac_u6d3=`uci get safedns.cfg148c89.mac`

mac_u1d1=`echo $mac_u1d1 | tr '[A-Z]' '[a-z]'`
mac_u1d2=`echo $mac_u1d2 | tr '[A-Z]' '[a-z]'`
mac_u1d3=`echo $mac_u1d3 | tr '[A-Z]' '[a-z]'`
mac_u2d1=`echo $mac_u2d1 | tr '[A-Z]' '[a-z]'`
mac_u2d2=`echo $mac_u2d2 | tr '[A-Z]' '[a-z]'`
mac_u2d3=`echo $mac_u2d3 | tr '[A-Z]' '[a-z]'`
mac_u3d1=`echo $mac_u3d1 | tr '[A-Z]' '[a-z]'`
mac_u3d2=`echo $mac_u3d2 | tr '[A-Z]' '[a-z]'`
mac_u3d3=`echo $mac_u3d3 | tr '[A-Z]' '[a-z]'`
mac_u4d1=`echo $mac_u4d1 | tr '[A-Z]' '[a-z]'`
mac_u4d2=`echo $mac_u4d2 | tr '[A-Z]' '[a-z]'`
mac_u4d3=`echo $mac_u4d3 | tr '[A-Z]' '[a-z]'`
mac_u5d1=`echo $mac_u5d1 | tr '[A-Z]' '[a-z]'`
mac_u5d2=`echo $mac_u5d2 | tr '[A-Z]' '[a-z]'`
mac_u5d3=`echo $mac_u5d3 | tr '[A-Z]' '[a-z]'`
mac_u6d1=`echo $mac_u6d1 | tr '[A-Z]' '[a-z]'`
mac_u6d2=`echo $mac_u6d2 | tr '[A-Z]' '[a-z]'`
mac_u6d3=`echo $mac_u6d3 | tr '[A-Z]' '[a-z]'`




if [[ $2 == "AP-STA-CONNECTED" ]]
then
  echo "someone has connected with mac id $3 on $1"
fi

if [[ $2 == "AP-STA-DISCONNECTED" ]]
then
  echo "someone has disconnected with mac id $3 on $1"

  if [ "$3" = "$mac_u1d1" ]; then sh /etc/zi/timers/pause1.sh && echo "Pausa a Usuario 1 Dispositivo 1"; fi
  if [ "$3" = "$mac_u1d2" ]; then sh /etc/zi/timers/pause1.sh && echo "Pausa a Usuario 1 Dispositivo 2"; fi
  if [ "$3" = "$mac_u1d3" ]; then sh /etc/zi/timers/pause1.sh && echo "Pausa a Usuario 1 Dispositivo 3"; fi

  if [ $3 = $mac_u2d1 ]; then sh /etc/zi/timers/pause2.sh && echo "Pausa a Usuario 2 Dispositivo 1"; fi
  if [ $3 = $mac_u2d2 ]; then sh /etc/zi/timers/pause2.sh && echo "Pausa a Usuario 2 Dispositivo 2"; fi
  if [ $3 = $mac_u2d3 ]; then sh /etc/zi/timers/pause2.sh && echo "Pausa a Usuario 2 Dispositivo 3"; fi

  if [ "$3" = "$mac_u3d1" ]; then sh /etc/zi/timers/pause3.sh && echo "Pausa a Usuario 3 Dispositivo 1"; fi
  if [ "$3" = "$mac_u3d2" ]; then sh /etc/zi/timers/pause3.sh && echo "Pausa a Usuario 3 Dispositivo 2"; fi
  if [ "$3" = "$mac_u3d3" ]; then sh /etc/zi/timers/pause3.sh && echo "Pausa a Usuario 3 Dispositivo 3"; fi

 if [[ $3 == $mac_u4d1 ]]; then sh /etc/zi/timers/pause4.sh && echo "Pausa a Usuario 4 Dispositivo 1"; fi
 if [[ $3 == $mac_u4d2 ]]; then sh /etc/zi/timers/pause4.sh && echo "Pausa a Usuario 4 Dispositivo 2"; fi
 if [[ $3 == $mac_u4d3 ]]; then sh /etc/zi/timers/pause4.sh && echo "Pausa a Usuario 4 Dispositivo 3"; fi

 if [[ $3 == $mac_u5d1 ]]; then sh /etc/zi/timers/pause5.sh && echo "Pausa a Usuario 5 Dispositivo 1"; fi
 if [[ $3 == $mac_u5d2 ]]; then sh /etc/zi/timers/pause5.sh && echo "Pausa a Usuario 5 Dispositivo 2"; fi
 if [[ $3 == $mac_u5d3 ]]; then sh /etc/zi/timers/pause5.sh && echo "Pausa a Usuario 5 Dispositivo 3"; fi

 if [[ $3 == $mac_u6d1 ]]; then sh /etc/zi/timers/pause6.sh && echo "Pausa a Usuario 6 Dispositivo 1"; fi
 if [[ $3 == $mac_u6d2 ]]; then sh /etc/zi/timers/pause6.sh && echo "Pausa a Usuario 6 Dispositivo 2"; fi
 if [[ $3 == $mac_u6d3 ]]; then sh /etc/zi/timers/pause6.sh && echo "Pausa a Usuario 6 Dispositivo 3"; fi

  #Reiniciamos el servicio para grabar los cambios
  /etc/init.d/safedns restart
fi


if [[ $2 == "AP-STA-DISCONNECTED" ]]
then
  echo "avisamos de la pausa..."

  if [ "$3" = "$mac_u1d1" ] || [ "$3" = "$mac_u1d2" ] || [ "$3" = "$mac_u1d3"  ]
  then
    mpg123 /etc/zi/sounds/success.mp3
    pico2wave -w /tmp/voz.wav -l es-ES "Isa. Se ha desconectado uno de tus dispositivos. Estas en pausa."
    aplay -q -f S16_LE -D plughw:0,0 /tmp/voz.wav
    mpg123 /etc/zi/sounds/aplausos.mp3 &
  fi 

  if [ "$3" = "$mac_u2d1" ] || [ "$3" = "$mac_u2d2" ] || [ "$3" = "$mac_u2d3"  ]
  then
    mpg123 /etc/zi/sounds/success.mp3
    pico2wave -w /tmp/voz.wav -l es-ES "Sofi. Se ha desconectado uno de tus dispositivos. Estas en pausa."
    aplay -q -f S16_LE -D plughw:0,0 /tmp/voz.wav
    mpg123 /etc/zi/sounds/aplausos.mp3 &
  fi

  if [ "$3" = "$mac_u3d1" ] || [ "$3" = "$mac_u3d2" ] || [ "$3" = "$mac_u3d3" ]
  then
    mpg123 /etc/zi/sounds/success.mp3
    pico2wave -w /tmp/voz.wav -l es-ES "Gabriel. Se ha desconectado uno de tus dispositivos. Estas en pausa."
    aplay -q -f S16_LE -D plughw:0,0 /tmp/voz.wav
    mpg123 /etc/zi/sounds/aplausos.mp3 &
  fi

fi

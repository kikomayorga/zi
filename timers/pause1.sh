#!/bin/sh

#ponemos la variable runningN a cero
echo 0 > /etc/zi/timers/var/running1

#ponemos al usuario N en politica 1 (Default = bloqueado)
sh /etc/zi/safedns/u1p1.sh
 

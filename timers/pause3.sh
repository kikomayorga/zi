#!/bin/sh

#ponemos la variable runningN a cero
echo 0 > /etc/zi/timers/running3

#ponemos al usuario N en politica 1 (Default = bloqueado)
sh /etc/zi/safedns/u3p1.sh
 

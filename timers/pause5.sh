#!/bin/sh

#ponemos la variable runningN a cero
echo 0 > /etc/zi/timers/running5

#ponemos al usuario N en politica 1 (Default = bloqueado)
sh /etc/zi/safedns/u5p1.sh
 

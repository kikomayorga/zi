#!/bin/sh

offset=3
j=`expr $1 + $offset`
j=`printf "%02x\n" $j`
echo cfg"$j"8c89
# cfg 03 8c89


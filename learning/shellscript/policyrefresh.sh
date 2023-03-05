#!/bin/sh

#usage
# sh refreshsafedns.sh U0 1 
# inputNo=5   ; printf -v inputNo "%02d" $inputNo ; echo $inputNo

for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
do
    offset=3
    j=`expr $i + $offset`
    j=`printf "%02x\n" $j`
    echo cfg"$j"8c89
    # cfg 03 8c89
done


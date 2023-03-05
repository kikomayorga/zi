#!/bin/sh

# uso:
# sh read.sh $1 $2 
# $1 disposistivo {d00..d31},  usuario, $3 tipo

line=`grep $1 /etc/zi/learning/devicetable`
e1_devc=$(echo $line | awk '{print $1}')
e2_maca=$(echo $line | awk '{print $2}')
e3_user=$(echo $line | awk '{print $3}')
e4_type=$(echo $line | awk '{print $4}')

# echo $e1_devc 
# echo $e2_maca
echo $e3_user
echo $e4_type

# policy_arg=$(echo $policy_arg | awk '{print $2}'

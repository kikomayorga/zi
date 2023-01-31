#!/bin/sh

# uso:
# sh write.sh $1 $2 
# $1 es dispoaitivo
# $2 es columna
# $3 es valor

# $1 !disposistivo {d00..d31}, $2 usuario {u1..u6}, $3 tipo {nuevo, permenente, temporal}
# temporal se re setea a las 12pm o se solicita por admin o duenho"

# line=`grep i--invert-match $1 /etc/zi/learning/devicetable`
echo !!nothing > devicetable_test

grep --invert-match $1 /etc/zi/learning/devicetable | while read -r line ; do
    # echo "Processing $line" 
    echo $line >> devicetable_test
done

grep $1 /etc/zi/learning/devicetable | while read -r line ; do
    e1_devc=$(echo $line | awk '{print $1}')
    e2_maca=$(echo $line | awk '{print $2}')
    e3_user=$(echo $line | awk '{print $3}')
    e4_type=$(echo $line | awk '{print $4}')
    echo $e1_devc $e2_maca $e3_user $e4_type >> devicetable_test 
done

# if $2 -eq ""



echo $e1_devc 
echo $e2_maca
echo $e3_user
echo $e4_type


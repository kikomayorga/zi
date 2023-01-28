#!/bin/sh
#
# on_one
#
# - shift 4 keys buffer
# - put "1" in latest buffer slot
# 
#
lk4=$lk3
lk3=$lk2
lk2=$lk1
lk1="3"

export lk1
export lk2
export lk3
export lk4

echo lk1: $lk1
echo lk2: $lk2
echo lk3: $lk3
echo lk4: $lk4

lkchain="$lk1""$lk2""$lk3""$lk4"
export lkchain
echo lkchain: $lkchain
echo "aqui hacemos echo nomas"

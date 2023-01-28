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
lk1="a"

export lk1
export lk2
export lk3
export lk4

echo lk_1: $lk1
echo lk_2: $lk2
echo lk_3: $lk3
echo lk_4: $lk4

#lk_chain="$lk1""$lk2""$lk3""$lk4"
lk_chain="$lk1""$lk1"
export lk_chain
echo lkchain: $lk_chain
echo "aqui hacemos echo nomas"

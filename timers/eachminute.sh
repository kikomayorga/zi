#/bin/sh

#leemos todos los saldos a variables
saldo1=`cat /etc/zi/timers/saldo1`
saldo2=`cat /etc/zi/timers/saldo2`
saldo3=`cat /etc/zi/timers/saldo3`
saldo4=`cat /etc/zi/timers/saldo4`
saldo5=`cat /etc/zi/timers/saldo5`
saldo6=`cat /etc/zi/timers/saldo6`


#leemos todso los status running a variables
running1=`cat /etc/zi/timers/running1`
running2=`cat /etc/zi/timers/running2`
running3=`cat /etc/zi/timers/running3`
running4=`cat /etc/zi/timers/running4`
running5=`cat /etc/zi/timers/running5`
running6=`cat /etc/zi/timers/running6`

#decrementamos
if [ $running1 -eq "1" ]; then 	let saldo1--; fi 
if [ $running2 -eq "1" ]; then  let saldo2--; fi
if [ $running3 -eq "1" ]; then  let saldo3--; fi
if [ $running4 -eq "1" ]; then  let saldo4--; fi
if [ $running5 -eq "1" ]; then  let saldo5--; fi
if [ $running6 -eq "1" ]; then  let saldo6--; fi

#cero es el mÃInimo para saldo
if [ $saldo1 -eq "-1" ]; then saldo1=0; fi
if [ $saldo2 -eq "-1" ]; then saldo2=0; fi
if [ $saldo3 -eq "-1" ]; then saldo3=0; fi
if [ $saldo4 -eq "-1" ]; then saldo4=0; fi
if [ $saldo5 -eq "-1" ]; then saldo5=0; fi
if [ $saldo6 -eq "-1" ]; then saldo6=0; fi


#si estA corriendo y estA en saldo cero, deja de running
# TODO: llamar a fw: se acabO el tiempo
if [ $saldo1 -eq "0" ] && [ $running1 -eq "1" ]; then running1=0; fi
if [ $saldo2 -eq "0" ] && [ $running2 -eq "1" ]; then running2=0; fi
if [ $saldo3 -eq "0" ] && [ $running3 -eq "1" ]; then running3=0; fi
if [ $saldo4 -eq "0" ] && [ $running4 -eq "1" ]; then running4=0; fi
if [ $saldo5 -eq "0" ] && [ $running5 -eq "1" ]; then running5=0; fi
if [ $saldo6 -eq "0" ] && [ $running6 -eq "1" ]; then running6=0; fi

#escribimos todos los saldos:
echo $saldo1 > /etc/zi/timers/saldo1
echo $saldo2 > /etc/zi/timers/saldo2
echo $saldo3 > /etc/zi/timers/saldo3
echo $saldo4 > /etc/zi/timers/saldo4
echo $saldo5 > /etc/zi/timers/saldo5
echo $saldo6 > /etc/zi/timers/saldo6

#escribimos todos los running statuses: 
echo $running1 > /etc/zi/timers/running1
echo $running2 > /etc/zi/timers/running2
echo $running3 > /etc/zi/timers/running3
echo $running4 > /etc/zi/timers/running4
echo $running5 > /etc/zi/timers/running5
echo $running6 > /etc/zi/timers/running6


#printout
echo "running1: ${running1} || nuevo saldo1: ${saldo1}"


#!/bin/bash

count=1
## initilization
function initialization() {
echo "enter the lower limit"
read lowerNumber
echo "enter the upper limit"
read upperNumber
checkPrime "$lowerNumber" "$upperNumber"
}

## first  prime numbers between 700 and 900

function checkPrime() {

lowerLimit=$1
upperLimit=$2

   for((i=lowerLimit; i<=upperLimit; i++))
   do
      flag=0
      for (( j=2; j<i; j++ ))
      do
         if [ $((i%j)) -eq 0 ]
         then
            flag=1
            break
         fi
      done
      if [ $flag -eq 0 ]
      then
			temp[count]=$i
			((count++))
      fi
   done
storeInArray "${temp[@]}"
}
function storeInArray() {

   echo "the prime numbers between 700 to 900 in reverse are "
   array=("${@}")
   for((k=count; k>=1; k--))
   do
      echo "${array[k]}"
   done

}
function mainMethod() {
initialization;
}
mainMethod;



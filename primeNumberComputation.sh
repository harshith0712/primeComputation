#!/bin/bash

## initilization
function initialization() {
echo "enter the limit"
read number
checkPrime $((number))
}
count=1

function checkPrime() {

limit=$1
i=2

## the first Hundred prime numbers are 

	while [ $count -le $limit ]
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
		((i++))
   done
storeInArray "${temp[@]}"

}

function storeInArray() {

	echo "the hundred prime numbers in reverse are "
	array=("$@")
	for((k=count; k>=1; k--))
	do
		echo "${array[k]}"
	done

}
function mainMethod() {
initialization;
}
mainMethod;


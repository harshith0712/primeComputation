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
checkUnitsPlace "${temp[@]}"
}

function checkUnitsPlace() {
unit=("${@}")
count1=1
	for ((k=1; k<=count; k++))
	do
		if [ $((unit[k]%10)) -eq 1 ]
		then
			temp1[count1]=${unit[k]}
			((count1++))
		fi
	done
storeInArray "${temp1[@]}"
}

function storeInArray() {
echo "first hundred prime whose unit is one are "
array=("${@}")
echo ${array[@]}
}
function mainMethod() {
initialization;
}
mainMethod;

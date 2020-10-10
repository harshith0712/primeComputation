#!/bin/bash

echo "Welcome to Prime Numbers Computation"

count=1
## initilization
function initialization() {
echo "enter the lower limit"
read lowerNumber
echo "enter the upper limit"
read upperNumber
checkPrime "$lowerNumber" "$upperNumber"
}

## first  prime numbers between lowerlimit to upperlimit

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
palindrome "${temp[@]}"
checkUnitsPlace "${temp[@]}"
}
function palindrome() {
## palindromes in 200 primes
Palindrome=$1
reverse=0
count1=1
   if [ $((Palindrome%10)) -ne $Palindrome ]
   then
      while [ $Palindrome -gt 0 ]
         do
            remainder=$(($Palindrome%10))
            reverse=$(($reverse * 10))
            reverse=$(($reverse + $remainder))
            Palindrome=$(($Palindrome/10))
         done
         if [ $1 -eq $reverse ]
         then
           temp1[count1]=$1
            ((count1++))
         fi
   fi
storeInArray "${temp1[@]}"
}

function checkUnitsPlace() {
unit=("${@}")
count2=1
	for ((k=1; k<=count; k++))
	do
		if [ $((unit[k]%10)) -eq 1 ]
		then
			temp2[count2]=${unit[k]}
			((count2++))
		fi
	done
storeInArray "${temp2[@]}"
}

function storeInArray() {

   echo "the prime numbers between $lowerLimit to $upperLimit in reverse are "
   array=("${@}")
   for((k=count; k>=1; k--))
   do
      echo "${array[k]}"
   done

}
function mainMethod() {
initialization;
echo "${array[@]}"
}
mainMethod;




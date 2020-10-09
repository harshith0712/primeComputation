#!/bin/bash

## USECASE1

## initilization
function initialization() {
echo "enter the limit"
read number
checkPrime $((number))
}

## first 200 prime

function checkPrime() {

limit=$1
echo "prime number between 1 to 200 are "

   for((i=1; i<=$limit; i++))
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
         echo "$i"
         palindrome $((i))
      fi
   done

}
function palindrome() {
## palindromes in 200 primes
Palindrome=$1
reverse=0
count=1
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
            storeInArray $((reverse))
            ((count++))
         fi
   fi
}
function storeInArray() {

   for((k=1; k<=count; k++))
   do
      array[k]=$1
      echo "${array[k]} is a palindrome"
   done
}
function mainMethod() {
initialization;
}
mainMethod;




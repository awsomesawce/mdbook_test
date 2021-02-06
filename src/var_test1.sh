#!/bin/bash

a=2334
(( "a += 1" ))
echo "a = $a"
echo

declare -i number
number=3
echo "Number = $number" # Number = 3
number=three
echo "Number = $number" # Number = 0
# Tries to evaluate the string "three" as an integer.

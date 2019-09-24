#!/usr/bin/env bash

diff <(./fizzbuzz.st 2>/dev/null ) \
     <(for((i=1;i<101;i++)){((i%3))&&j=||j=Fizz;((i%5))||j+=Buzz;echo ${j:-$i};})

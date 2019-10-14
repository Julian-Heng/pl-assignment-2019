#!/usr/bin/env bash

[[ -e "./build/fizzbuzz" && -x "./build/fizzbuzz" ]] && \
    diff <(./build/fizzbuzz) \
         <(for((i=1;i<1001;i++)){((i%3))&&j=||j=Fizz;((i%5))||j+=Buzz;echo ${j:-$i};})

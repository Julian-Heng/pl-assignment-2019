#/usr/bin/env prolog

fb_cond(N) :- 0 is mod(N, 15) -> write('fizzbuzz\n').
fb_cond(N) :- 0 is mod(N, 3) -> write('fizz\n').
fb_cond(N) :- 0 is mod(N, 5) -> write('buzz\n').
fb_cond(N) :- write(N), write('\n').

fizzbuzz(0).
fizzbuzz(N) :- N1 is N - 1, fizzbuzz(N1), fb_cond(N).

run :- fizzbuzz(1000).

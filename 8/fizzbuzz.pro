fb_cond(N) :- 0 is mod(N, 15) -> write('FizzBuzz\n').
fb_cond(N) :- 0 is mod(N, 3)  -> write('Fizz\n').
fb_cond(N) :- 0 is mod(N, 5)  -> write('Buzz\n').
fb_cond(N) :- write(N), write('\n').

fizzbuzz(0).
fizzbuzz(N) :- N1 is N - 1, fizzbuzz(N1), fb_cond(N).

main :- fizzbuzz(1000).
:- initialization(main).

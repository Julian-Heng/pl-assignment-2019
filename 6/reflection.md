# Smalltalk - Week 6
## Source Code
\lstinputlisting[style=code]{./6/fizzbuzz.st}


## Program Output
\begin{multicols}{5}
\lstinputlisting[language={},style=codenonum]{./6/output}
\end{multicols}


## Reflection

Smalltalk has the same problem as Algol in that it does not enforce '`.`',
the statement terminator, at the end of the last statement in the last
block. Thus, this would result in Smalltalk violating the regularity
principle.

Smalltalk is a very simple language, with only having exactly 6 keywords:

  1. `true`
  2. `false`
  3. `nil`
  4. `self`
  5. `super`
  6. `thisContext`

Thus Smalltalk complies with the simplicity principle.

Smalltalk is highly structured as it encompasses object orientation. As such,
it is easy to see the flow of the program through it's use of messaging between
objects. Thus Smalltalk is in compliment with structured programming principle.

Smalltalk has dynamic typing, variables do not need to have a type declared.
Thus it would improve writability, however may impact readability. Smalltalk's
syntax is uncommon and very quirky. As such, initially writing a Smalltalk
program is difficult, because it does not share much in common with other
ubiquitous programming languages, like C, or other object orientated
programming languages, like Java, Ruby, or Python.

Smalltalk does have, to my knowledge, have 2 statement terminators. Both '`.`'
and '`!`' ends a statement. It is actually incredibly hard to find the
difference between the two, but most example uses '`.`' and '`!`' seems to work
in specific context. As such, I would argue that it violates the syntactic
consistency principle. Thus it can affect readability and writability.

Smalltalk is an object orientated language. As such, it would comply with
abstraction, information hiding and the modular programming principle.
Abstraction is achieved by concealing algorithms within classes, to which the
client using those algorithms can just use them as objects. Information hiding
is achieved by hiding class fields within classes and objects. Modularity is
achieved by allowing importing packages, albeit cumbersome.


## Weekly Question

How does your implementation of fizz buzz here compare with the implementations
you wrote in Fortran and Algol in terms of readability and writability?

My implementation of FizzBuzz in Smalltalk is an object orientation form, i.e.
has setters, getters, constructors and methods that do a specific task. I
believe this is much more readable that the FizzBuzz for Fortran or Algol
because of the modularity I have imposed. For example, method `isFizz` returns
true if divisible by 3, likewise for `isBuzz`. The method `isNormal` calls
these methods to determine if it is not divisible by 3 and 5. As for
writability, because of Smalltalk's quirky syntax, it made it quite fun to
write in, this I would say it is much more writable in comparison to Algol and
Fortran as those languages are very similar in comparison.

\newpage

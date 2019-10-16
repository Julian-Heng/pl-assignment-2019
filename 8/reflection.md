# Prolog - Week 8
## Source Code
\lstinputlisting[language=prolog,style=code]{./8/fizzbuzz.pro}


## Program Output
\begin{multicols}{2}
\lstinputlisting[firstline=0,lastline=20,style=codenonum]{./8/output}
\begin{lstlisting}[style=codenonum]
...
\end{lstlisting}
\lstinputlisting[firstline=980,lastline=1000,style=codenonum]{./8/output}
\end{multicols}


## Reflection

As Prolog's main focus is logical programming, many aspects from other
programming paradigms are not present, but rather are abstracted away. For
example, Prolog lacks pointers, objects, functions, conditionals, etc. As such
Prolog would compliment the abstraction programming principle.

Prolog programs have very difficult structuring. There is no concept of a
block. Rules are terminated with a period and statements terminate with a
comma. There is no `if else` to define the flow of the program and instead it
is trickled down through the use of predefined rules. Thus, Prolog would
violate the structured programming principle.

For all intents and purposes, I do not see any part of Prolog's syntax that is
not consistent, most likely due to it's simplicity. Prolog's logical construct
is simple to implement and as such, it would comply with the simplicity and
syntactic consistency programming principles.

Writability of a Prolog program would ultimately be depending on the nature of
the program. Programming a web server in Prolog would be an extremely difficult
task, and would not be suitable for Prolog. An AI or machine learning tool,
however, would make more sense to be written in Prolog.

Readability of a Prolog program would be difficult, but would still depend on
the goal of the program. For simple programs that performs small talks, it
would most likely be easy to read as all the rules for the tasks are written.
For any input that does not fail the rule's condition, execute the statements.
Else fall down until it has exhausted all the other rules. However, the real
world does not run on small simple programs and are rather huge monolithic
pieces of software. As such, Prolog would most likely be difficult to read.


## Weekly Question

Was FizzBuzz easier or harder to implement in Prolog? Why or why not?

FizzBuzz was harder to implement in Prolog. It is because Prolog, without any
extensions, does not have any control structures that other traditional
procedural programming languages have. This includes `if`, `else` conditionals
and `for`, `while`, `until` loops. As such, conditionals have to be implemented
using rules and loops have to be implemented as recursion.

\newpage

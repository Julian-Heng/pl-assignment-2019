# Scheme - Week 9
## Source Code
\lstinputlisting[language=lisp,style=code]{./9/sort.scm}


## Program Output
### Command Line
\lstinputlisting[style=codenonum]{./9/cmdline}


### Output
\lstinputlisting[style=codenonum]{./9/output}


## Reflection

Scheme is a very simple language, which stems on the fact that new variables
can't be declared within a function scope. This allows no side effects to occur
in Scheme. Scheme only has 2 data types, which are atoms and lists. There's no
way to perform regular inline arithmetics, as Scheme opts for treating
mathematics operations as function calls. As such, `(- 1 1)` instead of `1 -
1`. Thus, Scheme would comply with the simplicity programming principle.
Additionally, it would also comply with the regularity and the syntactic
consistency programming principle because Scheme imposes S-expressions to
everything in the language.

Scheme's way of handling lists is to use `car` and `cdr`. These refer to the
start of a list or everything but the start of the list. As such, Scheme would
comply with the labelling principle as it gives meaningful names, though may be
debatable names but names nonetheless, to atoms in a list. This, again, would
also comply with the simplicity programming principle as it's the only way to
traverse a list.

Scheme, in my opinion, is a language that has low readability, and low
writability. It is fairly difficult to debug a Scheme program, possibly due to
it's extensive use of functions as arguments to other functions, lack of
declaring temporary variables, recursion for loops and limited list
manipulation. Readability is also difficult due to only having one brace,
parenthesis. While only having one type of brace within the language comply
with the regularity programming principle, it hinders readability because a
function in Scheme would end with many, many parenthesis. Scheme however would
be, out of all the languages we've looked at so far, would undeniably be the
most reliable language due to functional programming's property of having no
side effect.


## Weekly Question

Investigate how scheme performs file IO. Does this break regularity? Why or why
not?

Scheme performs file IO by using ports. There are 2 types of ports, one input
port and one output port. Scheme does not allow declaring variables. As such,
extensive use of the let function is required to define what current port the
program should be using. File IO is also very serial. A file cannot be written
in a parallel manner. As such, presumably, the file pointer would have to
traverse throughout the entire file from beginning to the end of the data
stream, or move the pointer multiple times to write different parts of the
file. One of the points of scheme, and functional programming, is that all
functions do not have side effects. Ports by nature must have side effects
because a file can't be written to in a parallelised manner, unless the program
is reading instead of writing. Thus, there exist a "variable", which is an open
port for a file to be written, that can exhibit side effects. Thus, file IO in
scheme breaks regularity.

\newpage

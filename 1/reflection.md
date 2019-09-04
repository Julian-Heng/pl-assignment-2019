---
toc: true
geometry: margin=25.4mm
papersize: a4
...

\newpage
# FORTRAN 77 - Week 1
## Source Code
\lstinputlisting[language=fortran,style=code]{./1/fizzbuzz.f}


## Reflection

FORTRAN 77, while not the original FORTRAN from the 50s, is somewhat difficult
for me to write in, but not as hard as I thought it would.

One deviation of FORTRAN would be it's unconventional syntax for logic
comparisons. `.LE.` instead of `<=` and `.NE.` instead of `==`. This makes
writing and reading boolean logic much harder as the later would be much more
easy to distinguish than using short form letters. The same could be said about
boolean comparisons such as `.AND.` or `.OR.`, instead of `&&` or `||`.
However, it is important to point out that modern languages like Python also
uses words for boolean logic, so it might just be a personal preference.

One interesting aspect about FORTRAN would be it's strict formatting rules.
Columns 1-6 are reserved for comments, labels, etc while columns 7-72 are for
the actual statements. This forces long statements to be broken up into
multiple lines, which in my opinion, does help readability. However, long
statements, must start at column 6 and a character, not a whitespace, must be
used to denote that it's a continuation of the previous line, which looks
weird. Additionally, the strange indentation does affect my overall writability
as it is non-standard to other programming languages.

FORTRAN allows variable to be any name including it's own syntax, which may
hinder the reliability of the program as programmers can commonly make.


## Weekly Question
How does Fortran compare to languages you have written in previously?

Fortran contains some similar structures found in other programming languages
I've written before, but with some major deviations.

First impression would have been that it shares many similar structures to
other programming languages, more specifically the if-else block and loop
declarations, where it's a keyword followed by a `(condition)`.

When coding in C, I would normally use the `-pedantic` when compiling, so I'm
used to declaring variables at the start of the program or function block.
However, as far as I know, you cannot declare a variable type and initialise it
to a value in the same statement.

C and Fortran are somewhat similar in that, I can probably convert a basic C
program into a Fortran program. Concepts like variable declarations, if-else
and loops, as well as pointers are present. Function pointers are done by
assigning function names to variables and calls to functions are done with the
call keywords.

\newpage

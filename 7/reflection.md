# C++ - Week 7
## Source Code
### main.cpp
\lstinputlisting[language=c++,style=code]{./7/main.cpp}


### main.hpp
\lstinputlisting[language=c++,style=code]{./7/main.hpp}


### book_sorter.cpp
\lstinputlisting[language=c++,style=code]{./7/book_sorter.cpp}


### book_sorter.hpp
\lstinputlisting[language=c++,style=code]{./7/book_sorter.hpp}


### book.cpp
\lstinputlisting[language=c++,style=code]{./7/book.cpp}


### book.hpp
\lstinputlisting[language=c++,style=code]{./7/book.hpp}


## Program Output
### Command Line
\lstinputlisting[style=codenonum]{./7/cmdline}


### Output
\lstinputlisting[style=codenonum]{./7/output}


## Reflection

C++ contains additional syntax in order to make C an object orientated
language. As such, it's new syntax deviates away from other object orientated
languages like Java or Python. Since C++ is mostly a super-set of C, all the
programming principles that C violates will apply.

C++ uses `->` to dereference and access a member of a pointer pointing to an
object. C uses `->` to dereference and access a variable within a pointer
pointing to a struct. C++ allows structs. Thus, it can be confusing when using
`->` on a variable as it is not clear if that variable would refer to an object
or a struct. Thus this violates syntactic consistency.

The `<<` operate means shift the bits in the variable x amount to the left. C++
introduces ostream operators, which uses `<<` as well as `>>`. As such, this
violates the syntactic consistency principle.

C++ allows `and` and `or` for boolean conditionals, in addition to `&&` and
`||`. Thus, this can potentially improve readability. It will reduce
writability, but since the compiler does not enforce this rule, it really does
not impact writability and it's entirely up to the programmer.

C++ requires semicolon at the end of a class declaration, exactly to how C
requires semicolon at the end of a `struct` or `enum` declaration. Seeing as
these keywords requires braces and are the only keywords with braces that needs
to terminate with a semicolon, it would violate the regularity programming
principle. As such this will reduce writability and reliability.


## Weekly Question

Compare how you have implemented objects in C++ with how you implemented them
in Java. What does this tell you about how objects work in C++?

Objects in C++ feels like I'm still manipulating memory, whereas Java feels
like each object is an abstracted sequence of bytes who's memory is handled
entirely by the virtual machine. Memory management must be manually handled in
C++ whereas it's abstracted away by the garbage collector.

I suppose to have low level performance, and have some benefits for object
orientated concepts, it would make more sense to manually manage memory. As
such, the programmer who would've been tasked to perform the book sorter should
ask themselves: "Is it more beneficial to tolerate the low levelness nature of
C++, with it's inclusion of pointers, memory management, possible error prone
code for higher performance and a much lower memory footprint. Or is the ease
of writing in Java, in comparison to C++, more beneficial for rapid
development".

\newpage

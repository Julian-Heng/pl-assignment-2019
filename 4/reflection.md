# EBNF - Week 4
## Source Code
### Lex
\lstinputlisting[style=code]{./4/list.l}


### Yacc
\lstinputlisting[style=code]{./4/list.y}


## Program Output
### Command Line
\lstinputlisting[language={},style=codenonum]{./4/cmdline}


### Output
\lstinputlisting[language={},style=codenonum]{./4/output}


## Reflection

Yacc and Lex are very specialised tools that deals mostly with metalanguages,
but can also be useful for creating parsers for programming projects.

It generally is not a good idea to use purely Yacc and Lex for an entire
project because you'd be using the wrong tool for the job, unless your project
is a compiler. With that said, 2 thirds of the code in the Yacc file is just C.
So most of the programming principles that C violates, most likely Yacc would
also violate. Ignoring those sections, the syntax for the rules declaration are
easy to understand. Recursive is surprisingly easy and implementing actions is
intuitive.

Since the syntax is so incredibly simple, there's not really a lot to say about
the language's deviation from the programming principles, though there are
some. Yacc does not enforce semicolon at the end of the rules. So rules like
this can be accepted:

\begin{lstlisting}[style=common]
A:
 | B
 | C
 ;

C: TOKEN
B: ANOTHER_TOKEN | SOME_OTHER_TOKEN;
\end{lstlisting}

Thus, this violates regularity in the language.

As far as I know, it is not possible to somehow store values locally without
the use of global variables. Looking through the generated C files by Yacc, it
shows multiple uses of gotos and is generally hard to trace around. So in order
to implement a sorting list parser, global variables was needed. This can
affect reliability in that it may influence programmers to have elaborate ways
of either working around this issue or working with it. It can be argued that
Yacc will also never fail and that all the parsing and logic is all handled
internally so that programmers never have to worry about it as long as they
don't do anything stupid.

The structure of a Yacc file has declarations, followed by rules then auxiliary
functions. Declarations are in C code and are delimited by `%{..%}`. Rules are
delimited by `%%..%%` and auxiliary functions, which are written in C code, are
not wrapped at all. Since both auxiliary functions and declarations get
inserted in the generated C code, it would make for sense to have both be
delimited by the same identifier. Thus, this violates regularity.

On the readability of Yacc, it would have the same readability as C, so it
depends on the programmer that has written it. Since rules are very simple,
they have high readability. Writability for the rules however may result in
trial and error as you are essentially creating new language grammar.


## Weekly Question

If you were building a compiler, how do you think you would implement a symbol
table?

Use a hash table for the symbol table. For each scope, implement a two layer
table where the first layer is all the primitives and any `typedef` types.
Second layer would store the name of the variable. For the entire program, have
one hash table for the global variables and reachable functions and have
another bash table for static variables and static functions.

\newpage

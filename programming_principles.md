# Programming Principles

## Readability

Readability must be considered in the context of the problem domain. For
example, if a program that describes a computation is written in a language not
designed for such use, the program may be unnatural and convoluted, making it
unusually difficult to read

The following describes the most important characteristics influencing the
readablity of a programming language:


### Overall Simplicity

The overall simplicity of a programming language strongly affects its
readability. A language with a large number of basic constructs is more
difficult to learn than one with a smaller number. Programmers who must use a
large language often learn a subset of the language and ignore its other
features. Readability problems occur whenever the program's author has learned
a different subset from that subset with which the reader is familiar.

A second complicating characteristic of a programming language is feature
multiplicity, that is having more than one way to accomplish a particular
operation.

A third complicating characteristic is operator overloading, in which a simple
operator symbol has more than one meaning. Although this is often useful, it
can lead to reduced readability if users are allowed to create their own
overloading and do not do it sensibly.

Simplicity in languages can be carried too far. For example, the form and
meaning of most assembly language statements are modules of simplicity. This
very simplicity, however, makes assembly language programs less readable.
Because they lack more complex control statements, program structure is less
obvious; because the statement are simple, far more of them are required than
in equivalent programs in a high-level language. The same arguments apply to
the less extreme case of high-level languages which inadequate control and
data-structuring contructs.


## Writability

Writability is a measure of how easily a language can be used to create
programs for a chosen problem domain. Most of the language characteristics that
affect readability also affect writability. This follows directly from the fact
that the process of writing a program requries the programmer frequently to
reread the part of the program that is already written.

As is the case with readablity, writability must be considered in the contect
of the target problem domain of a language. It is simply not reasonable to
compare the writability of two languages in the realm of a particular
application when one was designed for that application and the other was not.

The following describes the most important characteristics influencing the
writability of a language:


### Orthogonality

Orthogonality in a programming language means that a relatively small set of
primitive constructs can be combined in a relatively small number of ways to
build the control and data structures of the language. Furthermore, every
possible combination of primitives is legal and meaningful. For example, con-
sider data types. Suppose a language has four primitive data types (integer,
float, double, and character) and two type operators (array and pointer). If
the two type operators can be applied to themselves and the four primitive data
types, a large number of data structures can be defined.

If a language has a large number of different constructs, some programmers
might not be familiar with all of them. This situation can lead to a misuse of
some features and a disuse of others that may be either more elegant or more
efficient, or both than those that are used. Therefore, a smaller number of
primitive constructs and a consistent set of rules for combining them (that is,
orthogonality) is much better than simply having a large number of primitives.
A programmer can design a solution to a complex problem after learning only a
simple set of primitive constructs.

On the other hand, too much orthogonality can be a detriment to writability.
Errors in programs can go undetected when nearly any combination of primitives
is legal.


### Abstraction

Abstraction means the ability to define and then use complicated structures or
operations in ways that allow many of the details to be ignored. It is a key
concept in contemporary programming language design. This is a reflection of
the central role that abstraction plays in modern program design methodologies.
The defree of abstraction allowed by a programming language and the naturalness
of its expression are therefor important to its writability. Programming
languages can support two distint categories of abstraction, process and data.


### Expressivity

Expressivity in a language can refer to serveral different characteristics. It
means that a language has relatively convenient, rather than cumbersome, ways
of specifying computations. Examples include `count++` instead of `count =
count + 1`.

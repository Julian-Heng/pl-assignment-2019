# Programming Principles

## Abstraction

Avoid requiring something to be stated more than once, factor out the recurring
pattern.

  - Interpretation: Any commonly occurring pattern in the program code should be
    recognized and able to be implemented such that the repetition of the
    pattern is minimized
  - Example: the use of submodules
  - Violated by: Assembler?
  - Violation: Fortran 77 does not support pointers and heap-dynamic variables,
    so binary trees must by implemented using parallel arrays.
  - Violation: Fortran 90 does not have records, so arrays of records must be
    emulated using parallel arrays.
  - Violation: The declaration of the common block structure in Fortran had to
    be repeated in each subprogram.
  - Compliance: Fortran supported subprograms.
  - Compliance: Ada packages allowed for the creation of abstract data types


## Defence in depth

If an error gets through one line of defence then it should be caught by the
next line of defence.

  - Interpretation: There should exist multiple checks for errors in a program
    such that error detection is maximized.
  - Example: If an error is not recognised in syntax checking it should be
    recognised in type checking.
  - Violation: C originally failed to type check parameters passed in function
    calls.
  - Violation: Fortran does not have exception handling or type checking.
  - Violation: Fortran, PL/I, and Perl have implicit variable declaration.
  - Violation, kinda, sorta: Smalltalk has dynamic type checking, but works
    around the problems with this by suspending operation and allowing
    modifications to interactively fix the unhandled message, instead of
    crashing.
  - Compliance: Ada provides exception handling.


## Information Hiding (Parna's principle)

The user has only the information required to use a module and the implementer
has only the information required to implement it. Changes in implementation
does not affect other code, only changes in the interface.

  - Interpretation: Unnecessary information should not be visible or
    modifiable.
  - Violation: All information-passing in Fortran, apart from common block use,
    is done through parameters passed by reference, often forcing the
    programmer to specify more information than necessary.
  - Compliance: Ada packages.


## Labelling Programming Principle

Avoid long arbitrary sequences. Do not require users to know the absolute
position of an item in a list. Instead, associate meaningful labels with
arbitrarily ordered items.

  - Interpretation: Use symbolic names instead of memory addresses or line
    numbers to associate with programming elements such as sub-routines,
    variables or operators.
  - Violation: Numeric operations in IBM 650 pseudo-code are non-descriptive.
  - Compliance: Ada allows position-independent parameters.


## Orthogonality

Independent functions should be controlled by independent mechanisms.

  - Interpretation: Let all combinations of a small set of primitives be legal.
    Because even a small set of primitives lead to a large number of
    combinations, too much orthogonality reduces simplicity (Algol 68 did this)
    and can make absurdities in the code difficult for the compiler to detect.
  - Violation: C functions can return records but not arrays. Records cannot
    hold void members or members of their own type. Arrays cannot hold voids or
    functions. Arrays are pass-by-reference, whereas everything else is
    pass-by-value. Pointer arithmetic.
  - Violation: In IBM mainframe assembly, when adding the contents of a memory
    cell to a register, one must state the register first, and use a different
    operation than when adding two registers.
  - Compliance: In IBM 650 pseudo-code, “opposite” operations are denoted by +
    and -.
  - Compliance: Ada operators used to control parameter passing is orthogonal
    allowing the selection of the appropriate side effect without choosing a
    specific implementation of parameter passing which by themselves have
    overlapping functionality in the read/write ability of the passing
    variable.


## Preservation of information

Allow representation of information that the user might know and the compiler
might need.

  - Compliance: Fortran programmers were able to see what variables would be
    used for indexing in do loops and keep their values in index registers for
    optimisation.
  - Example: The method of parameter passing used in sub-programs is often an
    ability of languages to allow users to choose the side effects that are
    active to the actions of the submodule.
  - Violation: Perl - Arrays lose identities when passed into a subroutine.
  - Violation: C - Arrays can become pointers when returned from a function


## Regularity

Language rules should be applied universally without exception.

  - Interpretation: There should not exist any exceptions to grammar rules.
  - Example: If a semi-colon denotes the end of a line, it should be required
    after every statement.
  - Compliance: Location 000 always contains zero in IBM 650 pseudo-code.
  - Compliance: In Algol, a sequence of statements can replace a single
    statement using the block structure.
  - Compliance: Ada and Perl, unlike C, do not allow if-clauses with a single
    statement to forego a closing statement.
  - Compliance: In Smalltalk, user-defined classes are indistinguishable from
    built-in classes.
  - Violated By: Pascal - Use of Semi-colon after a block statement optional
  - Violated By: FORTRAN - Can store strings in integers
  - Violated By: C - use of semicolon after do-while loop. use of semicolon
    after structs.
  - Violation: In Ada, everything is dynamically scoped, except
    exception-handlers.
  - Violation: Smalltalk unnecessarily includes arithmetic syntax where the
    message-passing syntax used for everything else would suffice.


## Zero-One-Infinity

The only reasonable numbers in a programming language design are zero, one and
infinity. A special case of the regularity principle.

  - Interpretation: A programming language construct should be limited to being
    singluar, zero or able to scale to infinitity.
  - Violation: Fortran 77 arbitrarily limits identifier names to six
    characters.
  - Violation: Fortran 77 arbitrarily limits arrays to three dimensions.
  - Violation: FORTRAN limits the size of arrays. ?? Not sure on this, but I
    think that it does.
  - Compliance: Arrays in Algol can have any number of dimensions and can have
    negative indices.
  - Compliance: There is no limit on the depth of the class hierarchy in
    Smalltalk.


## Security

No program that violates the definition of the language or its own structure
should escape detection.

  - Interpretation: The first condition is mostly a compiler consideration.
  - Compliance: IBM 650 programs could not address memory outside the 1,000
    addressable memory locations.


## Simplicity

A language should be as simple as possible. There should be a small number of
concepts and simple rules for their combination. Avoid multiplicity.

  - Violation: Perl and PL/I permissively amalgamates concepts from many other
    languages, which makes them very large languages.
  - Violation: C has multiple ways of performing addition and subtraction.
  - Compliance: Scheme has a single construct: the function call.


## Structured Programming

The static structure of a program should correspond in a simple way to the
dynamic structure of the program.

  - Interpretation: The execution of a program should be easy to trace given
    its source code.
  - Example: Block structure vs initial Fortran structures
  - Violation: Goto statements are required in Fortran 77 to emulate while
    loops, and there are three similar-looking versions of the goto statement
    with different behaviour.
  - Violation: Ada’s exit statement is a scantily disguised goto statement.
  - Violation: Ada can exit lops at multiple locations.
  - Compliance: Pascal enforces single entry : single exit from loops


## Syntatic Consistency

Things which look similar should be similar, and things which look different
should be different.

  - Interpretation: the language should have visually different constructs to
    avoid confusion between similar symbols for constructs.
  - Violation: The meaning of static in C depends on the context.
  - Violation: The simple, computed, and assigned goto statements in Fortran
    are different but look similar.
  - Violation: Integer variables can also hold characters in Fortran. I think
    that this is an example of an irregularity instead
  - Violation: Identifiers are case-sensitive in C and C++, meaning different
    variables can have very similar names.
  - Violation: Pascal implicitly uses pass-by-value unless pass-by-reference is
    explicitly specified.
  - Violation: FORTRAN Uses * for multiplication and ** for exponents.
  - Violation: C uses * for both dereferencing pointers and multiplication.
  - Compliance: Algol used := for assignment and = for equality.

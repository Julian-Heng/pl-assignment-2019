# Ada - Week 3
## Source Code
\lstinputlisting[language=ada,style=code]{./3/bubble_sort.adb}


## Program Output
### Command Line
\lstinputlisting[language={},style=codenonum]{./3/cmdline}


## Output
\begin{multicols}{2}
\lstinputlisting[language={},style=codenonum]{./3/output}
\end{multicols}


## Reflection

Ada is the first programming language in this course so far that actually feels
like a "normal" and "sane" programming language.

Ada and Pascal shares many similar syntax, including `begin..end` and `if..end
if` constructs. Using worded keywords increases readability, however it may or
may not increase writeability. The way of parameter passing within Ada is very
nice. The option to pass by value and pass by reference is still there, using
mode keywords such as `in`, `access` and `aliased`. But a feature of Ada is
pass by result. This utilises the `out` or `in out` mode. This is really handy
because it would remove the need, at least in my case, for using pointers. For
example, swaping values within 2 variables in C as a function call looks like
this:

\begin{lstlisting}[language=c,style=codenonum]
void swap(int* a, int*b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}
\end{lstlisting}

In Ada its:

\begin{lstlisting}[language=ada,style=codenonum]
procedure Swap(I, J: in out Integer) is
    Temp : Integer := I;
begin
    I := J;
    J := Temp;
end Swap;
\end{lstlisting}

No pointers necessary. This alone makes Ada a lot more readable, writeable as
well as more reliable than C. Unfortunately, the only other language that seems
to have this feature is C#.

Ada is object orientated. A version of Ada in 1995 was made to make it an
object orientated. The syntax for accessing an object's methods is
`Object'Method()` which not the same for other's languages `Object.method()`.
This may be seens as decrease in readability and writability as it does not
conform to other languages, however, it can be argued that it's just the syntax
for Ada and the programmer should just get used to it.

Ada's way of accessing array elements annoys me. It uses `()` instead of `[]`,
which breaks the syntatic consistency principle. This can reduce reliability
and readablilty because the programmer deciphering Ada source code needs to
remember if the identifier is for a method call or an array.

Ada's inclusion of exceptions and loops with the exit condition keywords makes
"bad programming practices" like gotos and breaks non-existent in Ada. This
improves reliability as those keywords may introduce unwanted sideeffects.
However, it is important to point out that exception handling in Ada breaks the
structured programming principle as no other contructs of Ada uses the dynamic
scope to exit the current code block of execution. This, in my opinion, this
does not seem to affect readability, writability or reliability.

The fact that Ada is made by the Department of Defence and that most
mission-critical hardware used by the military is written in Ada means that
it's syntax is most likely not to change, if at all. This means that
reliability for Ada is quite high to, say, Python.


## Weekly Question

Compare your implementation of bubble sort with an implementation in C (you may
have written one, if not, there are plenty on the internet you can look at).
What similarities and differences are there?

In C:

\begin{lstlisting}[language=c,style=codenonum]
void sort(int* arr, int size)
{
    int swapped;
    int i;

    do
    {
        swapped = FALSE;

        for (i = 1; i < size; i++)
        {
            if (arr[i] > arr(i - 1))
            {
                swap(&(arr[i]), &(arr[i - 1]));
                swapped = TRUE;
            }
        }
    } while (swapped)
}
\end{lstlisting}

In Ada:

\begin{lstlisting}[language=ada,style=codenonum]
procedure Sort(Arr: out Integer_Array) is
    Swapped : Boolean;
begin
    loop
        Swapped := False;
        for I in Integer range 1 .. Arr'Length - 1 loop
            if Arr(I - 1) > Arr(I) then
                Swap(Arr(I), Arr(I - 1));
                Swapped := True;
            end if;
        end loop;
        exit when not Swapped;
    end loop;
end
\end{lstlisting}

Similarities:

1.  Both implementations of bubble sort are the same in terms of logic.

Differences:

1.  Variable declaration happens before the begin keyword in Ada, making it
    mandatory to declare all variables before any statements can be
    executed. C on the other hand only has function parameters declared and
    local function variables can be declared anywhere in the function,
    unless `-ansi` flag is set in the compiler.

2.  C implementation uses for and while loops, but Ada uses loop exit and
    for i in loop.

3.  C accesses arrays using `[]`, Ada accesses arrays using `()`.

4.  Ada syntax for declaring procedure only has one parameter whereas C
    needs a size parameter.

5.  C passes 2 reference pointers to `swap()` because we need to swap these two
    elements and C has pass by reference whereas Ada doesn't as it uses pass by
    result.

\newpage

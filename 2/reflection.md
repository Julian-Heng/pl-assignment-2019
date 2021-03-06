# Algol68 - Week 2
## Source Code
\lstinputlisting[language=algol,style=code]{./2/fizzbuzz.a68}


## Program Output
\begin{multicols}{5}
\lstinputlisting[language={},style=codenonum]{./2/output}
\end{multicols}


## Reflection

Algol68 introduces code blocks, which makes it a much more like a modern
programming language compared to FORTRAN.

It's structure reminds me of pseudocode that we had to write in 1st year units
so it's ideas of using `:=` as it's assignment operator wasn't foreign to me.
One aspect I notice is that semicolons are needed for multiple statements in a
block, except the last statement. Using this, I notice that I can tell where
the code blocks are by inspecting statements without ending with a semicolon.
This does impact my writability, as I've had to go back to the code and add a
missing semicolon as it would fail to compile. Additionally, that is the only
way to identify code blocks, as far as I know. Compared to C, code blocks are
easy to spot because of the curly braces. As such, readability is affected by
not having curly braces.

One aspect of Algol that improves readability as well as writability is
enforcing keywords such as `FI`, `OD` and `ESAC` to denote the end of a `IF`,
`FOR` and `CASE` construct, respectively. While not necessary a good
substitution of curly braces, they do fix the dangling ELSE problem that C has.
This style is also seen in shell scripting languages as well, except for the
`FOR..OD` keywords.


## Weekly Question
Assume your program pauses when it prints out FizzBuzz. Draw the stack with all
activation records, and both static and dynamic chains, at this point.

![](./2/Activation_Record.png "Activation Record")

With the way fizzbuzz is implementent, when a number is divisible by 15, it'll
enter both code block C and code block D. As such, I've made the assumption
that when it prints fizzbuzz, it'll be executing code block D and code block C
is removed from the activation record.

\newpage

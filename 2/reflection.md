# Algol68 - Week 2
## Reflection

Algol68 introduces the idea of code blocks, which for some reason makes writing
in Algol much more easily for me.

It's structure reminds me of pseudocode that we had to write in 1st year units
so it's ideas of using `:=` as it's assignment operator wasn't foreign to me.
One aspect I notice is that semicolons are needed for multiple statements in a
block, except the last statement. Using this, I notice that I can tell where
the code blocks are by inspecting statements without ending with a semicolon.
This does impact my writablity, as I've had to go back to the code and add a
missing semicolon as it would fail to compile. Additionally, that is the only
way to identify code blocks, as far as I know. Compared to C, code blocks are
easy to spot because of the curly braces. As such, readablilty is affected by
not having curly braces.

One aspect of Algol that improves readablility as well as writablity is
enforcing keywords such as `FI`, `OD` and `ESAC` to denote the end of a `IF`,
`FOR` and `CASE` construct, respectively. While not necessary a good
substitution of curly braces, they do fix the dangling ELSE problem that C has.
This style is also seen in shell scripting languages as well, except for the
`FOR..OD` keywords.


## Weekly Question
### Assume your program pauses when it prints out fizzbuzz. Draw the stack with all activation records, and both static and dynamic chains, at this point


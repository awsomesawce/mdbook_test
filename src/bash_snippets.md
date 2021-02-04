# Bash Snippets

Here are some snippets for `bash` scripting.
Mainly this is just a place for me to take notes specifically about programming and not about the WSL file system.
A lot of these ideas came from the Advanced Bash Scripting Guide, available at [tldp.org](https://tldp.org/LDP/abs/html/)

## Bash Variables (untyped)

Like many other programming languages, `bash` does not segregate its variables by "type".  
Essentially _bash variables are character strings_, but depending on context, arithmetic operations and comparisons are permitted.  
The determining factor is whether the variable contains only digits.

```sh
a=2334
let "a += 1"
echo "a = $a"
echo
```

The variable is set on the first line, then with the `let` shell builtin, bash is able to increment the value by 1.

`let "a += 1"` can be represented by `(( "a += 1" ))` instead.

## Using Declare or Typeset to type variables

Just like the name says, you are _typesetting_ a variable using this method.
I will list the options provided by the `declare`/`typeset` builtin.

`-r` _readonly_

(`declare -r var1` works the same as `readonly var1`)
  Note that this is roughly equivalent to the _C const_ type qualifier.  An error message is shown when attempting to change a _readonly_ variable.

`-i` _integer_

```bash
declare -i numbah
numbah=3
echo "Number = $numbah"  # Number = 3
numbah=three
echo "Number = $numbah" # Number = 0
# Tries to evaluate the string "three" as an integer.
```

# Dev Blog


```powershell
<#
.DESCRIPTION
Testing
.NOTES
# Thinking about organization of code and snippets

I have to stick to an order for code that is written.
I write more code than I read, just because I like typing and I
want to make sure I have the basics down.
But real coding is different.
It is going thru 100s of lines of code and fixing problems that are picked up
by certain debugger and code editor tools.
I, as an aspiring web/systems developer, have not delved into the world of language tooling
as much as I should be.
VSCode is an incredibly powerful tool for development.
So is `nvim` (neovim) or `vim`.
I use the `vim` clones more than I do VSCode because VSCode seems clunky at times.
I have gotten better at moving the cursor around using just my keyboard.
#>
param(
    [int]$x = 1,
    [int]$y = 2
)

$local:ans = $x + $y
return $local:ans
```

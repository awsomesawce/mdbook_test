# Type Literals in Powershell

Powershell is unique in that it can utilize the full power of the _.NET_ type system.

After all, **Powershell** is a full _object-oriented_ interpreted language with way more features than Bash.
It's syntax is just a bit different, that's all.

You can use _type-literals_ in your pwsh scripts.

## Examples

This examples is from my [getpsenv.ps1](https://github.com/awsomesawce/scripts-pwsh/blob/main/utils/getpsenv.ps1) script.

```powershell
# Set the SSL/TLS Protocol version before doing a web request.
[System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'
Invoke-RestMethod -Uri 'https://httpbin.org/get' | convertfrom-json -ashashtable
```

Another cool way of using type-literals is to check strings and variables.
This snippet is from my pwsh profile:

```powershell
$scrps = if ([string]::IsNullOrWhitespace($scrps)) {
    "$env:USERPROFILE\gitstuff\scripts-pwsh"} else {Write-Error "`$scrps is not null or whitespace"}
```

You can even use type-literals to convert strings into base64.
This is from [here]()

```powershell
$myStr = "test string"
$myBytes = [system.text.encoding]::UTF8.GetBytes($myStr)
$myEncoded = [convert]::ToBase64String($myBytes)
return Write-Output $myEncoded
Write-Output $myEncoded # => dGVzdCBzdHJpbmc=
```

_You can even create directories using type literal methods!_

```powershell
[System.IO.Directory]::CreateDirectory('new_dir') # => creates `typedir` and 
# outputs info about the dir to stdout in the same format as `Get-Item`
```

### Type Literal Methods

Type literals expose methods like `CreateDirectory()` and such that allow you to do
things where you would normally use a cmdlet or function.

### Typing variables with Type Literals

By prepending a type literal to a variable, you're able to tell the interpreter
the type without it having to guess (dynamic typing).

Example:

```powershell
[string]$num = 3 # This tells powershell to parse the value of $num as a string.
# You can test this with:
$num.GetType().FullName # => System.String
# Entering `$num.GetType()` without `FullName` output the type information as
# an object, so you can use something like this:
$num.GetType() | select-object *
# To get more information and show every property.
```

Powershell includes nice tab-completion for type-literals, so if you type somthing
like:
`[System.Net.` and press <kbd>TAB</kbd>, you will cycle thru possible type names.

If you're using the _PSReadline_ module (which you should be), you can press <kbd>CTRL+Space</kbd> to get a full list of
completions.

> I've tested <kbd>CTRL+Space</kbd> on Powershell Core for Linux on wsl's Ubuntu, and they seem to default on a
> different set of keybindings for working with _PSReadline_.
>
> Tab-completion on Linux Powershell works very similarly to Bash completion, so just pressing <kbd>TAB</kbd> _twice_
> on an arbitrary completion will show all completion choices.

You can add a type from a `.dll` assembly into the current pwsh session by using `Add-Type -AssemblyName "Some.Type.dll"`
At that point you can use tab-completion to again cycle thru possible type literals from that assembly.

> Pretty cool, huh?

## More Uses for Type Lits

So I was in my `pwsh -noprofile` session searching around type literals ('type lits' if you're cool)
using _tab-complete_ and I came across this type:

`[System.Management.Automation.VTUtility]::GetEscapeSequence([System.ConsoleColor]::Blue)`

I thought it would just print out the VT (virtual terminal) escape sequence for <span style='font-color:blue'>blue</span>.

Instead it changed my _prompt string_ to the color **blue**.

> Well there's another way u can use type lits in your terminal!

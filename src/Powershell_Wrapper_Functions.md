# Powershell Wrapper Functions

## Wrapper for Nodejs

Here is a wrapper function for using node on the command line:

```powershell
function get-nodecmd {

<#
.Description
Acts like a pydoc of sorts
#>
param(
    [parameter(Mandatory = $false)]
    [string]
    $Name
)
# Checks if node is not on path and throws if that is true
if (!(Get-Command node -ErrorAction Ignore)) { throw "Node not installed on path, aborting function" }
# Checks if there is an argument to the Name parameter, and writes an error message if false
if ($Name) {
    # Use node to print a javascript object as a string of the current locale to stdout.
    node -p "$Name.toLocaleString()"
}
else { Write-Error "Need argument to this function.  Use Get-Help $($MyInvocation.MyCommand.Name) to get help" }

}
```

You can test if this command works by typing `get-nodecmd "os.arch"` on the cmdline.

Your output should be:

```powershell
function arch() {
  return process.arch;
}
```

Which shows that the `os.arch()` function simply prints the value of `process.arch`.

> If the value of `$Name.toLocaleString` is already a string, it will simply print
> the value as is.

### More nodejs wrapper functions:

```powershell
#!/usr/bin/env -S pwsh -noprofile
# Two ways to get the same info

function getnodepath {
    # First way
    $v =  node -p "process.argv" $(foreach ($item in $env:PATH.Split(";")) {
    "$item"
    })
    return $v
}

function getnodepathpure {
    # Second way
    $v = node -p "process.env.PATH.split(';')"
    return $v
}

compare-object $(getnodepath) $(getnodepathpure)
# => outputs the only difference which is that node.exe is
# at the front of the path for the pure version
```

These two functions output the same information because they are both routed thru the
same type of method.
They both take a string and split it by the `;` token.

# System.IO.Path

There are a lot of great path-related functions and methods available to the `[System.IO.Path]` class.

Here is an example for writing a small function that changes the value of `$env:PSModulePath`.

```powershell
function Set-PSModulePath {

<#
.Synopsis
Set-PSModulePath [path]
.Description
Adjust the PSModulePath env variable to your liking
.Notes
Add integration with other modules so they can add their own dir
to the psmodulepath!
#>
param(
    [parameter(Mandatory = $false)]
    [string]
    $Path
)
# Cross-platform path-separator value
# On Windows it is `;`, on Unix-like systems it is `:`
$sep = [System.IO.Path]::PathSeparator
if ($Path) {
    Write-Host -ForegroundColor Yellow "Adjusting PSModulePath
Adding $Path to `$env:PSModulePath"
    Write-Verbose "Setting old path to `$oldPSModulePath"
    $oldPSModulePath = $env:PSModulePath
    $env:PSModulePath = "${Path}${sep}$env:PSModulePath"
    Write-Host -fore Yellow "`$env:PSModulePath is now $env:PSModulePath"
}
else {
    Write-Error "You did not write a Path"
}

}
```

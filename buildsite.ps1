#!pwsh
<#
.Description
IT WORKS! This script builds the site using mdbook and
optionally makes a backup tarfile and pushes to git
.Example
mdbook -MakeTarfile -Git
=> Builds site, makes dated tarfile, and pushes to git
.NOTES
Tweak the directory target variables to use yourself.
#>

$env:PAGER = 'less'


param([switch]$MakeTarfile, [switch]$Git)
$origdir = "$env:USERPROFILE\gitstuff\mdbook_test"
$destdir = "$env:USERPROFILE\gitstuff\mdbook_test_build"
#$a = "$((Split-Path -Parent $origdir).FullName)\mdbook_test_build"
$srcdir = 'book'

if (Test-Path book) { throw "book dir found, autoclean not implemented yet" }
if (gcm mdbook -ErrorAction ignore) { mdbook build } else { throw "mdbook not on path" }
if ($MakeTarfile) {
    (Test-Path $srcdir) ? (bsdtar -acvf "mdbookout_$(Get-Date -Format FileDate).tar.xz" book/*) : (Write-Error "book dir not found")
}
if (Test-Path $destdir) {
    Write-Output "copying contents of book/* to ../mdbook_test_build"
    Copy-Item .\book\* -Destination ..\mdbook_test_build\ -Recurse -Force
    cd $destdir && Write-Output "Changed dir to mdbook_test_build"
    # Add switch for using git :complete:
    if ($Git) {
        git add . && git commit -m "Update site"
        git pull && git push && Write-Output "pulling and pushing to site"
        cd $origdir && Write-Host -ForegroundColor Yellow "You are back in the starting dir $origdir"
        Write-Host -ForegroundColor Yellow "Function complete!"
    }
}
else { throw "../mdbook_test_build not found"
}


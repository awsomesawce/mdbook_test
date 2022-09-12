#!pwsh
<#
.Description
IT WORKS! This script builds the site using mdbook and
optionally makes a backup tarfile and pushes to git
Automation is _king_.
Update: 1/4/22
It works just fine except for the fact that you can't rely on `bsdtar` to be installed
on machines.  `tar` is more widely available.
.Example
mdbook -MakeTarfile -Git
=> Builds site, makes dated tarfile, and pushes to git
.NOTES
Tweak the directory target variables to use yourself.
#>
[cmdletbinding()]
param([switch]$MakeTarfile, [switch]$Git)
$origdir = "$env:USERPROFILE\gitstuff\mdbook_test"
$destdir = "$env:USERPROFILE\gitstuff\mdbook_test_build"
#$a = "$((Split-Path -Parent $origdir).FullName)\mdbook_test_build"
$srcdir = 'book'
# Temporarily set verbose preference
$VerbosePreference = 'Continue'

if (Test-Path book) { 
    write-host -fore yellow "./book dir found, running mdbook clean"
    # TODO implement DRY principle for this.  mdbook exe should be determined at beginning
    # of script.
    (gcm mdbook -erroraction ignore) ? (mdbook clean) : (throw "mdbook not on path")
}
if (get-command mdbook -ErrorAction ignore) { mdbook build } else { throw "mdbook not on path" }
if ($MakeTarfile) {
    (Test-Path $srcdir) ? (tar -acvf "mdbookout_$(Get-Date -Format FileDate).tar.xz" book/*) : (Write-Error "book dir not found")
}
if (Test-Path $destdir) {
    Write-Output "copying contents of book/* to ../mdbook_test_build"
    Copy-Item .\book\* -Destination ..\mdbook_test_build\ -Recurse -Force
    set-location $destdir && Write-host -fore yellow "Changed dir to mdbook_test_build"
    # Add switch for using git :complete:
    if ($Git) {
        git add . && git commit -m "Update site"
        git pull && git push && Write-host -fore yellow "pulling and pushing to site"
        cd $origdir && Write-Host -ForegroundColor Yellow "You are back in the starting dir $origdir"
    }
}
else { throw "../mdbook_test_build not found"
}

Write-Host -ForegroundColor cyan "Function complete!"

function buildsitenew {

$origdir = "$env:USERPROFILE\gitstuff\mdbook_test"
if ($args) { throw "args not implemented yet" }
if (Get-Item book -ErrorAction ignore) { throw "autoclean not implemented yet" }
if (gcm mdbook -ErrorAction ignore) { mdbook build } else { throw "mdbook not on path" }
#(test-path book) ? (bsdtar -acvf "mdbookout_$(get-date -Format FileDate).tar.xz" book/*) : (write-error "book dir not found")
if (Test-Path ..\mdbook_test_build\) {
    Write-Output "copying contents of book/* to ../mdbook_test_build"
    cp book/* -Destination ..\mdbook_test_build\ -Force
    cd ..\mdbook_test_build\ && Write-Output "Changed dir to mdbook_test_build"
    git add . && git commit -m "Update site"
    git pull && git push && Write-Output "pulling and pushing to site"
    cd $origdir && Write-Host -ForegroundColor Yellow "You are back in the starting dir $origdir"
    Write-Host -ForegroundColor Yellow "Function complete!"
}
else { throw "../mdbook_test_build not found" }

}

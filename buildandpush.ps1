#!pwsh
<#
.Description
Build and push
#>
(test-path ./buildsite.ps1) ? (./buildsite.ps1 -Git -Verbose) : (Write-error "./buildsite.ps1 not found")

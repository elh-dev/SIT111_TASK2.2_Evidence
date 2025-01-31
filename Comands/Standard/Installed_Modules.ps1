Write-Output '_____________________________________'
Write-Output ''
Write-Output '|          Module Info              |'
Write-Output ''
Write-Output '_____________________________________'

$Module = Read-Host -Prompt 'Module Name (PS2EXE)'
Get-Module -Name $Module -ListAvailable
Import-Module -Name $Module
Get-Command -Module $Module

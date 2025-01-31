Write-Output '_____________________________________'
Write-Output '|                                   |'
Write-Output '|        Uninstall Module           |'
Write-Output '|                                   |'
Write-Output '_____________________________________'

# Assigns moduel name and version to veriables 
$Module = Read-Host -Prompt 'Module Name (PS2EXE)'
$Version = Read-Host -Prompt 'Version (1.0.4)'

# Uninstalls the module specific to the version 
Uninstall-Module -Name $Module -RequiredVersion $Version

# Allows you to confirm if module is still present
Get-Module -Name $Module -ListAvailable


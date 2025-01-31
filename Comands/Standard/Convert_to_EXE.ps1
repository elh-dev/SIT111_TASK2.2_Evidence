function Menu{
    param(
        $text
    )
Write-Output '_____________________________________'
Write-Output '|                                   |'
Write-Output '|'+ $text +'|'
Write-Output '|                                   |'
Write-Output '_____________________________________'
}
Menu -text "      Conver to .ps1 to .exe        "
# Assigns moduel name and version to veriables 
$PathPS1 = Read-Host -Prompt 'Path to .ps1 (C:\Code\PowerShell_Code\Shell\Remove.ps1)'
$PathEXE = Read-Host -Prompt 'Path to .exe (C:\Code\PowerShell_Code\Shell\Remove.exe)'
if (Test-Path -Path $PathPS1) {
    ps2exe -inputFile $PathPS1 -outputFile $PathEXE
} else {
    Menu -text "     .ps1 does not exist.       "
    Write-Output "Try New Path"
    $PathPS1 = Read-Host -Prompt 'Path to .ps1'
}

# tests if exe was created 
if (Test-Path -Path $PathEXE) {
    Menu -text "     .exe Creation Succesfull     "
} else {
    Menu -text "          .exe Failed             "
}


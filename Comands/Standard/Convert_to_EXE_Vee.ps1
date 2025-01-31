function Menu {
    param(
        $text
    )
    $line = "_____________________________________"
    $empty = "|                                   |"
    $textLine = "|$($text.PadLeft(($text.Length + ($line.Length - 2 - $text.Length) / 2)).PadRight($line.Length - 1))|"
    Write-Output $line
    Write-Output $empty
    Write-Output $textLine
    Write-Output $empty
    Write-Output $line
}

Menu -text "      Convert .ps1 to .exe        "

# Assigns module name and version to variables 
$PathPS1 = Read-Host -Prompt 'Path to .ps1 (C:\Code\PowerShell_Code\Shell\Remove.ps1)'
$PathEXE = Read-Host -Prompt 'Path to .exe (C:\Code\PowerShell_Code\Shell\Remove.exe)'

# Log paths for debugging
Write-Output "Provided .ps1 path: $PathPS1"
Write-Output "Provided .exe path: $PathEXE"

if (Test-Path -Path $PathPS1) {
    Write-Output "Found .ps1 file: $PathPS1"
    ps2exe -inputFile $PathPS1 -outputFile $PathEXE -noConsole -debug
} else {
    Menu -text "     .ps1 does not exist.       "
    Write-Output "Try New Path"
    $PathPS1 = Read-Host -Prompt 'Path to .ps1'
}

# Tests if exe was created 
if (Test-Path -Path $PathEXE) {
    Menu -text "     .exe Creation Successful     "
} else {
    Menu -text "          .exe Failed             "
}

Write-Output "Script completed. Please check for any error messages above."


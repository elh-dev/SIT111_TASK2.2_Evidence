function Menu {
    param (
        [string]$text
    )

    $textLength = $text.Length
    $totalWidth = 35
    $leftPadding = [math]::Floor(($totalWidth - $textLength) / 2)
    $rightPadding = $totalWidth - $textLength - $leftPadding

    $topBottomBorder = '_____________________________________'
    $emptyLine = '|                                   |'
    $textLine = '|' + ' ' * $leftPadding + $text + ' ' * $rightPadding + '|'

    Write-Output $topBottomBorder
    Write-Output $emptyLine
    Write-Output $textLine
    Write-Output $emptyLine
    Write-Output $topBottomBorder
}

# Example usage
Menu -text "Add to Path"



# Assigns moduel name and version to veriables 
$Module = Read-Host -Prompt 'Module Name (PS2EXE)'

# Finds Module Path
$modulePath = (Get-Module -Name $Module -ListAvailable).ModuleBase

# Adds Path to Enviroment Variable
[Environment]::SetEnvironmentVariable("PATH", $env:PATH + ";$modulePath", [EnvironmentVariableTarget]::Machine)

# Verify the PATH
$env:Path

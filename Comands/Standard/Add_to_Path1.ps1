
#Menu Function 
function Menu {
    param (
        [string[]]$texts # An array of text lines
    )

    $totalWidth = 35
    $topBottomBorder = '_____________________________________'
    $emptyLine = '|                                   |'

    Write-Output $topBottomBorder
    Write-Output $emptyLine

    foreach ($text in $texts) {
        $textLength = $text.Length
        $leftPadding = [math]::Floor(($totalWidth - $textLength) / 2)
        $rightPadding = $totalWidth - $textLength - $leftPadding
        $textLine = '|' + ' ' * $leftPadding + $text + ' ' * $rightPadding + '|'
        Write-Output $textLine
    }

    Write-Output $emptyLine
    Write-Output $topBottomBorder
}


 # Loop for menu
do {
    # Select Menu
    Menu -texts @("1: EXAMPLE", "2: EXAMPLE", "0: Exit")

    $option = Read-Host "ENTER"
    if ($option -eq '0') {
        return 
    }
    if ($option -eq '1') {
       


        # Title Menu
        Menu -texts @("Add to Path")
        
        # Menu Select
        Menu -texts @("1: Add to Path", "0: Exit")

        # Check if running as administrator
        if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Menu -text "Please run PowerShell as Administrator"
            exit
        }

        # Assigns module name and version to variables
        $Module = Read-Host -Prompt 'Module Name (PS2EXE)'

        # Finds Module Path
        $module = Get-Module -Name $Module -ListAvailable

        if ($module) {
            $modulePath = $module.ModuleBase

            # Adds Path to Environment Variable
            [Environment]::SetEnvironmentVariable("PATH", $env:PATH + ";$modulePath", [EnvironmentVariableTarget]::Machine)

            # Verify the PATH
            $newPath = $env:PATH

            Menu -text "Module Path Added Successfully"

            # Display the new PATH
            Write-Output "New PATH: $newPath"

        } else {
            Menu -text "Module Not Found"
        }
        }

} while (
    $option -ne "0"    
)
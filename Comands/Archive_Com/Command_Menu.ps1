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

do {
    # Displaying the menu
    Menu -text "Command Menu"

    Write-Output "1. PowerOff"
    Write-Output "2. Restart"
    Write-Output "3. Exit"

    # User Input
    $choice = Read-Host -Prompt 'Enter your choice (1/2/3)'

    # Conditional Execution
    switch ($choice) {
        1 {
            . "C:/Code/PowerShell_Code/comands/PowerOff.ps1"
        }
        2 {
            . "C:/Code/PowerShell_Code/comands/Restart.ps1"
        }
        3 {
            Menu -text "Goodbye!"
            break
        }
        default {
            Write-Output "Invalid choice. Please try again."
        }
    }

    Write-Output "Returning to the main menu..."
    Start-Sleep -Seconds 2

} while ($choice -ne 3)

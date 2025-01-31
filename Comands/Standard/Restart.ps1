function Menu {
    param (
        [string]$text,
        [string]$text2 = $null
    )

    $textLength = $text.Length
    $totalWidth = 35
    $leftPadding = [math]::Floor(($totalWidth - $textLength) / 2)
    $rightPadding = $totalWidth - $textLength - $leftPadding

    $topBottomBorder = '_____________________________________'
    $emptyLine = '|                                   |'
    $textLine = '|' + ' ' * $leftPadding + $text + ' ' * $rightPadding + '|'

    $text2Length = if ($text2) { $text2.Length } else { 0 }
    $leftPadding2 = if ($text2) { [math]::Floor(($totalWidth - $text2Length) / 2) } else { 0 }
    $rightPadding2 = if ($text2) { $totalWidth - $text2Length - $leftPadding2 } else { 0 }
    $textLine2 = if ($text2) { '|' + ' ' * $leftPadding2 + $text2 + ' ' * $rightPadding2 + '|' } else { $null }

    Write-Output $topBottomBorder
    Write-Output $emptyLine
    Write-Output $textLine
    if ($text2) {
        Write-Output $textLine2
    }
    Write-Output $emptyLine
    Write-Output $topBottomBorder
}

# Display initial menu
Menu -text "Restart"

# Prompt the user for confirmation before restarting
Menu -text "1: Confirm" -text2 "0: Deny"

$userConfirmation = Read-Host -Prompt "Are you sure you want to restart the computer? (1: Confirm / 0: Deny)"

# Check the user's response
if ($userConfirmation -eq "1") {
    # Initiate the restart
    Restart-Computer -Force
    Write-Output "The computer is restarting..."
} else {
    Write-Output "Restart aborted."
}

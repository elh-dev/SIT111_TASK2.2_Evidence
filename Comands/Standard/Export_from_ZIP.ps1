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
Menu -text 'Extract from ZIP'
$SourceDirectory = Read-Host -prompt 'Source Directory'
$DestinationDirectory= Read-Host -prompt 'Destination Directory'

Expand-Archive -Path $SourceDirectory -DestinationPath $DestinationDirectory

# tests if exe was created 
if (Test-Path -Path $DestinationDirectory) {
    Menu -text "Extract Succesfull"
} else {
    Menu -text "Extract Failed"
}
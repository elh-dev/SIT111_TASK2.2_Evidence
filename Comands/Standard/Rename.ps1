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
Menu -text "Rename"

# Ask whether the user wants to rename a file or a folder
$type = Read-Host -Prompt 'Are you renaming a file or a folder? (file/folder)'

# Assign variables
$OldName = Read-Host -Prompt "Path to $type (e.g., C:\Code\Rust\Old_Name)"
$NewName = Read-Host -Prompt "New Name or Path (e.g., New_Name or C:\Code\Rust\New_Name)"

# Check if the path exists and is a file or folder
if (Test-Path -Path $OldName) {
    if ($type -eq 'file' -and (Get-Item -Path $OldName).PSIsContainer -eq $false) {
        # Renames the file
        Rename-Item -Path $OldName -NewName $NewName
        # Confirmation message
        Menu -text "File Renamed Successfully"
    } elseif ($type -eq 'folder' -and (Get-Item -Path $OldName).PSIsContainer -eq $true) {
        # Renames the folder
        Rename-Item -Path $OldName -NewName $NewName
        # Confirmation message
        Menu -text "Folder Renamed Successfully"
    } else {
        # Error message if the type doesn't match
        Menu -text "The specified $type was not found at the given path"
    }
} else {
    # Error message if the path doesn't exist
    Menu -text "Path Not Found"
}

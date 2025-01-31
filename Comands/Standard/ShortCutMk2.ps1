

# Menu select between options 
Write-Output('== Menu ==')
Write-Output('')
$option = Read-Host -Prompt 'Type 1 for Application Shortcut or 2 for Directory'

# Directory or Application Gate
if ($option -eq 1) {
    # Defines the path for the shortcut and name of shortcut.lnk or .url
    $shortcutPath = Read-Host -Prompt 'Enter full path of desired shortcut location e.g., (C:\Users\edwar\OneDrive\Desktop\Shortcut.lnk)'

    # Defines the target Application
    $targetPath = Read-Host -Prompt 'Enter full path of desired Application e.g., ("C:\Program Files\Oracle\VirtualBox\VirtualBox.exe")'
}
else {
    # Defines the path for the shortcut and name of shortcut.lnk or .url
    $shortcutPath = Read-Host -Prompt 'Enter full path of desired shortcut location e.g., (C:\Users\edwar\OneDrive\Desktop\Shortcut.lnk)'

    # Defines the target Directory
    $targetPath = Read-Host -Prompt 'Enter full path of desired Directory e.g., (C:\Code)' 
}


# Create a COM object for WScript Shell used to execute applications
$WScriptShell = New-Object -ComObject WScript.Shell

# Create the shortcut
$shortcut = $WScriptShell.CreateShortcut($shortcutPath)

# Set the shortcut properties
$shortcut.TargetPath = $targetPath

# Directory or Application Gate
if ($option -eq 1) {

    # Defines Directory exe is from
    $WorkingDir = Read-Host -Prompt "Enter the working directory e.g., (C:\Program Files\Oracle\VirtualBox)"
}
else {
    # Defines Working Directory as the Directory previously stated 
    $WorkingDir = $targetPath
}

$shortcut.WorkingDirectory = $WorkingDir

$shortcut.WindowStyle = 1
$shortcut.IconLocation = "$targetPath, 0"
$shortcut.Save()

Write-Output "Shortcut created successfully at $shortcutPath"

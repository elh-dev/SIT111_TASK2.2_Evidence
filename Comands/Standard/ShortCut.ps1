# Define the path for the shortcut
$shortcutPath = "$env:USERPROFILE\Documents\PowerShell.lnk"

# Define the target application
$targetPath = "C:\Code\PowerShell-7.4.6-win-x64\pwsh.exe"

# Create a COM object for WScript Shell used to execute aplications
$WScriptShell = New-Object -ComObject WScript.Shell

# Create the shortcut
$shortcut = $WScriptShell.CreateShortcut($shortcutPath)

# Set the shortcut properties
$shortcut.TargetPath = $targetPath
#directory aplicastion is from
$shortcut.WorkingDirectory = "C:\Code\PowerShell-7.4.6-win-x64"
$shortcut.WindowStyle = 1
$shortcut.IconLocation = "$targetPath, 0"
$shortcut.Save()

Write-Output "Shortcut created successfully at $shortcutPath"

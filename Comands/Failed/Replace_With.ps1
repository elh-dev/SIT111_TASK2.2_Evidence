# Path to your PowerShell script file
$filePath = "C:\Code\PowerShell_Code\DND_Mk1.ps1"

# Read the content of the file
$content = Get-Content $filePath

# Replace all instances of $Enemy_1[$i][x] with $Enemy_1[$i][0][x]
$content = $content -replace '\$Enemy_1

\[\$i\]



\[([0-9]+)\]

', '$Enemy_1[$i][0][$1]'

# Output modified content for debugging 
Write-Output "Modified Content:" 
Write-Output $content

# Path to the new file where you want to save the modified content 
$newFilePath = "C:\Code\PowerShell_Code\Modified_Successfully.ps1" 

# Write the updated content to the new file 
Set-Content $newFilePath -Value $content

# Error indicator 
if (Test-Path $newFilePath) { # indicates NO Error
    Write-Output "New File Created: $newFilePath"
} else { # indicates Error
    Write-Output "Error: The new file was not created."
}

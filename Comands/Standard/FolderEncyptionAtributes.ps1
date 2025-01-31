$folderPath = "C:\Users\edwar\OneDrive\Desktop\test"


# Check encryption status
Get-ChildItem -Recurse -Path $folderPath | ForEach-Object {
    $isEncrypted = $_.Attributes -band [System.IO.FileAttributes]::Encrypted
    if ($isEncrypted) {
        Write-Host "$($_.FullName) is encrypted."
    } else {
        Write-Host "$($_.FullName) is not encrypted."
    }
}

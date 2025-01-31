

# Define the folder path
$folderPath = Read-Host -prompt 'Enter Full Path of Folder'

# Encrypt the folder and its contents
Get-ChildItem -Recurse -Path $folderPath | ForEach-Object {
    try {
        $secureString = ConvertTo-SecureString -String "YourPassword" -AsPlainText -Force
        $encryptedContent = Protect-CmsMessage -Content $_.FullName -To $secureString
        Write-Host "$($_.FullName) is encrypted."
    } catch {
        Write-Host "Failed to encrypt $($_.FullName): $_"
    }
}

<# Encrypt the folder and its contents
Get-ChildItem -Recurse -Path $folderPath | ForEach-Object {
    try {
        $_.Encrypt()
        $isEncrypted = $_.Attributes -band [System.IO.FileAttributes]::Encrypted
        if ($isEncrypted) {
            Write-Host "$($_.FullName) is encrypted."
        } else {
            Write-Host "$($_.FullName) is NOT encrypted."
        }
    } catch {
        Write-Host "Failed to encrypt $($_.FullName): $_"
    }
}#>

# Confirm encryption
Get-ChildItem -Recurse -Path $folderPath | ForEach-Object {
    $isEncrypted = $_.Attributes -band [System.IO.FileAttributes]::Encrypted
    Write-Host "$($_.FullName) encryption status: $isEncrypted"
}

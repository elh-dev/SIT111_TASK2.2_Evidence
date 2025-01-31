
# retrive OS version and save under veriable 
$osVersion = Get-ComputerInfo | Select-Object -ExpandProperty WindowsVersion

# retives the system up time and save under veriable
$uptime = (Get-CimInstance Win32_operatingSystem).LastBootUpTime

# retives avalible disc space and saved under veriable
$diskSpace = Get-PSDrive -PSProvider FileSystem | Select-Object -Property Name, @{
    Name="FreeSpaceGB";Expression={
        [math]::round($_.Free/1GB,2)
    }
}, @{
    Name="UsedSpaceGB";Expression={
        [math]::round(($_.Used/1GB),2)
    }
}, @{
    Name="TotalSpaceGB";Expression={
        [math]::round(($_.Used + $_.Free)/1GB,2)
    }
}    
            
        

# print details 

Write-Output "System Information" 
Write-Output "--------------------" 
Write-Output "Operating System Version: $osVersion" 
Write-Output "System Uptime: $([DateTime]::Now - $uptime)" 
Write-Output "Available Disk Space:" 
$diskSpace | Format-Table -AutoSize -Property Name, FreeSpaceGB, UsedSpaceGB, TotalSpaceGB



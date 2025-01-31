Write-Output '1: Force'
Write-Output '2: Multiple Files of same kind'
Write-Output '3: Recursive delete all subdirectories'
Write-Output '0: Normal'
$option = Read-Host -Prompt 'ENTER'
$Path = Read-Host -Prompt "Enter Full Path of Directory"

# Call the shell script and pass the variable as an argument
$shellScriptPath = "C:\Code\PowerShell_Code\Shell\TakeOwnership.sh"
$bashPath = "C:\Program Files\Git\bin\bash.exe"  # Adjust this path to where bash is installed on your system

# Ensure the shell script exists and run it
if (Test-Path $shellScriptPath) {
    if (Test-Path $bashPath) {
        Start-Process $bashPath -ArgumentList "$shellScriptPath $Path" -NoNewWindow -Wait
    } else {
        Write-Output "bash executable not found at path: $bashPath"
        exit
    }
} else {
    Write-Output "Shell script not found at path: $shellScriptPath"
    exit
}

function test {
    param ($test, $recurse, $force)

    try {
        if ($recurse -and $force) {
            # Delete only contents of the directory, not the directory itself
            Get-ChildItem -Path $test -Recurse -Force | Remove-Item -Recurse -Force
        } elseif ($force) {
            Get-ChildItem -Path $test -Force | Remove-Item -Force
        } elseif ($recurse) {
            Get-ChildItem -Path $test -Recurse | Remove-Item -Recurse
        } else {
            Get-ChildItem -Path $test | Remove-Item
        }
        Write-Output "Successfully deleted contents of: $test"
    } catch {
        Write-Output "Failed to delete contents of: $test. Error: $_"
        # Additional logging or handling can be done here
    }
}

switch ($option) {
    0 { test -test $Path }
    1 { test -test $Path -force $true }
    2 { Write-Output "Option 2: Multiple Files of same kind is not yet implemented." }
    3 { test -test $Path -recurse $true -force $true }
}

Write-Output "Done"

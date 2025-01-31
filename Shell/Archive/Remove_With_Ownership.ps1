Write-Output '1: Force'
Write-Output '2: Multiple Files of same kind'
Write-Output '3: Recursive delete all subdirectories'
Write-Output '0: Normal'
$option = Read-Host -Prompt 'ENTER'
$Path = Read-Host -Prompt "Enter Full Path of File or Directory"

# Call the shell script and pass the variable as an argument
Start-Process "TakeOwnership.sh" -ArgumentList "C:\Code\PowerShell_Code\Shell\TakeOwnership.sh $Path"


function test {
    param ($test, $recurse, $force)

    try {
        if ($recurse -and $force) {
            Remove-Item -Path $test -Recurse -Force
        } elseif ($force) {
            Remove-Item -Path $test -Force
        } elseif ($recurse) {
            Remove-Item -Path $test -Recurse
        } else {
            Remove-Item -Path $test
        }
        Write-Output "Successfully deleted: $test"
    } catch {
        Write-Output "Failed to delete: $test. Error: $_"
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



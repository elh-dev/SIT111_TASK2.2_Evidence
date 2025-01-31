Write-Output '1: Force'
Write-Output '2: Multiple Files of same kind'
Write-Output '3: Recursive delete all subdirectories'
Write-Output '0: Normal'
$option = Read-Host -prompt 'ENTER'
$Path = Read-Host -prompt "Enter Full Path of File or App"
function test {
    param ($test)

    Remove-Item -Path $test
}
if ($option -eq 0) {

    $test = $Path
}
if ($option -eq 3) {

    $test = $Path -Recurse -Force
}
test -test $test
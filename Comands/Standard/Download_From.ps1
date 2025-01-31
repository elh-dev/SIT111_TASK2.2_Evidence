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
Menu -text "Download from"

# Assigns Uri to variables 
$Uri = Read-Host -Prompt 'Uri (default: https://win.rustup.rs/)' -DefaultValue 'https://win.rustup.rs/'
$Outfile = Read-Host -Prompt 'Outfile (default: rustup-init.exe)' -DefaultValue 'rustup-init.exe'
$FilePath = ".\$Outfile"

# Adds Path to Environment Variable and install Rust
Invoke-WebRequest -Uri $Uri -OutFile $Outfile
Start-Process -Wait -FilePath $FilePath -ArgumentList "-y"

# Add to the current User PATH
$Env:PATH += ";$Env:USERPROFILE\.cargo\bin"

# Check Rust version
$menu = rustc --version

Menu -text $menu

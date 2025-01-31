function Convert-HEICtoPNG {
    param (
        [string]$inputFile,
        [string]$outputFile
    )

    $convertCommand = "magick ""$inputFile"" ""$outputFile"""
    Invoke-Expression $convertCommand
}


# Function to Display Menu
function Menu {
    param (
        [string[]]$texts # An array of text lines
    )
    $totalWidth = 35
    $topBottomBorder = '_____________________________________'
    $emptyLine = '|                                   |'
    Write-Output $topBottomBorder
    Write-Output $emptyLine
    foreach ($text in $texts) {
        $textLength = $text.Length
        $leftPadding = [math]::Floor(($totalWidth - $textLength) / 2)
        $rightPadding = $totalWidth - $textLength - $leftPadding
        $textLine = '|' + ' ' * $leftPadding + $text + ' ' * $rightPadding + '|'
        Write-Output $textLine
    }
    Write-Output $emptyLine
    Write-Output $topBottomBorder
}

Do {
    # Menu Screen
    Menu -texts @("HEIC to PNG")
    # Select Menu
    Menu -texts @("1: File", "2: Folder", "0: Exit")
    # Option to Convert Single File or Entire Folder
    $conversionOption = Read-Host "ENTER"

    # Single File Conversion
    if ($conversionOption -eq '1'){
        $inputFile = Read-Host "Path To HEIC File"  # Replace with your HEIC file path
        $outputFile = Read-Host "Path To PNG"  # Replace with your desired PNG file path
        Convert-HEICtoPNG -inputFile $inputFile -outputFile $outputFile
        Menu -texts @("Converted")
    }
    elseif ($conversionOption -eq '2'){
        $inputFolder = Read-Host "Path To Folder Containing HEIC Files"  # Replace with your input folder path
        $outputFolder = Read-Host "Path To Save PNG Files"  # Replace with your desired output folder path

        # Check if the output folder exists, if not, create it
        if (-not (Test-Path -Path $outputFolder)) {
            New-Item -ItemType Directory -Path $outputFolder
        }

        # Convert each HEIC file in the folder
        Get-ChildItem -Path $inputFolder -Filter *.heic | ForEach-Object {
            $inputFile = $_.FullName
            $outputFile = Join-Path -Path $outputFolder -ChildPath ($_.BaseName + ".png")
            Convert-HEICtoPNG -inputFile $inputFile -outputFile $outputFile
            Write-Output "Converted: $inputFile to $outputFile"
        }
        Menu -texts @("Converted")
    }
    elseif ($conversionOption -eq '0'){
        Menu -texts @("BYE")
        return
    }
    else {
        Write-Output "Invalid option selected."
    }
} while ($conversionOption -ne '0')

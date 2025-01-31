# Menu Function
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

do {
    # Displaying the menu
    Menu -texts @("Command Menu")

    # Define the options
    Menu -texts @(
        "1. Standard",
        "2. Converter",    # Added comma
        "0: EXIT"
    )

    # Commented out or define DisplayOptions function
    # Define the options (Optional)
    # DisplayOptions -options $options 

    # User Input
    $choice1 = Read-Host -Prompt "ENTER"
    
    switch ($choice1) {
        1 { 
            Menu -texts @(
                "Standard",
                "",
                "1. PowerOff",
                "2. Restart",
                "3. Rename",
                "4. Move Item",
                "5. Add to Path",
                "6. Export from ZIP",
                "7. Installed Modules",
                "8. ShortCutMk2",
                "9. Folder Encryption Attributes",
                "0: EXIT")
        }
        2 {
            Menu -texts @(
                "Converters",
                "",
                "1: HEIC_to_PNG",
                "0: EXIT"
            ) 
        }
    }
    
    $choice2 = Read-Host -Prompt "ENTER"

    # Conditional Execution
    if ($choice1 -eq "1") {
        switch ($choice2) {
            1 {
                . "C:\Code\PowerShell_Code\Comands\Standard\PowerOff.ps1"  # Corrected
            }
            2 {
                . "C:/Code/PowerShell_Code/Commands/Standard/Restart.ps1"  # Corrected
            }
            3 {
                . "C:/Code/PowerShell_Code/Commands/Standard/Rename.ps1"  # Corrected
            }
            4 {
                . "C:/Code/PowerShell_Code/Commands/Standard/Move_Item.ps1"  # Corrected
            }
            5 {
                . "C:/Code/PowerShell_Code/Commands/Standard/Add_to_Path1.ps1"  # Corrected
            }
            6 {
                . "C:/Code/PowerShell_Code/Commands/Standard/Export_from_ZIP.ps1"  # Corrected
            }
            7 {
                . "C:/Code/PowerShell_Code/Commands/Standard/Installed_Modules.ps1"  # Corrected
            }
            8 {
                . "C:/Code/PowerShell_Code/Commands/Standard/ShortCutMk2.ps1" # Corrected
            }
            9 {
                . "C:/Code/PowerShell_Code/Commands/Standard/FolderEncryptionAttributes.ps1"  # Corrected
            }
            0 {
                Menu -texts @("Goodbye!")
                break  # Added break in both places
            }
            default {
                Write-Output "Invalid choice. Please try again."
            }
        }
    } elseif ($choice1 -eq "2") {
        switch ($choice2) {
            1 {
                . "C:/Code/PowerShell_Code/Commands/Converters/HEIC_to_PNG_ConverterMk2.ps1"  # Corrected
            }
            0 {
                Menu -texts @("Goodbye!")
                break  # Added break in both places;
            }
            default {
                Write-Output "Invalid choice. Please try again."
            }
        }
    } 
} while ($choice1 -ne "0") # Correct choice variable

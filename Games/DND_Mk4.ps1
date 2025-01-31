# Initialize player and enemy data
$Player_1 = @(
    
    @(
        14, # Armor Rating
        30, # Health Current
        30, # Health Upper
        10, # Upper Hit
        1,  # Lower Hit
        10, # Attack Bonus
        10, # Damage Bonus
        "Player" # NAME
    ),
    @("Weapon", "Armor", "Gold") # equipment
    
)
$Enemy_1 = @(
    @(
        @(10, 30, 30, 10, 1, 3, 3, "1"),
        @("Weapon", "Armor", "Gold")
    ),
    @(
        @(10, 30, 30, 10, 1, 3, 3, "2"),
        @("Weapon", "Armor", "Gold")
    ),
    @(
        @(10, 30, 30, 10, 1, 3, 3, "3"),
        @("Weapon", "Armor", "Gold")
    ),
    @(
        @(10, 30, 30, 10, 1, 3, 3, "4"),
        @("Weapon", "Armor", "Gold")
    )
)
$Enemy_Dead = @(
    @(
        @(0, 0, 0, 0, 0, 0, 0, "DEAD"),
        @("Empty", "Empty", "Empty")
    ),
    @(
        @(0, 0, 0, 0, 0, 0, 0, "DEAD"),
        @("Empty", "Empty", "Empty")
    ),
    @(
        @(0, 0, 0, 0, 0, 0, 0, "DEAD"),
        @("Empty", "Empty", "Empty")
    ),
    @(
        @(0, 0, 0, 0, 0, 0, 0, "DEAD"),
        @("Empty", "Empty", "Empty")
    )
)
function Debug {
    param(
        [int]$veriable,
        [string] $text
    )
    #debug
    if ($debug -eq 1) {
        Write-Host $text ": " $veriable
    }
}
function Debug_String {
    param(
        [string]$veriable,
        [string] $text
    )
    #debug
    if ($debug -eq 1) {
        Write-Host $text ": " $veriable
    }
}
function Dice {
    param (
        $Player_Name,
        $Roll
    )
    Write-Output "__________________________"
    Write-Output ""
    Write-Host "$Player_Name Roll: $Roll"
    Write-Output ""
    Write-Output "___________________________"
}
function Miss {
    Write-Output "____________________________"
    Write-Output ""
    Write-Output "           Miss "
    Write-Output ""
    Write-Output "____________________________"
}
function HIT {
    param (
        $text
    )
    Write-Output "____________________________"
    Write-Output ""
    Write-Host "          " $text
    Write-Output ""
    Write-Output "____________________________"
}
function Roll {
    param (
        [int] $Roll,
        [string] $string
    )
    Write-Output "____________________________"
    Write-Output ""
    Write-Host "$string $Roll"
    Write-Output ""
    Write-Output "____________________________"
}
function Kill1 {
    param (
        [string] $Enemy_Name
    )
    Write-Output "____________________________ "
    Write-Output ""
    Write-Host $Enemy_Name ": DEAD"
    Write-Output ""
    Write-Output "____________________________ "
}
# Lists dead enemies
function DeadList {
    param(
        [array] $Enemy_Dead
    )
    Write-Output ''
        Write-Output 'Defeated Enemies:'
    for ($i = 0; $i -lt $Enemy_Dead.Count; $i++) {
        
        if ($Enemy_Dead[$i][0][7] -ne "DEAD") {

            Write-Output $Enemy_Dead[$i][0][7]
        }
     }
     Write-Output ''
     Write-Output '______________________________________'
 
}
# Displayed Enemy Health Points
function Enemy_HP {
    param (
        [int] $Enemy_HP,
        [string] $Enemy_Name
    )
    Write-Output "____________________________ "
    Write-Output ""
    Write-Host "$Enemy_Name HP: $Enemy_HP"
    Write-Output ""
    Write-Output "____________________________ "
}
# Returns Debug Option 
function Debug_Option {
    # Veriable for Debug Funtion 
    $debug = 0

    # Debug Menu and select  
    $debug = Read-Host -Prompt '1 for debug 0 for standard'

    # Loop until the user selects either 0 or 1
    while ($debug -ne 0 -and $debug -ne 1) {
        # Prompt the user for input
        $debug = Read-Host -Prompt "Please enter 0 or 1"
        
        # Check if the input is valid (0 or 1)
        if ($debug -ne 0 -and $debug -ne 1) {
            Write-Output "Invalid selection. Please enter 0 or 1."
        }
    }
    return [int]$debug
}
# Returns Exit Game Option
function Exit_Game {

    $Exit_Option = Read-Host -prompt '1 to QUIT 0 to Continue'

    while ($Exit_Option -ne 0 -and $Exit_Option -ne 1) {
        # Prompt the user for input
        $Exit_Option = Read-Host -Prompt "Please enter 0 or 1"
        
        # Check if the input is valid (0 or 1)
        if ($Exit_Option -ne 0 -and $Exit_Option -ne 1) {
            Write-Output "Invalid selection. Please enter 0 or 1."
        }
    }
    
    return [Int]$Exit_Option
     
}
# Returns Off Option
function Off {
    do {

        $Off = Read-Host -Prompt "1 = Off 0 = On"

    } while ($Off -ne 0 -and $Off -ne 1)
    return [int]$Off
}
function Roll_D20 {
    do {

        # Manual Roll
        $Roll = Read-Host -Prompt "ENTER Roll"

    } while ($Roll -lt 1 -or $Roll -gt 20)

    return [int]$Roll
}
function Roll_DamageD {
    param (
        [int]$Roll_Lower,
        [int]$Roll_Upper
    )
    do {

        # Manual Roll
        $Roll = Read-Host -Prompt "ENTER Manual Roll"
        Debug -veriable $Roll -text "Player Damage Roll ENTERED"

    } while  ($Roll -lt $Roll_Lower -or $Roll -gt $Roll_Upper) 
    return [int]$Roll
}
#
function Hit_Roll {
    
    # Manual
    if ($option -eq 1) {

        # Manual Roll
        $Roll = Roll_D20    
    }

    # Auto
    elseif ($option -eq 0) {

        $Roll = Get-Random -Minimum 1 -Maximum 20

        Debug -veriable $Roll -text "Player Attack Roll Unaltered"
    }

    return [int]$Roll
}
# 1st Roll Manual or Auto decision and  Loop 
function Damage_Roll {
    param(
      [int] $Roll_Upper,
      [int] $Roll_Lower 
    )
    
    # Manual
    if ($option -eq 1) {

        # Manual Roll
        $Roll = Roll_DamageD -Roll_Lower $Roll_Lower -Roll_Upper $Roll_Upper
    }

    # Auto
    elseif ($option -eq 0) {

        $Roll = Get-Random -Minimum $Roll_Lower -Maximum $Roll_Upper

        Debug -veriable $Roll -text "Player Damage Roll Unaltered"
    }
    return [int]$Roll
}
# 2nd Hit Roll Funtion 
function Damage_Roll2 {
    param (
        [array] $Player_1
    )
    # Sets Players Upper and Lower Dice Range to variables 
    $Roll_Lower = $Player_1[0][4]
    $Roll_Upper = $Player_1[0][3]
            
    # Debug Upper And Lower Dice Range 
    Debug -veriable $Roll_Lower -text "Roll Lower Limit"
    Debug -veriable $Roll_Upper -text "Roll Upper Limit"
            
    # Damage Calculations ROLL using player's dice range
    $Damage_Roll1 = Damage_Roll -Roll_Upper $Roll_Upper -Roll_Lower $Roll_Lower  
   
    # Debug Damage Roll
    Debug -veriable $Damage_Roll1 -text 'Player Damage Roll Unaltered'
    
    #Sets Variable to Players Damage Bonus 
    $Damage_Bonus = $Player_1[0][6]

    # Calculate Damage after adding Bonus
    $Damage = $Damage_Roll1 + $Damage_Bonus

    return [int]$Damage
}
# MAIN
# Calculates Hit Details and Displays to Screen 
function Hit_Screen {
    param(
        [int]$i,
        [array]$Player_1,
        [array]$Enemy_1,
        [array]$Enemy_Dead

    )
    
    # Calculate Damage after adding Bonus
    $Damage = Damage_Roll2 -Player_1 $Player_1
            
    # Debug Damage
    Debug -veriable $Damage -text "Damage Roll After Damage Bonus"
            
    # Roll Display
    Roll -Roll $Damage -string "Damage: "

    # Set enemy HP to variable
    $Enemy_HP = $Enemy_1[$i][0][1]

    # Sets Enemy Name to Variable
    $Enemy_Name = $Enemy_1[$i][0][7]

    # Sets variable to Enemy's new HP
    $Enemy_HP1 = ($Enemy_HP - $Damage)

    # debug HP
    Debug -veriable $Enemy_HP1 -text "Enemy HP after damage calc"

    # Damaged Enemy Info
    if ($Enemy_HP1 -ge 1) {

        # Display Enemy's HP
        Enemy_HP -Enemy_HP $Enemy_HP1 -Enemy_Name $Enemy_Name

        # Reduce Enemy's Saved HP
        $Enemy_1[$i][0][1] = $Enemy_HP1
    }

    # Kill Enemy
    else {

        # Save dead enemy to jagged array
        $Enemy_Dead[$i][0][7] = $Enemy_Name

        #Kill Screen
        Kill1 -Enemy_Name $Enemy_Name

        Debug_String -veriable $Enemy_Dead[$i][0][7] -text "Dead Enemy Name"
                
        # Remove enemy from active list (by marking it as dead
        $Enemy_1[$i][0][7] = "DEAD"

        Debug_String -veriable $Enemy_1[$i][0][7] -text 'Enemy' $Enemy_Name 'Dead'
                
        # print dead npc details 
        DeadList -Enemy_Dead $Enemy_Dead
    }
}
function test {
    param (
        [int]$i,
        [array]$Player_1,
        [array]$Enemy_1,
        [int]$Roll,
        [array]$Test_Array
    )

    $Temp_Array = @{
        'Roll' = 0
        'Attack_Bonus' = 0
        'AC' = 0
    }
   
    Debug -veriable $Player_1[0][5] -text 'Player Attack Bonus in player array'

    # Adds Attack Bonus to Attack roll
    $Attack_Bonus = [int]$Player_1[0][5]

    Debug -veriable $Attack_Bonus -text 'Player Attack Bonus'

    $Temp_Array['Attack_Bonus'] = $Attack_Bonus
                
    # Debug Player Attack Bonus
    Debug -veriable $Temp_Array['Attack_Bonus'] -text "Player Attack Bonus In temp Array"

    #Sets veriable to  Players Roll With Bonus Added

    $Temp_Array['Roll'] = [int]($Roll + $Temp_Array['Attack_Bonus'])
    # Debug Attack Roll With Bonus
    Debug -veriable $Temp_Array['Roll'] -text "Player Attack Roll + Attack Bonus in array"
        
    # Roll Details     
    Dice -Player_Name $Player_1[0][7] -Roll $Roll

    # Set variable Armor rating to Enemy's armor rating
    $AC = $Enemy_1[$i][0][0]
    $Temp_Array['AC'] = [int]$AC

    # Debug Enemy AC
    
    Debug -veriable $Temp_Array['AC'] -text "Enemy AC in Temp_Array"
    return $Temp_Array

}


# Veriable for quite funtion 
$Off = 0

# Veriable for Roll Funtion 
$Roll = -1

$debug = Debug_Option
# Exit 
$Exit_Game1 = 0

# Loop to repeat game
do {

    # Loop for combat round
    for ($i = 0; $i -lt $Enemy_1.Count -and $Exit_Game1 -ne 1; $i++) {

        # Ensure the next loop iteration skips null or dead enemies
        if ($Enemy_1[$i][0][7] -ne "DEAD") {
                    
            # Menu Manual or Auto
            do {
                
                # Option Decid
                $option = Read-Host -Prompt "1 = Manual 0 = Auto"
                
                # Roll
                $Roll = Hit_Roll

            } while ($option -ne 0 -and $option -ne 1)

            $Test_Array = test -i $i -Player_1 $Player_1 -Enemy_1 $Enemy_1 -Roll $Roll
            
            debug -veriable $Test_Array['Roll'] -text 'Roll in test array'
            # Miss Option
            if ($Test_Array["AC"] -ge $Test_Array["Roll"]) {

                # Function Displaying miss message
                Miss
            } else {
                
                # Hit Option
                HIT -text "HIT"
                Hit_Screen -i $i -Player_1 $Player_1 -Enemy_1 $Enemy_1 -Enemy_Dead $Enemy_Dead
            }
        
        }
    }   
    
    # Off Selection loop
    $Off = Off
    
} while ($Off -eq 0 -or $Off1 -eq1)

<#

LIST OF SYSTEM.CONSOLE COMMANDS
________________________________

#>



#Reading Input
# ReadKey: Reads the next key pressed by the user, without displaying it on the console.
$keyInfo = [System.Console]::ReadKey($true)

# ReadLine: Reads a line of text input from the user.
$userInput = [System.Console]::ReadLine()

#Writing Output
# Write and WriteLine: Output text to the console.
[System.Console]::Write("This will be displayed without a newline.")
[System.Console]::WriteLine("This will be displayed with a newline.")

#Cursor Control
# SetCursorPosition: Move the cursor to a specified position in the console.
[System.Console]::SetCursorPosition(0, 10)

# CursorVisible: Control the visibility of the cursor.
[System.Console]::CursorVisible = $false

# Console Colors
# ForegroundColor and BackgroundColor: Change the text and background colors.
[System.Console]::ForegroundColor = [System.ConsoleColor]::Cyan

# ResetColor: Reset to the default console colors.
[System.Console]::ResetColor()

#Clearing the Consol
# Clear: Clears the console screen.
[System.Console]::Clear()

#Buffer and Windwow Size
# BufferWidth and BufferHeight: Set or get the dimensions of the buffer.
[System.Console]::BufferWidth = 120

# WindowWidth and WindowHeight: Set or get the dimensions of the window.
[System.Console]::WindowWidth = 80

#Redirecting Output
# SetOut: Redirect console output to a file.
$sw = [System.IO.StreamWriter]::new("output.txt")
[System.Console]::SetOut($sw)

#BEEP
# Beep: Produces a beep sound from the console.
[System.Console]::Beep()











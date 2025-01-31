# Define the questions and answers
$questions = @{
    "What is my name" = @("Edward", "Edward Healy", "elh-dev")
    "Are dragons cool" = @("yes", "stupid question")
    
}

# Initialize score
$score = 0

# Loop through each question
foreach ($question in $questions.Keys) {
    # Ask the question and get the user's answer
    $userAnswer = Read-Host -Prompt $question

    # Check if the answer is correct
    if ($questions[$question] -icontains $userAnswer) {
        Write-Output "Correct!"
        $score++
    } else {
        Write-Output "Incorrect. The correct answer is: $($questions[$question] -join ', ')"
        # Prompt the user for confirmation before shutting down
$userConfirmation = Read-Host -Prompt "Are you sure you want to shut down the computer? (yes/no)"

# Check the user's response
if ($userConfirmation -eq "yes") {
    # Initiate the shutdown
    Stop-Computer -Force
    Write-Output "The computer is shutting down..."
} else {
    Write-Output "Shutdown aborted."
}

    }
    Write-Output ""
}

# Display the final score
Write-Output "Game over! Your final score is $score out of $($questions.Count)."

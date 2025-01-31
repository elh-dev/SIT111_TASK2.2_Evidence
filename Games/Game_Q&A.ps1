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
        
    }
    Write-Output ""
}

# Display the final score
Write-Output "Game over! Your final score is $score out of $($questions.Count)."

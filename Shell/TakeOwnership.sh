#!/bin/bash
# Takes the path from the command line argument
Path=$1

# Ensure the script has executable permissions
chmod +x "$0"

# Takes ownership of the file or directory
takeown /f "$Path"
icacls "$Path" /grant administrators:F /T
echo "Ownership Taken of: $Path"







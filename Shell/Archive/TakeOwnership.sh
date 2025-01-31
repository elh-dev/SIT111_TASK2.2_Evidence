#!/bin/bash
# takes code from comand line $1
Path=$1

# takes ownership of file or directory
takeown /f "$Path"
icacls "$Path" /grant administrators:F
Echo "Ownership Taken of: $Path"




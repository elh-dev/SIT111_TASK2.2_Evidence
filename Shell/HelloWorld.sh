#!/bin/bash

echo "Hello, World!"
for i in {1..5}; do
  echo "Number: $i"
done

if [ -f "/path/to/file" ]; then
  echo "File exists."
else
  echo "File does not exist."
fi

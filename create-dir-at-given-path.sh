#!/bin/bash

echo "Enter the path where you want to create the directory:"
read path

if [ -z "$path" ]; then
  echo "Invalid path. Please try again."
  exit 1
fi

mkdir -p "$path"

if [ $? -eq 0 ]; then
  echo "Directory created successfully."
else
  echo "Failed to create directory."
fi


#!/bin/bash
echo "enter the directory"
read dir_name
mkdir $dir_name
if [ $? -eq 0 ]; then
echo "directory created successfully"
else
echo " failed to create the directory"
fi

#!/bin/bash

# List of OpenJDK package names
openjdk_packages=(
    java-1.8.0-openjdk
    java-11-openjdk
    java-16-openjdk
    # Add more versions if needed
)

# Remove OpenJDK packages
for package in "${openjdk_packages[@]}"; do
    yum remove "${package}"* -y
done

# Verify removal
java -version


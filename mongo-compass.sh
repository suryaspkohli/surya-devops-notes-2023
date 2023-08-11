#!/bin/bash

# Function to check if MongoDB Compass is already installed
check_mongocompass_installed() {
    rpm -q mongodb-compass
}

# Function to download and install MongoDB Compass
install_mongocompass() {
    # Download the MongoDB Compass RPM package
    wget -O mongodb-compass.rpm https://downloads.mongodb.com/compass/mongodb-compass-1.28.1.x86_64.rpm

    # Install MongoDB Compass
    sudo yum install -y mongodb-compass.rpm

    # Remove the downloaded RPM package
    rm mongodb-compass.rpm
}

# Main script
if check_mongocompass_installed; then
    echo "MongoDB Compass is already installed."
else
    echo "Installing MongoDB Compass..."
    install_mongocompass
    echo "MongoDB Compass has been installed successfully."
fi


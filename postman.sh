
n to check if Postman is already installed
check_postman_installed() {
    if command -v postman &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to install Postman
install_postman() {
    # Download the Postman tarball
    wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64

    # Extract Postman
    tar -xzf postman.tar.gz -C /opt

    # Create a symbolic link for easy access
    sudo ln -s /opt/Postman/Postman /usr/bin/postman

    # Remove the downloaded tarball
    rm postman.tar.gz
}

# Function to create the desktop icon
create_desktop_icon() {
    DESKTOP_FILE="$HOME/Desktop/postman.desktop"

    # Create Desktop directory if it doesn't exist
    mkdir -p "$HOME/Desktop"

    cat > "$DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Postman
Exec=/opt/Postman/Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

    # Set appropriate permissions for the desktop file
    chmod +x "$DESKTOP_FILE"
}

# Main script
if check_postman_installed; then
    echo "Postman is already installed."
else
    echo "Installing Postman..."
    install_postman
    echo "Postman has been installed successfully."
fi

echo "Creating desktop icon..."
create_desktop_icon
echo "Desktop icon for Postman has been created successfully."


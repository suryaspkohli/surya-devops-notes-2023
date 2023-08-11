#!/bin/bash

# Install MySQL 5.7
echo "Installing MySQL 5.7..."
sudo yum install -y --nogpgcheck https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum install -y --nogpgcheck mysql-community-server

# Start MySQL service
echo "Starting MySQL service..."
sudo systemctl start mysqld.service

# Retrieve temporary root password from log file
TMP_PASSWORD=$(sudo grep 'temporary password' /var/log/mysqld.log | awk '{print $NF}')

# Disable password validation plugin
echo "Disabling password validation plugin..."
mysql --user=root --password="$TMP_PASSWORD" <<EOF
UNINSTALL PLUGIN validate_password;
EOF

# Generate a strong password for the root user
ROOT_PASSWORD=$(openssl rand -base64 12)

# Change root password
echo "Setting root password..."
mysql --user=root --password="$TMP_PASSWORD" --connect-expired-password <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';
EOF

# Enable MySQL service to start on boot
echo "Enabling MySQL service to start on boot..."
sudo systemctl enable mysqld.service

echo "MySQL 5.7 installation completed!"
echo "Generated root password: $ROOT_PASSWORD"



#!/bin/bash

# Your SSH public key file
PUBLIC_KEY="/root/.ssh/id_rsa.pub"

# List of remote server IP addresses or hostnames
REMOTE_SERVERS=(
  "172.16.1.159"
  # Add more server addresses as needed
)

for SERVER in "${REMOTE_SERVERS[@]}"; do
  echo "Copying SSH public key to root user on $SERVER..."

  # Copy the public key to the remote server's root user's authorized_keys file
  ssh-copy-id -i "$PUBLIC_KEY" "root@$SERVER"

  if [ $? -eq 0 ]; then
    echo "SSH public key copied successfully to root user on $SERVER."
  else
    echo "Failed to copy SSH public key to root user on $SERVER."
  fi
done


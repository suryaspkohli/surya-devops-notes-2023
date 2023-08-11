#!/bin/bash

# Check if Sendmail service is running
if systemctl is-active --quiet sendmail; then
    echo "Sendmail is running."
else
    systemctl start sendmail
fi


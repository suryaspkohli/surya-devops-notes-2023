#!/bin/bash

# Replace these variables with your repository URL and personal access token
REPO_URL="https://someshvar26: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@github.com/someshvar26/cliff.ai.git"
TARGET_DIRECTORY="/test_1"

# Clone the repository using the modified URL with the personal access token for authentication
git clone "$REPO_URL" "$TARGET_DIRECTORY" --quiet



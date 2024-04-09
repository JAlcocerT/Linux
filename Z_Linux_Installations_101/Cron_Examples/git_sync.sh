#!/bin/bash

# Define the base directory where the repositories are/will be located
BASE_DIR="/home/jalcocert/Desktop/GIT_SYNC/GITEA"

# Ensure the base directory exists
mkdir -p "$BASE_DIR"

# Define repository URLs - GITEA
REPO1_URL="http://192.168.3.200:3033/fossengineer/FOSSENGINEER.git"
REPO2_URL="http://192.168.3.200:3033/fossengineer/Py_Stocks.git"

# Define local directories (relative to BASE_DIR) where you want to pull the repositories
REPO1_DIR="${BASE_DIR}/FOSSENGINEER"
REPO2_DIR="${BASE_DIR}/Py_Stocks"

# Function to pull or clone a repository
pull_or_clone() {
    local repo_url=$1
    local repo_dir=$2
    
    # Check if the directory exists and is a git repository
    if [ -d "$repo_dir/.git" ]; then
        echo "Updating $repo_dir from $repo_url"
        git -C "$repo_dir" pull
    else
        echo "Cloning $repo_url into $repo_dir"
        git clone "$repo_url" "$repo_dir"
    fi
}

# Pull or clone each repository
pull_or_clone "$REPO1_URL" "$REPO1_DIR"
pull_or_clone "$REPO2_URL" "$REPO2_DIR"

echo "Operation completed."

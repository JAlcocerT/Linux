#!/bin/bash

# Define the base directory where the repositories are/will be located
BASE_DIR="/home/jalcocert/Desktop/GIT_SYNC/GITEA"

# Ensure the base directory exists
mkdir -p "$BASE_DIR"

# Function to pull or clone a repository
pull_or_clone() {
    local repo_url=$1
    local repo_dir=$2
    
    # Ensure the directory exists for the repo
    mkdir -p "$repo_dir"
    
    # Check if the directory exists and is a git repository
    if [ -d "$repo_dir/.git" ]; then
        echo "Updating $repo_dir from $repo_url"
        git -C "$repo_dir" pull
    else
        echo "Cloning $repo_url into $repo_dir"
        git clone "$repo_url" "$repo_dir"
    fi
}

# Loop through the arguments two by two (URL and DIR)
while (( "$#" >= 2 )); do
    repo_url=$1
    repo_dir="${BASE_DIR}/$2"
    pull_or_clone "$repo_url" "$repo_dir"
    # Shift by two to get to the next pair of arguments
    shift 2
done

echo "Operation completed."
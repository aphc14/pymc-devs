#!/bin/bash

# Ensure we are in the correct directory                                                                                                                                                                 
if [[ "$(pwd)" != "$HOME/projects/pymc-devs" ]]; then                                                                                                                                                      
    echo "Error: This script must be run from ~/projects/pymc-devs"                                                                                                                                        
    exit 1   
fi

set -e  # Exit immediately if a command exits with a non-zero status.

# Function to update a submodule
update_submodule() {
    echo "Updating $1..."
    cd $1
    git fetch upstream
    git rebase upstream/main
    git push origin main
    cd ..
}

# Pull changes from the remote repository
git pull origin main

# Update all submodules
update_submodule pymc
update_submodule blackjax
update_submodule pymc-experimental

# Update the main repository
git add .
git commit -m "Update submodules"
git push origin main

echo "All repositories updated successfully!"

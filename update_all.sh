#!/bin/bash

# function to update a submodule
update_submodule() {
    echo "Updating $1..."
    cd $1
    git fetch upstream
    git rebase upstream/main
    git push origin main
    cd ..
}

# update all submodules
update_submodule pymc
update_submodule blackjax
update_submodule pymc-experimental

# update the main repository
git add .
git commit -m "Update submodules"
git push origin main

echo "All repositories updated successfully!"

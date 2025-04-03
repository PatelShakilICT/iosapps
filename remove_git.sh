#!/bin/bash

# 1. Delete all local branches except for 'main' (or 'master')
echo "Deleting all local branches except 'main' (or 'master')..."
git branch | grep -v 'main' | grep -v 'master' | xargs git branch -D

# 2. Remove all remote references and prune stale branches
echo "Pruning stale remote references..."
git fetch --prune
git remote prune origin

# 3. Delete all remote tags
echo "Deleting all remote tags..."
git tag | xargs -I {} git push --delete origin {}

# 4. Delete all local tags
echo "Deleting all local tags..."
git tag | xargs git tag -d

# 5. Remove all remotes
echo "Removing all remotes..."
git remote | xargs -I {} git remote remove {}

# 6. Clear all stashes
echo "Clearing all stashes..."
git stash clear

# 7. Remove all configuration settings (user info, remote URLs, etc.)
echo "Removing all global Git configuration..."
git config --global --unset-all

# 8. Optional: If you want to completely remove Git tracking (including history)
# Uncomment the line below to remove the .git directory (wipe everything)
# echo "Removing Git history and tracking..."
# rm -rf .git

echo "All Git references removed!"

#!/bin/bash

# Replace with your repository URL
REPO_URL="https://github.com/DavisPL/docs-test.git"
REPO_NAME=$(basename "$REPO_URL" .git)

# Clone the repository
git clone "$REPO_URL"
cd "$REPO_NAME"

# Get all branch names
BRANCHES=$(git branch -r | grep -v '\->')

# Loop through each branch and clone it into a separate directory
for BRANCH in $BRANCHES; do
    BRANCH_NAME=$(echo "$BRANCH" | sed 's/origin\///')
    BRANCH_DIR="../$REPO_NAME-$BRANCH_NAME"
    git worktree add "$BRANCH_DIR" "$BRANCH_NAME"
done



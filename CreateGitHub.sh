#!/bin/bash

# Set your GitHub username and access token
USERNAME="bahyway"
# This Token has a 'Create Repo' & 'Delete Repo' permissions

TOKEN="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" 

# Set the name of the new repository
REPO_NAME="MyOwnGitRepo"

# Set the repository description
REPO_DESC="This is a new repository"

# Set the path to the local directory where the repository will be created
LOCAL_DIR="C:/Users/Bahaa/Desktop/PROJECTS/MyOwnGitRepo/"

# Create the new repository on GitHub using the API
curl -H "Authorization: token $TOKEN" \
     --data "{\"name\":\"$REPO_NAME\", \"description\":\"$REPO_DESC\"}" \
     https://api.github.com/user/repos

# Navigate to the local directory where the repository will be created
cd "$LOCAL_DIR"

# Initialize a new Git repository
git init

# Add the new GitHub repository as the origin remote
git remote add origin "https://github.com/$USERNAME/$REPO_NAME.git"

# Add a README.md file to the repository
echo "# $REPO_NAME" >> README.md

# Commit the changes to the repository
git add . # README.md
git commit -m "Initial commit"

# Push the changes to the GitHub repository
git push -u origin master
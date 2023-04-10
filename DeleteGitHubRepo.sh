#!/bin/bash

# Set your GitHub username and access token
USERNAME="bahyway"
# This Token has a 'Create Repo' & 'Delete Repo' permissions, Do not add anything befor or beside the Token

TOKEN="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" 


# Set the name of the repository you want to delete
REPO_NAME="MyOwnGitRepo"

# Check if the repository exists
curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$USERNAME/$REPO_NAME" | grep -q '"message": "Not Found"'
if [ $? -eq 0 ]; then
  echo "Repository $REPO_NAME does not exist"
else
  # Send a DELETE request to the GitHub API to delete the repository
  curl -X DELETE -H "Authorization: token $TOKEN" "https://api.github.com/repos/$USERNAME/$REPO_NAME"
  echo "Repository $REPO_NAME deleted"
fi
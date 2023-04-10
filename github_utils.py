
from github import Github
import sys
import os

# Get the GitHub token from the environment variable
GITHUB_TOKEN = os.environ.get('GITHUB_TOKEN')
if not GITHUB_TOKEN:
    print('Error: Please set the GITHUB_TOKEN environment variable')
    sys.exit(1)

# Create a PyGithub object using the token
g = Github(GITHUB_TOKEN)

# Get the user object for the authenticated user
user = g.get_user()

def create_repo(repo_name):
    try:
        # Create the repository
        repo = user.create_repo(repo_name)
        print(f'Repository {repo_name} created')
    except Exception as e:
        print(f'Error creating repository {repo_name}: {str(e)}')

def delete_repo(repo_name):
    try:
        # Get the repository object
        repo = g.get_repo(user.login + '/' + repo_name)
        # Delete the repository
        repo.delete()
        print(f'Repository {repo_name} deleted')
    except Exception as e:
        print(f'Error deleting repository {repo_name}: {str(e)}')

# If the script is run with the "create" command, create a new repository
if sys.argv[1] == 'create':
    repo_name = sys.argv[2]
    create_repo(repo_name)

# If the script is run with the "delete" command, delete an existing repository
elif sys.argv[1] == 'delete':
    repo_name = sys.argv[2]
    delete_repo(repo_name)

# If the script is run with any other command, print an error message
else:
    print('Error: Please specify a valid command (create or delete)')
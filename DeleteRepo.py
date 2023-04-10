
# Use PyGithub to create or delete GitHub repositories
from github import Github

# Authentication token
TOKEN='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'

# Initialize PyGithub client
g = Github(TOKEN)

# Delete repository
repo_name = 'MyOwnGitRepo'
user = g.get_user()
repo = user.get_repo(repo_name)
repo.delete()

print(f"Repository '{repo_name}' deleted successfully!")
from github import Github

# Authentication token
TOKEN="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" 

# Initialize PyGithub client
g = Github(TOKEN)

# Create new repository
repo_name = 'MyOwnGitRepo'
user = g.get_user()
repo = user.create_repo(repo_name)

print(f"Repository '{repo_name}' created successfully!")
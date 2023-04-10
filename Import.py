import subprocess

# Check if PyGithub is installed
try:
    import github
except ImportError:
    # Install PyGithub using pip
    subprocess.check_call(['pip', 'install', 'PyGithub'])

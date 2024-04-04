import requests
import datetime
from pathlib import Path
import subprocess

# Repositories to update: (URL, local directory name)
REPOSITORIES = [
    ("http://192.168.3.200:3033/fossengineer/FOSSENGINEER.git", "FOSSENGINEER"),
    ("http://192.168.3.200:3033/fossengineer/Py_Stocks.git", "Py_Stocks"),
]

BASE_DIR = "/home/jalcocert/Desktop/GIT_SYNC/GITEA3"
UPTIME_KUMA_PUSH_URL = "http://192.168.3.200:3001/api/push/Xe6iHxz97X?status=up&msg=OK&ping=" #"http://uptimekuma.mydomain.com/api/push/xyz"

def git_clone_or_pull(repo_url, local_dir):
    """Clones the repo if it doesn't exist, or pulls updates if it does."""
    subprocess.run(["mkdir", "-p", str(local_dir)], check=True)
    if (local_dir / ".git").exists():
        print(f"Updating existing repository in {local_dir}")
        subprocess.run(["git", "-C", str(local_dir), "pull"], check=True)
    else:
        print(f"Cloning new repository from {repo_url} into {local_dir}")
        subprocess.run(["git", "clone", repo_url, str(local_dir)], check=True)

def update_status():
    """Sends a GET request to the Uptime Kuma monitoring endpoint."""
    try:
        response = requests.get(UPTIME_KUMA_PUSH_URL)
        response.raise_for_status()
        print("Status update sent successfully.")
    except requests.RequestException as e:
        print(f"Failed to send status update to Uptime Kuma: {e}")

def main():
    for repo_url, repo_dir in REPOSITORIES:
        git_clone_or_pull(repo_url, Path(BASE_DIR) / repo_dir)
    
    # Send a GET request to Uptime Kuma's push URL to signal success
    update_status()

if __name__ == "__main__":
    main()



# import subprocess
# import requests
# import datetime

# # Repositories to update: (URL, local directory name)
# REPOSITORIES = [
#     ("http://192.168.3.200:3033/fossengineer/FOSSENGINEER.git", "FOSSENGINEER"),
#     ("http://192.168.3.200:3033/fossengineer/Py_Stocks.git", "Py_Stocks"),
# ]

# BASE_DIR = "/home/jalcocert/Desktop/GIT_SYNC/GITEA2"
# STATUS_ENDPOINT = "http://yourserver:5000/update_status"

# def git_clone_or_pull(repo_url, local_dir):
#     """Clones the repo if it doesn't exist, or pulls updates if it does."""
#     subprocess.run(["mkdir", "-p", local_dir], check=True)
#     if (local_dir / ".git").exists():
#         print(f"Updating existing repository in {local_dir}")
#         subprocess.run(["git", "-C", local_dir, "pull"], check=True)
#     else:
#         print(f"Cloning new repository from {repo_url} into {local_dir}")
#         subprocess.run(["git", "clone", repo_url, local_dir], check=True)

# def update_status(message):
#     """Sends a status update to the monitoring endpoint."""
#     try:
#         response = requests.post(STATUS_ENDPOINT, data=message)
#         response.raise_for_status()
#         print("Status update sent successfully.")
#     except requests.RequestException as e:
#         print(f"Failed to send status update: {e}")

# def main():
#     from pathlib import Path
#     for repo_url, repo_dir in REPOSITORIES:
#         git_clone_or_pull(repo_url, Path(BASE_DIR) / repo_dir)
    
#     # Update the monitoring endpoint with completion status
#     now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
#     update_status(f"Git sync script completed successfully at {now}")

# if __name__ == "__main__":
#     main()

# Quantum Computation Notebook Repository

This repository stores the Jupyter notebooks related to the numerical experiments and quantum computation work in this folder.

## Included files

- `Poisson_1D_periodic_corrected.ipynb`
- `trial_2.ipynb`
- `trial_2 copy.ipynb`

## What this setup does

- Initializes a Git repository in this folder.
- Tracks all files in the project for version control.
- Ignores local virtual environment and editor-generated files.
- Uses an automatic watcher to detect new or modified files and commit them so the repository updates continuously.

## Auto-sync behavior

The script `watch_and_commit.ps1` monitors the repository folder. When a new file is created or an existing file changes, it automatically runs:

- `git add -A`
- `git commit -m "Auto-commit: ..."`

If a Git remote is configured later, the script also pushes the changes to the remote repository.

## Next step for GitHub

This project is ready to be connected to a private GitHub repository. Once GitHub authentication is available, the remote repository can be added and the watcher can push updates automatically.

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
- Regenerates a project explanation file so the theory and code summary stays in sync with the files in the folder.

## Auto-sync behavior

The script `watch_and_commit.ps1` monitors the repository folder. When a new file is created or an existing file changes, it automatically runs:

- `git add -A`
- `git commit -m "Auto-commit: ..."`
- `refresh_project_summary.py` to regenerate `PROJECT_THEORY_AND_CODE.md`
- a second summary commit if the documentation changed

If a Git remote is configured later, the script also pushes the changes to the remote repository.

## Project explanation file

The file `PROJECT_THEORY_AND_CODE.md` explains the theory behind the notebooks and gives a concise summary of the code. It is updated automatically whenever a new file is added to the repository folder.

## Current notebooks

- `Poisson_1D_periodic_corrected.ipynb`
- `trial_2.ipynb`
- `trial_2 copy.ipynb`

## GitHub status

This project is connected to the private GitHub repository `quantum_notebooks` and is set to push automatically when new content appears.

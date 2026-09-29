$repoPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoPath

function Get-FileState {
    Get-ChildItem -Path $repoPath -Recurse -File | ForEach-Object {
        $item = $_
        [pscustomobject]@{
            Path = $item.FullName.Substring($repoPath.Length + 1)
            LastWriteTimeUtc = $item.LastWriteTimeUtc
            Length = $item.Length
        }
    } | Sort-Object Path
}

$lastSnapshot = Get-FileState

Write-Host "Watching $repoPath for new or changed files..."

while ($true) {
    Start-Sleep -Seconds 10
    $currentSnapshot = Get-FileState

    $changed = $false
    $diff = Compare-Object -ReferenceObject $lastSnapshot -DifferenceObject $currentSnapshot -Property Path, LastWriteTimeUtc, Length
    if ($diff) {
        $changed = $true
    }

    if (-not $changed) {
        continue
    }

    git add -A

    $status = git status --short
    if (-not $status) {
        $lastSnapshot = $currentSnapshot
        continue
    }

    $commitMessage = "Auto-commit: update $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    git commit -m $commitMessage

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Committed changes: $commitMessage"
    }

    $remoteExists = git remote get-url origin 2>$null
    if ($LASTEXITCODE -eq 0) {
        git push
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Pushed to remote"
        }
    }

    $lastSnapshot = $currentSnapshot
}

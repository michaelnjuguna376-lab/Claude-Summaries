# Stop hook: commit and push handoffs to GitHub.
# Does nothing (exit 0) until git is installed, the folder is a git repo, and a remote named origin exists.
$ErrorActionPreference = 'SilentlyContinue'
$root = Split-Path -Parent $PSScriptRoot
$git  = (Get-Command git -ErrorAction SilentlyContinue).Source
if (-not $git -and (Test-Path 'C:\Program Files\Git\cmd\git.exe')) { $git = 'C:\Program Files\Git\cmd\git.exe' }
if (-not $git) { exit 0 }
$env:GIT_TERMINAL_PROMPT = '0'   # never hang a hook on a prompt; stored GCM credentials are used
if (-not (Test-Path (Join-Path $root '.git'))) { exit 0 }

Set-Location $root
$remote = & $git remote 2>$null
if (-not ($remote -contains 'origin')) { exit 0 }

$changes = & $git status --porcelain 2>$null
if ($changes) {
    & $git add -A 2>$null | Out-Null
    & $git commit -m ("handoff sync " + (Get-Date -Format 'yyyy-MM-dd HH:mm')) 2>$null | Out-Null
}

# Push if local is ahead of origin (covers both new and earlier unpushed commits).
$ahead = & $git rev-list --count '@{u}..HEAD' 2>$null
if ($LASTEXITCODE -ne 0 -or [int]$ahead -gt 0) {
    & $git push -u origin HEAD 2>$null | Out-Null
}
exit 0

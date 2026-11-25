# SessionStart hook: give Claude the handoff index so it starts from the written record.
$ErrorActionPreference = 'SilentlyContinue'
$root  = Split-Path -Parent $PSScriptRoot
$index = Join-Path $root 'INDEX.md'
$today = Get-Date -Format 'yyyy-MM-dd'

$text = "HANDOFF SYSTEM: Claude's work record lives in $root (local) and is pushed to GitHub. " +
        "Use it as the source of continuity instead of relying on cache. Before working on a topic, read topics/<topic>/CURRENT.md and its latest handoff. " +
        "After any structured output, write or update a handoff per $root\README.md (today is $today)."

if (Test-Path $index) {
    $body = Get-Content $index -Raw -Encoding UTF8
    if ($body.Length -gt 6000) { $body = $body.Substring(0, 6000) + "`n...(truncated; read INDEX.md for the rest)" }
    $text += "`n`n--- INDEX.md ---`n" + $body
}

$out = @{ hookSpecificOutput = @{ hookEventName = 'SessionStart'; additionalContext = $text } }
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$out | ConvertTo-Json -Depth 5 -Compress
exit 0

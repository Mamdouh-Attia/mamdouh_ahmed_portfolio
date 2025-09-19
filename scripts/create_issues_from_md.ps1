$issuesFile = "Issues.md"
$repo = "Mamdouh-Attia/mamdouh_ahmed_portfolio"

$content = Get-Content $issuesFile

foreach ($line in $content) {
    if ($line -match "^- \[ \]") {
        $title = $line -replace "^- \[ \] \*\*", "" -replace "\*\*", "" -replace "^- \[ \] ", ""
        $title = $title.Trim()

        if ($title.Length -gt 0) {
            Write-Host "➡️ Creating issue: $title"
            gh issue create `
                --repo $repo `
                --title "$title" `
                --body "Auto-created from Issues.md roadmap."
        }
    }
}

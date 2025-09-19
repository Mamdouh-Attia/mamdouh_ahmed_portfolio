# assign_issues.ps1
# ربط Issues بميلستونز موجودة بالفعل

$repo = "Mamdouh-Attia/mamdouh_ahmed_portfolio"

# Milestones IDs حسب اللي اتعمل في GitHub (عدّل لو الأرقام مختلفة عندك)
$milestoneMap = @{
    "Step 3"  = 5
    "Step 4"  = 1
    "Step 5"  = 3
    "Step 6"  = 6
    "Step 7"  = 7
    "Step 8"  = 8
    "Step 9"  = 4
    "Step 10" = 2
}

$issuesFile = "Issues.md"
$currentStep = ""
$report = @()
$content = Get-Content $issuesFile

foreach ($line in $content) {
    if ($line -match "^## Step") {
        $parts = $line -split " "
        $currentStep = $parts[1] + " " + $parts[2]  # => Step 3
    }
    elseif ($line -match "^- \[ \]") {
        $title = $line -replace "^- \[ \] \*\*", "" -replace "\*\*", "" -replace "^- \[ \] ", ""
        $title = $title.Trim()

        if ($title -and $milestoneMap.ContainsKey($currentStep)) {
            $msNumber = $milestoneMap[$currentStep]
            Write-Host "Assigning '$title' to milestone #$msNumber"

            $issueNumber = gh issue list --repo $repo --search "$title" --json number --jq '.[0].number'
            if ($issueNumber) {
                gh issue edit $issueNumber --repo $repo --milestone $msNumber
                $report += [PSCustomObject]@{ Issue=$title; Number=$issueNumber; Milestone=$msNumber; Status="Assigned" }
            } else {
                $report += [PSCustomObject]@{ Issue=$title; Number="N/A"; Milestone=$msNumber; Status="Not Found" }
            }
        }
    }
}

Write-Host "`nAssignment Report:`n"
$report | Format-Table -AutoSize

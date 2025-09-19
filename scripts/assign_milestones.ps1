# ملف: assign_milestones.ps1
# الهدف: إنشاء Milestones + ربط Issues بيها أوتوماتيك من Issues.md + تقرير في الآخر (باستخدام gh api)

$repo = "Mamdouh-Attia/mamdouh_ahmed_portfolio"
$issuesFile = "Issues.md"

# تعريف الماب بين الـ Step والـ Milestone title
$milestoneTitles = @{
    "Step 3"  = "Step 3 - AppShell and Layout"
    "Step 4"  = "Step 4 - Supabase Setup"
    "Step 5"  = "Step 5 - Admin Panel"
    "Step 6"  = "Step 6 - Populate Content"
    "Step 7"  = "Step 7 - Animations and 3D"
    "Step 8"  = "Step 8 - Testing and Performance"
    "Step 9"  = "Step 9 - Deployment"
    "Step 10" = "Step 10 - CI/CD and Maintenance"
}

# نخزن العناوين → أرقام milestones
$milestoneMap = @{}

# 1. إنشاء milestones (لو مش موجودة) + جلب أرقامهم
foreach ($step in $milestoneTitles.Keys) {
    $title = $milestoneTitles[$step]
    Write-Host "Ensuring milestone exists: $title"

    # ابحث عن milestone بالعنوان
    $msNumber = gh api repos/$repo/milestones --jq ".[] | select(.title==`"$title`") | .number"

    if (-not $msNumber) {
        # أنشئ milestone لو مش موجود
        gh api repos/$repo/milestones -f title="$title" -f description="Auto-created from script"
        $msNumber = gh api repos/$repo/milestones --jq ".[] | select(.title==`"$title`") | .number"
    }

    if ($msNumber) {
        $milestoneMap[$step] = $msNumber
    }
}

# 2. قراءة Issues.md وربط كل Issue بالـ Milestone number
$currentStep = ""
$report = @()
$content = Get-Content $issuesFile

foreach ($line in $content) {
    if ($line -match "^## Step") {
        $parts = $line -split " "
        $currentStep = $parts[1] + " " + $parts[2]  # => "Step 3"
    }
    elseif ($line -match "^- \[ \]") {
        $title = $line -replace "^- \[ \] \*\*", "" -replace "\*\*", "" -replace "^- \[ \] ", ""
        $title = $title.Trim()

        if ($title.Length -gt 0 -and $currentStep.Length -gt 0) {
            $msNumber = $milestoneMap[$currentStep]
            if ($msNumber) {
                Write-Host "Assigning issue '$title' to milestone #$msNumber"

                # ابحث عن رقم الـ Issue بالعنوان
                $issueNumber = gh issue list --repo $repo --search "$title" --json number --jq '.[0].number'

                if ($issueNumber) {
                    gh issue edit $issueNumber --repo $repo --milestone $msNumber
                    $report += [PSCustomObject]@{
                        Issue     = $title
                        Number    = $issueNumber
                        Milestone = $msNumber
                        Status    = "Assigned"
                    }
                }
                else {
                    $report += [PSCustomObject]@{
                        Issue     = $title
                        Number    = "N/A"
                        Milestone = $msNumber
                        Status    = "Not Found"
                    }
                }
            }
        }
    }
}

# 3. اطبع التقرير
Write-Host ""
Write-Host "Assignment Report:"
$report | Format-Table -AutoSize

# تأكد انك في جذر المشروع (root directory)

# إنشاء المسارات
New-Item -ItemType Directory -Force -Path ".github/ISSUE_TEMPLATE" | Out-Null

# Feature request template
@"
---
name: 🚀 Feature Request
about: Suggest a new feature for the portfolio
title: "feat: "
labels: enhancement
assignees: ''
---

## Description
<!-- اشرح الميزة الجديدة باختصار -->

## Tasks
- [ ] Subtask 1
- [ ] Subtask 2

## Definition of Done (DoD)
- [ ] Implemented as described
- [ ] Tested locally
- [ ] Documented in roadmap
- [ ] No negative impact on performance/accessibility
"@ | Out-File ".github/ISSUE_TEMPLATE/feature_request.md" -Encoding UTF8

# Bug report template
@"
---
name: 🐛 Bug Report
about: Report an issue or unexpected behavior
title: "fix: "
labels: bug
assignees: ''
---

## Bug Description
<!-- أوصف المشكلة -->

## Steps to Reproduce
1. Go to ...
2. Click ...
3. See error

## Expected Behavior
<!-- ايه المفروض يحصل -->

## Screenshots/Logs
<!-- لو في صور أو لوج -->

## Definition of Done (DoD)
- [ ] Bug reproduced
- [ ] Fix implemented
- [ ] Tests passed
- [ ] No regression introduced
"@ | Out-File ".github/ISSUE_TEMPLATE/bug_report.md" -Encoding UTF8

# Content update template
@"
---
name: 📚 Content Update
about: Add or edit content (projects, learning, teaching, certificates)
title: "content: "
labels: content
assignees: ''
---

## Content Update Description
<!-- أوصف التغيير (إضافة مشروع، تعديل شهادة، إلخ) -->

## Tasks
- [ ] Update content in Supabase / local data
- [ ] Reflect changes on UI
- [ ] Verify display is correct

## Definition of Done (DoD)
- [ ] Content updated
- [ ] Display verified
- [ ] No errors introduced
"@ | Out-File ".github/ISSUE_TEMPLATE/content_update.md" -Encoding UTF8

# Pull Request template
@"
# 📌 Pull Request

## Description
<!-- أوصف التغيير اللي حصل -->

## Related Issue
Fixes #

## Checklist
- [ ] Code follows project style guidelines
- [ ] Tested locally
- [ ] Related issue linked
- [ ] No new warnings
- [ ] Documentation updated (if needed)

## Screenshots (if applicable)

"@ | Out-File ".github/pull_request_template.md" -Encoding UTF8

Write-Host "✅ GitHub templates created successfully!"

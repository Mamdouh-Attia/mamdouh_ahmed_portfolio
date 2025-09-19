# ========== Setup Script for mamdouh_ahmed_portfolio ==========
# Run this script from project root:  .\setup.ps1

Write-Output "Starting setup for mamdouh_ahmed_portfolio..."

# ---------------- Folders ----------------
$folders = @(
  "lib\core",
  "lib\core\bloc",
  "lib\core\utils",
  "lib\core\theme",
  "lib\core\routing",
  "lib\features",
  "lib\features\home",
  "lib\features\projects",
  "lib\features\about",
  "lib\features\contact",
  "lib\features\admin",
  "lib\features\learning",
  "lib\features\teaching",
  "lib\features\certificates",
  "lib\shared",
  "lib\shared\widgets",
  "lib\shared\models",
  "lib\shared\services",
  "assets\images",
  "assets\rive",
  "assets\3d_models"
)

foreach ($f in $folders) {
  if (-not (Test-Path $f)) {
    New-Item -ItemType Directory -Path $f | Out-Null
    Write-Output "Created folder: $f"
  }
}

# ---------------- Empty files ----------------
$files = @(
  "lib\main.dart",
  "lib\app.dart",
  "lib\core\routing\app_router.dart",
  "lib\core\theme\app_theme.dart",
  "lib\core\bloc\app_bloc_observer.dart"
)

foreach ($file in $files) {
  if (-not (Test-Path $file)) {
    New-Item -Path $file -ItemType File -Force | Out-Null
    Write-Output "Created empty file: $file"
  }
}

Write-Output "Setup completed successfully! Paste Dart code manually into files."

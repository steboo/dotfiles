param(
  [parameter()]
  [string]
  $TargetDirectory = $env:HOME
)
Set-StrictMode -Version 2.0
$ErrorActionPreference = "Stop"

# Backup existing
if (Test-Path $TargetDirectory\_vimrc) {
  Copy-Item $TargetDirectory\_vimrc $TargetDirectory\_vimrc.bak
}

if (Test-Path $TargetDirectory\_gvimrc) {
  Copy-Item $TargetDirectory\_gvimrc $TargetDirectory\_gvimrc.bak
}

# Copy new files
Copy-Item .vimrc $TargetDirectory\_vimrc
Copy-Item .gvimrc $TargetDirectory\_gvimrc

"Copied files to $TargetDirectory"

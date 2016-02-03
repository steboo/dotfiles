[CmdletBinding(SupportsShouldProcess=$true)]
param(
  [parameter()]
  [string]
  $TargetDirectory
)
Set-StrictMode -Version 2.0
$ErrorActionPreference = "Stop"

# Set default target directory if not set
if (!$TargetDirectory) {
    if (Test-Path Env:\HOME) {
        $TargetDirectory = "$env:HOME\vimfiles"
    } elseif ((Test-Path Env:\HOMEDRIVE) -and (Test-Path Env:\HOMEPATH)) {
        $TargetDirectory = "$env:HOMEDRIVE$env:HOMEPATH\vimfiles"
    }
}

if (-not (Test-Path $TargetDirectory)) {
    mkdir $TargetDirectory
}

# Backup existing
if (Test-Path $TargetDirectory\vimrc) {
  Copy-Item $TargetDirectory\vimrc $TargetDirectory\vimrc.bak
}

if (Test-Path $TargetDirectory\gvimrc) {
  Copy-Item $TargetDirectory\gvimrc $TargetDirectory\gvimrc.bak
}

# Copy new files
Copy-Item .vimrc $TargetDirectory\vimrc
Copy-Item .gvimrc $TargetDirectory\gvimrc

"Copied files to $TargetDirectory"

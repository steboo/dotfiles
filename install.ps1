[CmdletBinding(SupportsShouldProcess=$true)]
param(
  [parameter()]
  [string]
  $TargetDirectory,
  [parameter()]
  [switch]
  $DownloadFromInternet
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

# Create directories if necessary
if (-not (Test-Path $TargetDirectory)) {
    mkdir $TargetDirectory
}

if (-not (Test-Path $TargetDirectory\autoload)) {
    mkdir $TargetDirectory\autoload
}

if (-not (Test-Path $TargetDirectory\bundle)) {
    mkdir $TargetDirectory\bundle
}

if (-not (Test-Path $TargetDirectory\colors)) {
    mkdir $TargetDirectory\colors
}

if (-not (Test-Path $TargetDirectory\indent)) {
    mkdir $TargetDirectory\indent
}

if (-not (Test-Path $TargetDirectory\swap)) {
    mkdir $TargetDirectory\swap
}

if (-not (Test-Path $TargetDirectory\undo)) {
    mkdir $TargetDirectory\undo
}

# Backup existing
if (Test-Path $TargetDirectory\vimrc) {
  Copy-Item $TargetDirectory\vimrc $TargetDirectory\vimrc.bak
}

if (Test-Path $TargetDirectory\gvimrc) {
  Copy-Item $TargetDirectory\gvimrc $TargetDirectory\gvimrc.bak
}

# Copy new files
Copy-Item .vim\vimrc $TargetDirectory\vimrc
Copy-Item .vim\gvimrc $TargetDirectory\gvimrc
Copy-Item .vim\indent\*.vim $TargetDirectory\indent\

"Copied files to $TargetDirectory"

if ($DownloadFromInternet) {
  "Downloading vim plugins from the Internet..."
  wget https://tpo.pe/pathogen.vim -OutFile $TargetDirectory\autoload\pathogen.vim

  Push-Location $TargetDirectory\bundle
  &git clone git://github.com/altercation/vim-colors-solarized.git
  &git clone git://github.com/tpope/vim-dispatch.git
  &git clone git://github.com/PProvost/vim-ps1.git
  &git clone git://github.com/jpo/vim-railscasts-theme.git
  Pop-Location
}

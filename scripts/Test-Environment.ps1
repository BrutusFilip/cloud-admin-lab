#Requires -Version 7.0
<#
.SYNOPSIS
    zjistí verze nástrojů labu a zapíše je do docs/environment.md (M00-03).
#>
$ErrorActionPreference = 'STOP'

# --- PowerShell a Git ---
$psVersion = $PSVersionTable.PSVersion.ToString()
Write-Output "PowerShell: $psVersion"
$gitVersion = git --version
Write-Output "Git: $gitVersion"

# --- Git konfigurace ---
$gitUser = git config --global user.name
$gitEmail = if (git config --global user.email) { 'nastaven' } else { 'CHYBÍ' }
Write-Output "Git user: $gitUser, e-mail: $gitEmail"

# --- PowerShell moduly ---
$azVersion = (Get-InstalledModule -Name Az).Version.ToString()
Write-Output "Az: $azVersion"
$graphVersion = (Get-InstalledModule -Name Microsoft.Graph).Version.ToString()
Write-Output "Microsoft.Graph: $graphVersion"

# --- Azure CLI (vrací JSON) ---
$azCliVersion = (az version | ConvertFrom-Json).'azure-cli'
Write-Output "Azure CLI: $azCliVersion"

# --- VS Code a rozšíření ---
$codeVersion = (code --version)[0]
Write-Output "VS Code: $codeVersion"
$extensions = code --list-extensions --show-versions | Where-Object { $_ -match 'powershell|bicep|gitlens' }
Write-Output "Rozšíření: $($extensions -join ', ')"

# --- WSL (bez WSL_UTF8 vrací UTF-16 a hledání selže) ---
$env:WSL_UTF8 = 1
$wslVersion = (wsl --version)[0]
$wslDistro  = (wsl -l -v | Select-String 'Ubuntu').Line.Trim()
Write-Output "WSL: $wslVersion | $wslDistro"

# --- Zápis do docs/environment.md ---
$datum = Get-Date -Format 'yyyy-MM-dd HH:mm'
$cil   = Join-Path (Split-Path $PSScriptRoot -Parent) 'docs\environment.md'

$markdown = @"
# Prostředí labu (M00-03)

Vygenerováno: $datum skriptem scripts/Test-Environment.ps1

| Komponenta | Verze / stav |
|---|---|
| PowerShell | $psVersion |
| Git | $gitVersion |
| Git user.name | $gitUser |
| Git user.email | $gitEmail |
| Modul Az | $azVersion |
| Modul Microsoft.Graph | $graphVersion |
| Azure CLI | $azCliVersion |
| VS Code | $codeVersion |
| VS Code rozšíření | $($extensions -join ', ') |
| WSL | $wslVersion |
| WSL distribuce | $wslDistro |
"@

$markdown | Set-Content -Path $cil -Encoding utf8
Write-Output "Zapsáno: $cil"
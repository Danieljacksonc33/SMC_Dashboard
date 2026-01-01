# Auto-create and push SMC_Dashboard to GitHub
# This script attempts to create the repository using GitHub API

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Auto-Create SMC_Dashboard on GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$repoName = "SMC_Dashboard"
$description = "Real-time web dashboard and UI/UX components for SMC Sessions EA"
$username = "Danieljacksonc33"

Write-Host "Repository will be created as: $username/$repoName" -ForegroundColor Yellow
Write-Host ""

# Check if GitHub CLI is available
$ghAvailable = Get-Command gh -ErrorAction SilentlyContinue

if ($ghAvailable) {
    Write-Host "GitHub CLI detected. Creating repository..." -ForegroundColor Green
    gh repo create $repoName --public --description $description --source=. --remote=origin --push
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "SUCCESS! Repository created and pushed!" -ForegroundColor Green
        Write-Host "URL: https://github.com/$username/$repoName" -ForegroundColor Cyan
        exit 0
    }
}

# Fallback: Open browser for manual creation
Write-Host "GitHub CLI not available. Opening browser for manual creation..." -ForegroundColor Yellow
Write-Host ""

# Construct GitHub new repo URL with pre-filled parameters
$githubUrl = "https://github.com/new?name=$repoName&description=$([System.Web.HttpUtility]::UrlEncode($description))"

Start-Process $githubUrl

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Manual Setup Required" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Repository name: $repoName" -ForegroundColor White
Write-Host "2. Description: $description" -ForegroundColor White
Write-Host "3. Choose Public or Private" -ForegroundColor White
Write-Host "4. DO NOT initialize with README, .gitignore, or license" -ForegroundColor Red
Write-Host "5. Click 'Create repository'" -ForegroundColor White
Write-Host ""
Write-Host "After creating, press any key to push..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Green
Set-Location $PSScriptRoot
git branch -M main
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   SUCCESS! Repository pushed!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Repository URL: https://github.com/$username/$repoName" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "   ERROR: Push failed" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "Make sure you:" -ForegroundColor Yellow
    Write-Host "1. Created the repository on GitHub" -ForegroundColor White
    Write-Host "2. Named it exactly: $repoName" -ForegroundColor White
    Write-Host "3. Did NOT initialize with README" -ForegroundColor White
    Write-Host ""
    Write-Host "Then run this script again." -ForegroundColor Yellow
}

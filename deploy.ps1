# Deploy Script for Jinyao Nan's Website
# Run this script to push your local changes to GitHub and update the website.

Write-Host "Starting deployment..." -ForegroundColor Cyan

# Check if git is initialized
if (-not (Test-Path .git)) {
    Write-Error "This directory is not a git repository."
    exit
}

# Add all changes
Write-Host "Adding changes..." -ForegroundColor Yellow
git add .

# Commit changes
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$message = "Update website content - $timestamp"
Write-Host "Committing with message: $message" -ForegroundColor Yellow
git commit -m "$message"

# Push to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push origin main

if ($?) {
    Write-Host "Successfully deployed!" -ForegroundColor Green
    Write-Host "Your changes should be live on https://jammynan.github.io/ in a few minutes." -ForegroundColor Green
} else {
    Write-Error "Deployment failed. Please check the error messages above."
}

Pause

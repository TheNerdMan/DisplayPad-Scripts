function Example-Console-With-Path {
    # Use UTF-8 encoding for the script
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    [Console]::InputEncoding = [System.Text.Encoding]::UTF8
    Clear-Host
    Write-Host "DisplayPad Script Demo" -ForegroundColor Green
    Write-Host "🎉🎉🎉 🚀🚀🚀 🎆🎆🎆"

    Write-Host "----------------------------------------" -ForegroundColor Green
    Write-Host ""

    # Load the users PATH env and profile
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "User")
    $env:PSModulePath = [System.Environment]::GetEnvironmentVariable("PSModulePath", "User")

    # Explicitly set the profile path
    $userProfilePath = [Environment]::GetFolderPath('MyDocuments') + '\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'

    # Safely load the profile if it exists
    if (Test-Path -Path $userProfilePath) {
        try {
            $profileContent = Get-Content -Path $userProfilePath -Raw
            $scriptBlock = [ScriptBlock]::Create($profileContent)
            . $scriptBlock
        }
        catch {
            Write-Host "Could not load profile: $_" -ForegroundColor Yellow
        }
    }

    # Output the profile path
    Write-Host ""
    Write-Host "Profile: $userProfilePath" -ForegroundColor Green
    Write-Host ""

    # Rest of your code remains the same...
    Write-Host "This is a PowerShell script converted to EXE using PS2EXE, Triggered through your DisplayPad"
    Write-Host ""
    Write-Host "Press Enter to show a message..."
    
    $null = Read-Host
    
    Write-Host ""
    Write-Host "Hello from PS2EXE! Triggered through your DisplayPad!" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Press Enter to exit..."
    $null = Read-Host
}

Example-Console-With-Path

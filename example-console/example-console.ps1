function Example-Console {
    # Example script to demonstrate ps2exe functionality
    # This will create a simple console application that shows a message

    Clear-Host
    Write-Host "DisplayPad Script Demo" -ForegroundColor Green
    Write-Host "----------------------------------------" -ForegroundColor Green
    Write-Host ""
    
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

Example-Console
param (
    [switch]$Verbose
)

Import-Module ps2exe

function ConvertTo-Icon {
    [CmdletBinding()]
    param(
    # The file
    [Parameter(Mandatory=$true, Position=0,ValueFromPipelineByPropertyName=$true)]
    [Alias('Fullname')]
    [string]$File,
    
    # If provided, will output the icon to a location
    [Parameter(Position=1, ValueFromPipelineByPropertyName=$true)]
    [string]$OutputFile
    )
    
    begin {
        Add-Type -AssemblyName System.Windows.Forms, System.Drawing
        
    }
    
    process {
        $resolvedFile = $ExecutionContext.SessionState.Path.GetResolvedPSPathFromPSPath($file)
        if (-not $resolvedFile) { return }
        $loadedImage = [Drawing.Image]::FromFile($resolvedFile)
        $intPtr = New-Object IntPtr
        $thumbnail = $loadedImage.GetThumbnailImage(72, 72, $null, $intPtr)
        $bitmap = New-Object Drawing.Bitmap $thumbnail 
        $bitmap.SetResolution(72, 72); 
        $icon = [System.Drawing.Icon]::FromHandle($bitmap.GetHicon());    

        $resolvedOutputFile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($outputFile)
        $fileStream = [IO.File]::Create("$resolvedOutputFile")                               
        $icon.Save($fileStream) 
        $fileStream.Close()      

        $icon.Dispose()
        $bitmap.Dispose()
    }
}

function Build-Executable {
    param (
        [string]$InputFile,
        [string]$OutputFile,
        [string]$IconFile,
        [switch]$IsConsole
    )
    $parameters = @{
        InputFile  = $InputFile
        OutputFile = $OutputFile
        IconFile   = $IconFile
        SupportOS  = $true
    }

    if ($IsConsole -eq $false) {
        $parameters['NoConsole'] = $true
        $parameters['NoOutput']  = $true
        $parameters['DPIAware']  = $true
    }

    if ($Verbose) { $parameters['Verbose'] = $true }

    try {
        if($Verbose){
            Invoke-PS2EXE @parameters
        } else {
            Invoke-PS2EXE @parameters *> $null
        }
        Write-Host "✅ Built $InputFile -> $OutputFile"
    } catch {
        Write-Host "❌ Build failed for $($InputFile): $_"
    }
}

Write-Host "🏗️ Building scripts into executables..."

Get-ChildItem -Path . -Recurse -Filter *.ps1 | Where-Object { $_.Name -notmatch "build\.(ps1|exe)$" } | ForEach-Object {
    $inputFile = $_.FullName
    $outputFile = [System.IO.Path]::ChangeExtension($inputFile, ".exe")
    
    $iconFile = Get-ChildItem -Path $_.DirectoryName -Filter *.png | Select-Object -First 1 |
                ForEach-Object {
                    $iconPath = $_.FullName.Replace($_.Extension, '.ico')
                    ConvertTo-Icon -File $_.FullName -OutputFile $iconPath
                    $iconPath
                }

    $isConsole = $_.Name -like "*Console*"
    Build-Executable -InputFile $inputFile -OutputFile $outputFile -IconFile $iconFile -IsConsole:$isConsole
}

Write-Host "✅ Build process complete!"

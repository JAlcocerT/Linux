# Define source and destination paths
$source = "C:\Users\j--e-\Desktop\CAM"
$destination = "F:\DCIM\DJI_001"

# Ensure the destination folder exists
if (!(Test-Path -Path $destination)) {
    New-Item -ItemType Directory -Path $destination -Force
}

# Get all .MP4 files from source
$files = Get-ChildItem -Path $source -Filter "*.MP4"

# Check if there are files to copy
if ($files.Count -eq 0) {
    Write-Host "No MP4 files found in $source."
    exit
}

$totalFiles = $files.Count
$copiedFiles = 0
$totalBytes = ($files | Measure-Object -Property Length -Sum).Sum
$startTime = Get-Date

foreach ($file in $files) {
    $fileSizeMB = [math]::Round($file.Length / 1MB, 2)
    $fileName = $file.Name
    $sourcePath = $file.FullName
    $destPath = Join-Path -Path $destination -ChildPath $fileName

    $copyStart = Get-Date
    Copy-Item -Path $sourcePath -Destination $destPath -Force
    $copyEnd = Get-Date

    # Calculate time taken for the copy
    $timeTaken = ($copyEnd - $copyStart).TotalSeconds
    $speed = if ($timeTaken -gt 0) { [math]::Round($fileSizeMB / $timeTaken, 2) } else { 0 }

    # Update progress
    $copiedFiles++
    $percentComplete = ($copiedFiles / $totalFiles) * 100

    Write-Progress -Activity "Copying MP4 Files" -Status "Processing: $fileName ($copiedFiles of $totalFiles)" -PercentComplete $percentComplete
    Write-Host "Copied: $fileName - Size: ${fileSizeMB}MB - Speed: ${speed} MB/s"
}

$endTime = Get-Date
$totalTime = ($endTime - $startTime).TotalSeconds
$avgSpeed = if ($totalTime -gt 0) { [math]::Round(($totalBytes / 1MB) / $totalTime, 2) } else { 0 }

Write-Host "`n✅ Transfer complete!"
Write-Host "Total Files: $totalFiles"
Write-Host "Total Size: $([math]::Round($totalBytes / 1MB, 2)) MB"
Write-Host "Total Time: $([math]::Round($totalTime, 2)) seconds"
Write-Host "Average Speed: ${avgSpeed} MB/s"


# # Define source and destination paths
# $source = "C:\Users\j--e-\Desktop\CAM"
# $destination = "F:\DCIM\DJI_001"

# # Ensure the destination folder exists
# if (!(Test-Path -Path $destination)) {
#     New-Item -ItemType Directory -Path $destination -Force
# }

# # Copy only .MP4 files from source to destination
# Get-ChildItem -Path $source -Filter "*.MP4" | ForEach-Object {
#     Copy-Item -Path $_.FullName -Destination $destination -Force
# }

# Write-Host "MP4 files copied successfully!"
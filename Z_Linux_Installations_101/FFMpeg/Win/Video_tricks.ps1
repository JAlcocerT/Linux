###Get-ChildItem -Filter "*.MP4" | ForEach-Object { "file '$($_.Name)'" } | Set-Content file_list.txt


$camFolderPath = Join-Path -Path "C:\Users\j--e-\Desktop" -ChildPath "CAM"

if (Test-Path -Path $camFolderPath -PathType Container) {
  Set-Location -Path $camFolderPath

  Get-ChildItem -Filter "*.MP4" | ForEach-Object { "file '$($_.Name)'" } | Set-Content file_list.txt

  Write-Host "File list generated in: $($camFolderPath)\file_list.txt"
} else {
  Write-Warning "CAM folder not found at: $($camFolderPath)"
}

###ffmpeg -f concat -safe 0 -i file_list.txt -c copy output.mp4 #simple join

# Set ffmpeg path (optional, if ffmpeg is not in system PATH)
$ffmpeg = "ffmpeg"  # Change this to full path if necessary

# Function to generate file_list.txt
function Generate-FileList {
    $outputFile = "file_list.txt"
    $files = Get-ChildItem -Filter "*.mp4" | Sort-Object Name

    if ($files.Count -eq 0) {
        Write-Host "❌ No MP4 files found in the current directory!"
        exit
    }

    $files | ForEach-Object { 'file "{0}"' -f $_.Name } | Set-Content $outputFile
    Write-Host "✅ file_list.txt generated successfully!"
}

# Display menu options
Write-Host "Select an option:"
Write-Host "1) Simple Join & Optional Trim"
Write-Host "2) Create Silenced Video"
Write-Host "3) Add Background Music"
Write-Host "4) Exit"

# Get user choice
$choice = Read-Host "Enter your choice (1-4)"

switch ($choice) {
    "1" {
        Generate-FileList
        Write-Host "Running: Simple join..."
        Start-Process -NoNewWindow -Wait -FilePath $ffmpeg -ArgumentList "-f concat -safe 0 -i file_list.txt -c copy output.mp4"

        # Ask if trimming is needed
        $trimChoice = Read-Host "Do you want to trim output.mp4? (y/n)"
        if ($trimChoice -eq "y") {
            $start = Read-Host "Enter start time in seconds (e.g., 120)"
            $end = Read-Host "Enter end time in seconds (e.g., 900)"
            Start-Process -NoNewWindow -Wait -FilePath $ffmpeg -ArgumentList "-ss $start -to $end -i output.mp4 -c copy trimmed_output.mp4"
            Write-Host "✅ Trimmed video saved as trimmed_output.mp4"
        }
    }
    "2" {
        Generate-FileList
        Write-Host "Running: Silenced video..."
        Start-Process -NoNewWindow -Wait -FilePath $ffmpeg -ArgumentList "-f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4"
        Write-Host "✅ Silenced video saved as output_video.mp4"
    }
    "3" {
        Generate-FileList
        Write-Host "Running: Silenced video..."
        Start-Process -NoNewWindow -Wait -FilePath $ffmpeg -ArgumentList "-f concat -safe 0 -i file_list.txt -c:v copy -an silenced_output_video.mp4"

        # Ask for music file
        $musicFile = Read-Host "Enter the path to your music file (e.g., music.mp3)"
        Write-Host "Adding music..."
        Start-Process -NoNewWindow -Wait -FilePath $ffmpeg -ArgumentList "-stream_loop -1 -i `"$musicFile`" -i silenced_output_video.mp4 -c:v copy -c:a aac -shortest output_with_song.mp4"
        Write-Host "✅ Video with background music saved as output_with_song.mp4"
    }
    "4" {
        Write-Host "Exiting..."
        exit
    }
    default {
        Write-Host "❌ Invalid choice! Please restart the script and enter a number between 1 and 4."
    }
}

Write-Host "`n✅ Process completed!"

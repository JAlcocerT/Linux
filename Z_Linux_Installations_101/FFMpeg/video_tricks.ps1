$camFolderPath = Join-Path -Path "C:\Users\j--e-\Desktop" -ChildPath "CAM"

if (Test-Path -Path $camFolderPath -PathType Container) {
  Set-Location -Path $camFolderPath

  Get-ChildItem -Filter "*.MP4" | ForEach-Object { "file '$($_.Name)'" } | Set-Content file_list.txt

  Write-Host "File list generated in: $($camFolderPath)\file_list.txt"
} else {
  Write-Warning "CAM folder not found at: $($camFolderPath)"
}
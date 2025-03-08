@echo off

:menu
echo Choose an action:
echo 1. Concatenate all .MP4 files in the current folder to output_video.mp4
echo 2. Concatenate all .MP4 files in the current folder to C:\Users\jalcocert\Desktop\output_video.mp4
echo 3. List .MP4 files and their sizes
echo 4. Create file_list.txt with .MP4 files in the current folder
echo 5. Silenced video creation
echo 6. Video speed change
echo 7. Copy .MP4 files to C:\Users\jalcocert\Desktop\oa5pro\ using robocopy
echo 8. Exit
set /p choice="Enter your choice (1-8): "

if %choice%==1 goto concatenate_current
if %choice%==2 goto concatenate_desktop
if %choice%==3 goto list_files
if %choice%==4 goto create_list
if %choice%==5 goto silenced
if %choice%==6 goto speed
if %choice%==7 goto robocopy_files
if %choice%==8 goto exit

echo Invalid choice. Please enter a number between 1 and 8.
pause
goto menu

:concatenate_current
echo Creating file_list.txt...
dir /b *.MP4 > file_list.txt
for /f "delims=" %%a in (file_list.txt) do (
    echo file '%%a' >> file_list_temp.txt
)
move /y file_list_temp.txt file_list.txt >nul
echo Concatenating videos...
ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
del file_list.txt
goto menu

:concatenate_desktop
echo Creating file_list.txt...
dir /b *.MP4 > file_list.txt
for /f "delims=" %%a in (file_list.txt) do (
    echo file '%%a' >> file_list_temp.txt
)
move /y file_list_temp.txt file_list.txt >nul
echo Concatenating videos to desktop...
ffmpeg -f concat -safe 0 -i file_list.txt -c copy C:\Users\jalcocert\Desktop\output_video.mp4
del file_list.txt
goto menu

:list_files
for %%f in (*.MP4) do (
    for /f "tokens=1,2 delims= " %%a in ('dir /a-d /s "%%f"') do (
        if "%%b"=="%%f" echo %%a "bytes" "%%f"
    )
)
pause
goto menu

:create_list
dir /b *.MP4 > file_list.txt
for /f "delims=" %%a in (file_list.txt) do (
    echo file '%%a' >> file_list_temp.txt
)
move /y file_list_temp.txt file_list.txt >nul
echo file_list.txt created.
pause
goto menu

:silenced
echo Creating file_list.txt...
dir /b *.MP4 > file_list.txt
for /f "delims=" %%a in (file_list.txt) do (
    echo file '%%a' >> file_list_temp.txt
)
move /y file_list_temp.txt file_list.txt >nul
echo Creating silenced video...
ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4
del file_list.txt
goto menu

:speed
echo Creating file_list.txt...
dir /b *.MP4 > file_list.txt
for /f "delims=" %%a in (file_list.txt) do (
    echo file '%%a' >> file_list_temp.txt
)
move /y file_list_temp.txt file_list.txt >nul
echo Changing video speed...
ffmpeg -i output_video.mp4 -filter:v "setpts=PTS/4" -an fast_output_video.mp4
del file_list.txt
goto menu

:robocopy_files
robocopy . "C:\Users\jalcocert\Desktop\oa5pro\" *.MP4 /XO /E
pause
goto menu

:exit
echo Exiting...
exit
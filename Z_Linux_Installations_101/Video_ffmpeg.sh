#!/bin/bash

# Function to display options and get user choice
get_choice() {
  echo "Choose an action:"
  echo "1. Concatenate all .MP4 files in the current folder to output_video.mp4"
  echo "2. Concatenate all .MP4 files in the current folder to /home/jalcocert/Desktop/output_video.mp4"
  echo "3. List .MP4 files and their sizes"
  echo "4. Create file_list.txt with .MP4 files in the current folder"
  echo "5. Silenced video creation"
  echo "6. Video speed change"
  echo "7. Copy .MP4 files to /home/jalcocert/Desktop/oa5pro/ using rsync"
  echo "8. exit"
  read -p "Enter your choice (1-8): " choice
  case "$choice" in
    1|2|3|4|5|6|7|8)
      return 0
      ;;
    *)
      echo "Invalid choice. Please enter a number between 1 and 8."
      return 1
      ;;
  esac
}

# Function to concatenate videos
concatenate_videos() {
  if [ "$1" == "current" ]; then
    ffmpeg -f concat -safe 0 -i file_list.txt -c copy output_video.mp4
  elif [ "$1" == "desktop" ]; then
    ffmpeg -f concat -safe 0 -i file_list.txt -c copy /home/jalcocert/Desktop/output_video.mp4
  else
    echo "Invalid destination."
  fi
}

# Function to list files and sizes
list_files_and_sizes() {
  du -sh ./*.MP4
}

# Function to create file_list.txt
create_file_list() {
  ls *.MP4 | sed "s/^/file '/; s/$/'/" > file_list.txt
  echo "file_list.txt created."
}

# Function to create silenced video
create_silenced_video() {
  ffmpeg -f concat -safe 0 -i file_list.txt -c:v copy -an output_video.mp4
}

# function to change video speed
change_video_speed(){
  ffmpeg -i output_video.mp4 -filter:v "setpts=PTS/4" -an fast_output_video.mp4
}

# Function to copy files using rsync
copy_files_rsync() {
  rsync -avP --ignore-existing *.MP4 /home/jalcocert/Desktop/oa5pro/
}

# Main script
while true; do
  if get_choice; then
    case "$choice" in
      1)
        create_file_list
        concatenate_videos "current"
        ;;
      2)
        create_file_list
        concatenate_videos "desktop"
        ;;
      3)
        list_files_and_sizes
        ;;
      4)
        create_file_list
        ;;
      5)
        create_file_list
        create_silenced_video
        ;;
      6)
        create_file_list
        change_video_speed
        ;;
      7)
        copy_files_rsync
        ;;
      8)
        echo "Exiting..."
        exit 0
        ;;
    esac
  else
    continue
  fi
done

# Save the script: Save the code above to a file, for example, video_script.sh.
# Make it executable: Open a terminal and run chmod +x video_script.sh.
# Run the script: Execute the script by running ./video_script.sh.
# Follow the prompts: The script will display a menu of options. Enter the number corresponding to the action you want to perform.
#!/bin/bash

source_format=(.webm .mkv .gif .mov .avi .wmv .flv .vob .gifv .avi .amv)
output_format=.mp4
verbose_flag=0

# Check if input file has been provided as an argument
if [ -z "$1" ]; then
	echo "ERROR: Input file not provided"
	exit 1
fi
echo "File name: $1"

# Check if the input file exists and has the correct format
input_file=$1
input_format=${input_file##*.}
echo "File format: $input_format"

if ! [[ "${source_format[@]}" =~ "${input_format}" ]]; then
	echo "ERROR: Input file format must be a video format ${source_formats[@]}"
	exit 1
elif [ ! -f "$input_file" ]; then
	echo "ERROR: Input file doesn't exist"
	exit 1
fi
echo "File found!"

# Check for verbose flag
if [[ "$2" == "-v" || "$2" == "--verbose" ]] ; then
	echo "Verbose flag provided"
	verbose_flag=1
fi

# Set source and output video names
source_video=$input_file
output_name="${source_video%.*}$output_format"

# Ask the user for the output path
echo "Where do you want to save the converted file?"
PS3="Please enter your choice: "
options=("Home" "Desktop" "Downloads" "Current folder")
select opt in "${options[@]}"
do
    case $opt in
        "Home")
            output_path="$HOME/$output_name"
            break
            ;;
        "Desktop")
            output_path="$HOME/Desktop/$output_name"
            break
            ;;
        "Downloads")
            output_path="$HOME/Downloads/$output_name"
            break
            ;;
        "Current folder")
            output_path="./$output_name"
            break
            ;;
        *) echo "Invalid option. Please enter a valid number.";;
    esac
done

# Convert the input to the output format using ffmpeg
echo "Converting file..."
if [[ $verbose_flag -eq 1 ]]; then
	ffmpeg -i "$source_video" "$output_path"
else
	ffmpeg -i "$source_video" "$output_path" > /dev/null 2>&1
fi

# Success message outputting the file path
echo "File saved as $output_path"

# video-conversor-script
This script converts video files of specific formats to the .mp4 format using the ffmpeg tool. It prompts the user to choose the output location for the converted file.

## Usage
To use the script, run it with the following command:
```bash
./convert_video.sh input_file [options]
```
The `input_file` argument is the path to the video file that you want to convert. The script requires at least one argument.

The following options are available:
-   `-v` or `--verbose`: prints the ffmpeg output to the console.

## Supported formats
The following formats are supported as input formats:

-   .webm
-   .mkv
-   .gif
-   .mov
-   .avi
-   .wmv
-   .flv
-   .vob
-   .gifv
-   .avi
-   .amv

The output format is always `.mp4` and can be changed in the line 4 of the code:
```bash
  4 output_format=.mp4
```

## Output location

The script prompts the user to choose the output location for the converted file. The available options are:

-   Home
-   Desktop
-   Downloads
-   Current folder

## Example
```bash
./convert_video.sh input.webm -v
```
This command converts the `input.webm` file to .mp4 format and prints the ffmpeg output to the console.

## Requirements
The script requires the `ffmpeg` tool to be installed on the system.

## License
This project is licensed under the MIT License - see the [LICENSE](/blob/main/LICENSE) file for details.

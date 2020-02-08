#!/bin/bash
for episode in video/*/*.mkv; do
        echo "checking: $episode"
        directory=${episode%.*}
        # output_file= "$directory" | tr "/" "-"
        output_file=${directory//\//-}
        #echo $output_file

        if [ -d "$directory" ] && [ -d "$directory/matches" ] && [ -d "$directory/splits" ]; then
                basename "$directory"
                f="$(basename -- "$directory")"
                #echo "-- $f"
                for match in "$directory"/matches/*.jpg; do
                        #echo "- $match"
                        IFS='-' # space is set as delimiter
                        read -ra ADDR <<< "$match" # str is read into an array as tokens
                        scene="${ADDR[@]: -2: 1}"
                        #echo $scene

                        scene_file="$directory/splits/$f-Scene-$scene.mp4"
                        echo $scene_file
                        if [ -f "$scene_file" ]; then
                                echo "got one: $scene_file"
                                cp "$scene_file" "output/$output_file-$scene.mp4"
                        fi
                done
        fi
        # exit 1
done

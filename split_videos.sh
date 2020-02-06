#!/bin/bash
for episode in video/*/*.mkv; do
        echo "splitting: $episode"
        directory=${episode%.*}

        if [ -d "$directory" ] && [ ! -d "$directory/splits" ]; then
                if [ ! -d "$directory/splits" ]; then
                        mkdir "$directory/splits"
                fi
                scenedetect --input "$episode" --output "$directory/splits" --stats scene_stats.csv detect-content split-video --high-quality
        fi
done

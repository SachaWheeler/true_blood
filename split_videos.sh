#!/bin/bash
for episode in video/*/*.mkv; do
        echo "splitting: $episode"
        directory=${episode%.*}

        if [ -d "$directory" ]; then
                scenedetect --input "$episode" --output "$directory" --stats scene_stats.csv detect-content split-video --high-quality
        fi
done

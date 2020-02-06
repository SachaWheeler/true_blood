#!/bin/bash
for episode in video/*/*.mkv; do
        echo "detecting: $episode"
        directory=${episode%.*}

        if [ ! -d "$directory" ]; then
                mkdir "$directory"
                # scenedetect --input "$episode" --output "$directory"  detect-content save-images  split-video --high-quality
                scenedetect --input "$episode" --output "$directory" --stats scene_stats.csv  detect-content save-images
                mkdir "$directory/matches"
        fi
done

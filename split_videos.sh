#!/bin/bash
for episode in video/*/*.mkv; do
        echo "editing: $episode"
        directory=${episode%.*}
        echo "dir: $directory"

        if [ ! -d "$directory" ]; then
                mkdir "$directory"
                # scenedetect --input "$episode" --output "$directory"  detect-content save-images  split-video --high-quality
                scenedetect --input "$episode" --output "$directory"  detect-content save-images
                mkdir "$directory/matches"
        fi

        if [ -d "$directory/matches" ]; then
                python facial_recognition.py "$directory"
        fi
done

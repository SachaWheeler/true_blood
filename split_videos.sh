#!/bin/bash
for episode in video/*/*.mkv; do
        echo $episode
        directory=${episode%.*}
        echo $directory

        if [ ! -d "$directory" ]; then
                mkdir "$directory"
                scenedetect --input "$episode" --output "$directory"  detect-content save-images  split-video #--high-quality
        fi

        if [ ! -d "$directory/matches" ]; then
                python facial_recognition.py "$episode"
        fi
done

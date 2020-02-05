#!/bin/bash
for episode in video/*/*.mkv; do
        echo $episode
        directory=${episode%.*}
        echo $directory
        mkdir "$directory"
        scenedetect --input "$episode" --output "$directory"  detect-content save-images  split-video --high-quality
    #for ((i=0; i<=3; i++)); do
        #./MyProgram.exe "$filename" "Logs/$(basename "$filename" .txt)_Log$i.txt"
    #done
    exit 1
done

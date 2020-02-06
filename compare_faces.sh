#!/bin/bash
for episode in video/*/*.mkv; do
        echo "detecting: $episode"
        directory=${episode%.*}

        if [ -d "$directory/matches" ]; then
                python facial_recognition.py "$directory"
        fi
done

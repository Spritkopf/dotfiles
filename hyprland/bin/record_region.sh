#!/bin/env bash

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" && exit 0

dateTime=$(date +%m-%d-%Y-%H:%M:%S)
filename=$HOME/Videos/$dateTime

wf-recorder --bframes max_b_frames --framerate 20 -f $filename.mp4 -g "$(slurp)" && \
ffmpeg -i $filename.mp4 -vf "fps=20" $filename.gif


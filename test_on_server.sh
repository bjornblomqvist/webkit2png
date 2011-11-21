#!/bin/bash

cmd='cd /tmp/; chmod +rx webkit2png;xvfb-run --server-args="-screen 0, 1024x768x24" ./webkit2png --filename=test.png --user-agent="dummy" -F --delay=3 '
cmd=$cmd$2


scp gtk/webkit2png $1:/tmp/webkit2png
ssh $1 -- $cmd
scp $1:/tmp/test.png-full.png /tmp/
open /tmp/test.png-full.png
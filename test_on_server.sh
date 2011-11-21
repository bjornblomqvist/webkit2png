#!/bin/bash

cmd='cd /tmp/; chmod +rx webkit2png;xvfb-run -a --server-args="-screen 0 1024x768x24" ./webkit2png --min-width=320 --out=/tmp/test2.png --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/534.51.22 (KHTML, like Gecko) Version/5.1.1 Safari/534.51.22" --delay=3000 --url='
cmd=$cmd$2

echo $cmd

scp gtk/webkit2png $1:/tmp/webkit2png
ssh $1 -- $cmd
scp $1:/tmp/test2.png /tmp/
open /tmp/test2.png
#!/bin/bash

echo "Script started at $(date)" > ~/start-serve.log

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm use 16 >> ~/start-serve.log 2>&1

serve -s ~/Documents/hmi -l 3000 >> ~/start-serve.log 2>&1 &
sleep 10
echo "Serve started" >> ~/start-serve.log

export DISPLAY=:0
google-chrome --new-window http://localhost:3000 --start-fullscreen >> ~/start-serve.log 2>&1 &
echo "Chrome should be in fullscreen" >> ~/start-serve.log

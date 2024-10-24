#!/bin/bash

# Function to check if gammastep is running
is_running() {
    # Check for any gammastep process
    pgrep -f "gammastep" > /dev/null
}

# Function to start gammastep
start_gammastep() {
    echo "Starting gammastep..."
    gammastep &
    echo "gammastep started with PID: $!"
}

# Function to stop gammastep
stop_gammastep() {
    echo "Stopping gammastep..."
    pkill -f "gammastep"
}

# Check if gammastep is running
if is_running; then
    echo "gammastep is already running. Stopping it."
    stop_gammastep
else
    echo "gammastep is not running. Starting it."
    start_gammastep
fi

# Check the current running instances of gammastep
echo "Current running instances of gammastep:"
ps -ef | grep gammastep


#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Require argument"
    echo "Usage: ./toolkit.sh <argument>"
    echo "Possible arguments:"
    echo "> archive <directory> - Create an archive with logs from your pc default log catalog"
    echo "> memory - Show you used / total disk memory and RAM"
fi

if [ "$1" == "archive" ]; then
    if [ -n "$2" ]; then
        directory=$2
        source "commands/archive-logs.sh"
        archive_logs $directory
    else
        echo "Archive require argument"
        echo "Usage: ./toolkit.sh argument <directory>"
    fi
fi

if [ "$1" == "memory" ]; then
    source "commands/memory-usage.sh"
    memory-monitor
fi

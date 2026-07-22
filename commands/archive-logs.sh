#!/usr/bin/env bash


archive_logs() {
    filename="logs_archive_$(date '+%Y%m%d_%H%M%S').tar.gz"
    tar -czf "$filename" /var/log 2>/dev/null
    mv "$filename" "$1"

    echo "Successfully archived logs in $1"
}
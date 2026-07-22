#!/usr/bin/env bash


memory-monitor() {
    used_ram=$(free | awk '/Mem:/ { print $3 }')
    total_ram=$(free | awk '/Mem:/ { print $2 }')

    ram_to_notify=$(awk -v used="$used_ram" -v total="$total_ram" 'BEGIN { if (used >= total * 0.9) print 1; else print 0 }')

    if (( ram_to_notify == 1 )); then
        notify-send "Warning!" "RAM usage has exceeded 90%!"
    fi

    free | awk '/Mem:/ {printf "RAM: %.2f GiB / %.2f GiB\n", $3/1048576, $2/1048576}'

    PATH_TO_CHECK="${1:-/}"

    df -k "$PATH_TO_CHECK" | tail -n 1 | awk '{printf "DISK: %.2f GiB / %.2f GiB\n", $3/1048576, $2/1048576}'
}
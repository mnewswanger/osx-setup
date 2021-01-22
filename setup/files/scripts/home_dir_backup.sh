#!/bin/bash
if [ -z "$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport -I | grep MDNetwork)" ]; then
    rsync -azv \
        --no-p --no-g --chmod=ugo=rwX \
        --delete \
        --exclude '/.Trash' \
        --exclude '/Library' \
        --exclude '/Music/iTunes/iTunes Media/Apple Music' \
        --exclude '/Paralels' \
        --exclude '/Documents/Virtual Machines.localized' \
        --exclude "/Pictures/Photos Library.photoslibrary/" \
        --timeout=15 \
        ~/ "$(whoami)-backups@192.168.81.18:/mnt/backups/computers/$(hostname)/$(whoami)/"
else
  echo "Connected to mobile hotspot"
  exit 1
fi


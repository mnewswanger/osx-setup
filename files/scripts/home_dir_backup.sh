#!/bin/bash
if [ -z "$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport -I | grep mn-wifi)" ]; then
    rsync -azv --delete --exclude '/Music/iTunes/iTunes Media/Apple Music' --exclude 'Library' --exclude 'Documents/Virtual Machines.localized' --exclude '.Trash' --timeout=15 ~/ "mike@backups.home.mikenewswanger.com:/mnt/backups/computers/$(hostname)/$(whoami)/"
else
  echo "Connected to mobile hotspot"
  exit 1
fi


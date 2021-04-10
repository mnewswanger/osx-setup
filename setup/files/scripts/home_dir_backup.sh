#!/bin/bash
set -e

if [ -z "$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport -I | grep MDNetwork)" ]; then
    rsync -azv \
        --no-p --no-g --chmod=ugo=rwX \
        --delete \
        --exclude '/.Trash' \
        --exclude '/Library/Autosave Information' \
        --exclude '/Library/IdentityServices' \
        --exclude '/Library/Messages' \
        --exclude '/Library/HomeKit' \
        --exclude '/Library/Sharing' \
        --exclude '/Library/Mail' \
        --exclude '/Library/Accounts' \
        --exclude '/Library/Safari' \
        --exclude '/Library/Suggestions' \
        --exclude '/Library/Containers/com.apple.VoiceMemos' \
        --exclude '/Library/Containers/com.apple.archiveutility' \
        --exclude '/Library/Containers/com.apple.Home' \
        --exclude '/Library/Containers/com.apple.Safari' \
        --exclude '/Library/Containers/com.apple.iChat' \
        --exclude '/Library/Containers/com.apple.CloudDocs.MobileDocumentsFileProvider' \
        --exclude '/Library/Containers/com.apple.mail' \
        --exclude '/Library/Containers/com.apple.Notes' \
        --exclude '/Library/Containers/com.apple.news' \
        --exclude '/Library/Containers/com.apple.stocks' \
        --exclude '/Library/Containers/com.docker.docker/Data/vms' \
        --exclude '/Library/PersonalizationPortrait' \
        --exclude '/Library/Preferences/com.apple.homed.notbackedup.plist' \
        --exclude '/Library/Preferences/com.apple.homed.plist' \
        --exclude '/Library/Preferences/com.apple.mail-shared.plist' \
        --exclude '/Library/Metadata/CoreSpotlight' \
        --exclude '/Library/Cookies' \
        --exclude 'Library/Application Support' \
        --exclude 'Library/Caches' \
        --exclude 'Library/Developer' \
        --exclude '/Music/iTunes/iTunes Media/Apple Music' \
        --exclude '/Documents/Virtual Machines.localized' \
        --exclude '/Parallels' \
        --exclude "/Pictures/Photos Library.photoslibrary/" \
        --timeout=15 \
        ~/ "$(whoami)-backups@192.168.92.252:/Volumes/t7/backups/computers/$(hostname)/$(whoami)/"
else
  echo "Connected to mobile hotspot"
  exit 1
fi


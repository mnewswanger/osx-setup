#!/bin/bash
set -e

if [ -z "$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport -I | grep MDNetwork)" ]; then
    rsync -azv \
        --no-p --no-g --chmod=ugo=rwX \
        --delete \
        --exclude '/.Trash' \
        --exclude '/Documents/Virtual Machines.localized' \
        --exclude '/Library/Accounts' \
        --exclude '/Library/Application Support' \
        --exclude '/Library/Assistant' \
        --exclude '/Library/Autosave Information' \
        --exclude '/Library/Biome' \
        --exclude '/Library/Caches' \
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
        --exclude '/Library/Containers/com.apple.corerecents.recentsd/Data/Library/Recents' \
        --exclude '/Library/Containers/com.docker.docker/Data/vms' \
        --exclude '/Library/Cookies' \
        --exclude '/Library/CoreFollowUp' \
        --exclude '/Library/Developer' \
        --exclude '/Library/Group Containers/group.com.apple.secure-control-center-preferences' \
        --exclude '/Library/Group Containers/group.com.apple.notes' \
        --exclude '/Library/HomeKit' \
        --exclude '/Library/IdentityServices' \
        --exclude '/Library/Mail' \
        --exclude '/Library/Messages' \
        --exclude '/Library/Metadata/CoreSpotlight' \
        --exclude '/Library/Safari' \
        --exclude '/Library/Sharing' \
        --exclude '/Library/Shortcuts' \
        --exclude '/Library/Suggestions' \
        --exclude '/Library/PersonalizationPortrait' \
        --exclude '/Library/Preferences/com.apple.homed.notbackedup.plist' \
        --exclude '/Library/Preferences/com.apple.homed.plist' \
        --exclude '/Library/Preferences/com.apple.mail-shared.plist' \
        --exclude '/Library/StatusKit' \
        --exclude '/Music/iTunes/iTunes Media/Apple Music' \
        --exclude '/Parallels' \
        --exclude "/Pictures/Photos Library.photoslibrary/" \
        --timeout=15 \
        ~/ "$(whoami)-backups@backups.home.mikenewswanger.com:/Volumes/t7/backups/computers/$(hostname)/$(whoami)/"
else
  echo "Connected to mobile hotspot"
  exit 1
fi


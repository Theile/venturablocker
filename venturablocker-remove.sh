#!/bin/sh

current_user_uid=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/UID :/ && ! /loginwindow/ { print $3 }' )

launchd_item_path="/Library/LaunchAgents/dk.envo-it.venturablocker.plist"
launchctl bootout gui/${current_user_uid} "${launchd_item_path}"

rm -f /Library/LaunchAgents/dk.envo-it.venturablocker.plist
rm -f /usr/local/bin/venturablocker

pkgutil --forget dk.envo-it.venturablocker

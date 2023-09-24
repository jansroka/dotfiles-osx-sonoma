#!/bin/bash
# originally from https://gist.github.com/flipphillips/ae200a3269ba714b8733fff0e1269cc8

echo "Before..."
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'

echo "Churning..."
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'vacuum LSQuarantineEvent'

echo "After..."
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent'
echo "Done."

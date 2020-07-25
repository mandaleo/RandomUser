#!/bin/sh
#  build_environment.sh
#
BASE_URL=' http://randomuser.me/'

/usr/libexec/PlistBuddy -c "Set BASE_URL $BASE_URL" RandomUser/Networking/Infrasctruture/Environment/Environment.plist

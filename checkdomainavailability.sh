#!/bin/ash
for domainname in $(cat $1); do

    if ! whois $domainname >> /dev/null; then
        echo "$domainname seems to be available! give it a try."
    else
        echo "$domainname seems to be taken! :-("
    fi

done
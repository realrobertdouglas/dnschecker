#!/bin/ash
sites=$( cat $1 )
echo -n "" > /tmp/files/tocheck

for domainname in $sites; do
    echo "checking $domainname..."

    if ! whois $domainname >> /dev/null; then
        echo "$domainname seems to be available!"
        echo "$domainname" >> /tmp/files/potentiallyavailable
    else
        echo "$domainname seems to be taken! :-("
        echo "$domainname" >> /tmp/files/tocheck
    fi
done

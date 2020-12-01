#!/bin/ash
sites=$( cat $1 )
echo -n "" > listofnames

for domainname in $sites; do
    echo "checking $domainname..."

    if ! whois $domainname >> /dev/null; then
        echo "$domainname seems to be available!"
        echo "$domainname" >> /potentiallyavailable
    else
        echo "$domainname seems to be taken! :-("
        echo "$domainname" >> /listofnames
    fi
done
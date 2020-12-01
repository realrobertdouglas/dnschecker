FROM alpine:latest

RUN apk add whois
COPY checkdomainavailability.sh /checkdomainavailability.sh

CMD ["/checkdomainavailability.sh", "listofnames"]
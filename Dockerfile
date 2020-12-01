FROM alpine:latest

RUN apk add whois
COPY checkdomainavailability.sh /checkdomainavailability.sh

CMD ["sh", "checkdomainavailability.sh", "/tmp/files/tocheck"]

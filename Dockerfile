FROM alpine:latest
MAINTAINER Remon Lam [remon@containerstack.io]

RUN set -xe \
	&& apk add --update --no-progress dhcp \
        && rm -rf /var/cache/apk/*

COPY dhcpd.conf /etc/dhcp/dhcpd.conf
RUN ["touch", "/var/lib/dhcp/dhcpd.leases"]

VOLUME ["/etc/dhcp"]

EXPOSE 67/udp 67/tcp
CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]

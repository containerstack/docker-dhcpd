FROM containerstack/alpine-arm:3.6.1
MAINTAINER Remon Lam [remon@containerstack.io]

RUN set -xe \
	&& apk add --update --no-progress dhcp \
	&& rm -rf /var/cache/apk/* && \
	touch /var/lib/dhcp/dhcpd.leases
#COPY sources/dhcpd.conf /etc/dhcp/dhcpd.conf
VOLUME /etc/dhcp

EXPOSE 67/udp 67/tcp
CMD ["/usr/sbin/dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf"]

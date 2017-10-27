# Running dhcpd in a container

## Build image
docker build -t containerstack/dhcpd .

## Run container from image
docker run --rm -d --name dhcpd --net=host -p 67:67 -p 67:67/udp containerstack/dhcpd

### Logs
docker logs dhcpd [container_name]

### Check DHCP leases
docker exec -it dhcpd cat /var/lib/dhcp/dhcpd.leases


## Run container on Docker Swarm

### Persistent Storage
docker run -d --name dhcpd --net=host -p 67:67 -p 67:67/udp -v /storage/dhcpd:/etc/dhcp containerstack/dhcpd

### Swarm Networking

### Create Docker Instance
docker create \
  --name=dhcpd \
  --restart always \
  --net=host \
  --publish=67:67/tcp \
  --publish=67:67/udp \
  --mount=type=bind,src=/mnt/nfs/prod/dhcp/dhcpd,dst=/etc/dhcp \
  containerstack/dhcpd:arm

docker service update --constraint-add=node.hostname!=rpi-arm8-n8.c-s.io dhcpd

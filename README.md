# Running dhcpd in a container

## Build image
docker build -t dhcpd .

## Run container from image
docker run --rm -d --name dhcpd --net=host -p 67:67 -p 67:67/udp containerstack/dhcpd

## Run container on Docker Swarm

### Persistent Storage

### Swarm Networking

### Create Docker Swarm Service

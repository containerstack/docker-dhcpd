# Running dhcpd in a container

# Build image
docker build -t dhcp .

# Run container from image
docker run --net host -d -p 67:67/udp --name dhcp dhcp
docker run --privileged --net host -d -p 67:67/udp --name dhcp dhcp

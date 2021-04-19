#!/bin/sh






# Modify "docker" service to enable sock:
sed -i "s#ExecStart=/usr/bin/dockerd#ExecStart=/usr/bin/dockerd -H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock#g" /lib/systemd/system/docker.service








# Set up "Portainer":

docker volume create portainer_data

docker run -d --restart always --name=Portainer_Control -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

#docker run -d --restart always --name=Portainer_Control -p 9000:9000 portainer/portainer -H tcp://127.0.0.1:2375









# Restart docker service:
systemctl daemon-reload
systemctl restart docker











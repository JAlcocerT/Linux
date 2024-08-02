sudo apt update
sudo apt upgrade

sudo apt install unattended-upgrades -y

apt install docker.io
docker version
docker run hello-world

apt install docker-compose -y

docker-compose --version
#systemctl status docker
#systemctl status docker | grep "Active"
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
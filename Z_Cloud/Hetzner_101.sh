# hetzner_101.sh
sudo apt update
sudo apt upgrade

sudo apt install unattended-upgrades -y
sudo apt install fail2ban
sudo systemctl status fail2ban
sudo systemctl enable fail2ban

apt install docker.io
docker version
docker run hello-world

apt install docker-compose -y

docker-compose --version
#systemctl status docker
#systemctl status docker | grep "Active"

#docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
#docker stop portainer
#docker network connect nginx_default portainer
#docker start portainer
#docker inspect portainer -f '{{ .NetworkSettings.Networks }}'

docker volume create nginx_data
docker volume create nginx_letsencrypt
docker network create nginx_default

#https://fossengineer.com/selfhosting-portainer-docker/
docker run -d \
  -p 8000:8000 \
  -p 9000:9000 \
  --name=portainer \
  --network nginx_default \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v portainer_data:/data \
  portainer/portainer-ce

#https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/
docker run -d \
  --name nginx \
  --network nginx_default \
  --restart unless-stopped \
  -p 80:80 \
  -p 443:443 \
  -p 81:81 \
  -v nginx_data:/data \
  -v nginx_letsencrypt:/etc/letsencrypt \
  jc21/nginx-proxy-manager:latest
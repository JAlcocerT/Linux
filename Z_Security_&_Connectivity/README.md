**Recommended read**

* https://ugeek.github.io/blog/list.html
* https://geekland.eu/

## Check devices in local network

```sh
sudo apt install nast nmap
sudo nast -m
```
or

```sh
nmap -sP 192.168.1.0/24 | grep "scan"
```

## unattended-upgrades

```sh
sudo apt install unattended-upgrades
```
Nota: La función del paquete unattended-upgrades es automatizar el proceso de actualización de nuestro ordenador o servidor.

Una vez instalado el paquete activen las actualizaciones automáticas ejecutando el siguiente comando en la terminal:

```sh
sudo dpkg-reconfigure -plow unattended-upgrades
```

> https://geekland.eu/actualizaciones-automaticas-en-nuestro-equipo-con-unattended-upgrades/
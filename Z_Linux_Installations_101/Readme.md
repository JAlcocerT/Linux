# Insalling in Linux - 101

Trying Linux for the first time?

This guide will get you and your system started with **your favourite Apps**.

1. Benchmark a PC/Server: While [testing the x300](https://jalcocert.github.io/JAlcocerT/asrock-x300-home-server/#benchmarks-101)

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Benchmark101.sh
chmod +x Benchmark101.sh & ./Benchmark101.sh
```

2. [SelfHosting 101](https://jalcocert.github.io/Linux/docs/linux__cloud/selfhosting/):

```sh
curl -O https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Linux_Installations_101/Selfhosting_101.sh

#nano Selfhosting_101.sh #MAKE SURE YOU UNDERSTAND WHAT YOU WILL BE RUNNING
chmod +x Selfhosting_101.sh
sudo ./Selfhosting_101.sh
```

3. Quick Video Edition with ffmpeg, as covered [here](https://jalcocert.github.io/JAlcocerT/my-action-cam-video-workflow/#quick-videos---ffmpeg-cli)

```sh

```

---

### Using sh Scripts:

* <https://jalcocert.github.io/Linux/docs/debian/linux_installing_apps/>


### Using Ansible

* https://jalcocert.github.io/Linux/docs/linux__cloud/ansible/

```sh
apt install ansible
```

```sh
ansible --version
```

File located at `./Z_Ansible/ubuntu-essentials_ansible-playbook.yml`:

```sh
ansible-playbook ubuntu-essentials_ansible-playbook.yml
```

## With NIX

Using NIX Package Manager: <https://jalcocert.github.io/Linux/docs/nix/>
---
title: Ansible
type: docs
prev: /
next: docs/folder/
---

**Ansible** is an **automation tool** that simplifies the management and configuration of servers, applications, and infrastructure. 

# Why Ansible?

It allows you to define tasks in plain text, automate repetitive operations, and ensure consistent system configurations across your network.

**An Automation tool?**

> You simply describe what you want, and this assistant takes care of the rest, ensuring your systems are always in tip-top shape. That's the power of automation, and Ansible is our digital assistant.

## Installing Ansible

```sh
#sudo apt update
#sudo apt upgrade
sudo apt install ansible

#sudo pacman -Syu
#sudo pacman -S ansible
```

Check the version with:

```sh
ansible --version
```

### Installing a particular Ansible

Select which version you want from: <https://pypi.org/project/ansible/>

And install it as Python package:

```sh
sudo apt update
sudo apt install python3-pip
pip install ansible #==9.1.0
ansible --version
```

## Using Ansible

Installing your favourite Apps without effort. I have created some playbooks to install popular apps at: <https://github.com/JAlcocerT/Linux/tree/main/Z_Ansible>


### Example: Install Docker with Ansible

* Create the yml file 
    * Copy paste the one below
    * Use one from Github (review it first to know what you are installing!)
* Execute Ansible

{{% steps %}}

#### Save the Ansible Playbook

```yml
---
- name: Install Docker on Ubuntu's
  hosts: localhost
  become: yes
  vars:
    username: jalcocert  # Replace with your username
  tasks:
    - name: Download and install Docker
      shell: |
        curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
        sh /tmp/get-docker.sh

    - name: Install docker-compose
      apt:
        name: docker-compose
        state: present
        update_cache: yes

    - name: Run Portainer Docker container
      docker_container:
        name: portainer
        image: portainer/portainer-ce
        ports:
          - "8000:8000"
          - "9000:9000"
        restart_policy: always
        volumes:
          - /var/run/docker.sock:/var/run/docker.sock
          - portainer_data:/data
```

### Install and Execute Ansible

```sh
nano install_docker.yml #write the yml below
ansible-playbook install_docker.yml -i inventory.ini #execute our playbook

#curl -o setup_dev_remote.yml -L https://raw.githubusercontent.com/JAlcocerT/Linux/main/Z_Ansible/setup_dev_remote.yml
#ansible-playbook setup_dev_remote.yml
```
{{% /steps %}}


As you can see, now Docker is running:

```sh
#systemctl start docker
systemctl status docker
```

And also [Portainer](https://fossengineer.com/selfhosting-portainer-docker/) is ready:

```sh
docker ps
```

---

## FAQ

{{< tabs items="Ansible+IoT,YAML,TOML" >}}

  {{< tab >}}**Ansible+IoT**: An IoT Project with [Ansible, a Raspberry Pi and some Sensors](https://jalcocert.github.io/RPi/posts/rpi-ansible/){{< /tab >}}
  {{< tab >}}**YAML**: YAML is a human-readable data serialization language.{{< /tab >}}
  {{< tab >}}**TOML**: TOML aims to be a minimal configuration file format that's easy to read due to obvious semantics.{{< /tab >}}

{{< /tabs >}}


{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-ansible/" title="Image Card" image="https://source.unsplash.com/featured/800x600?landscape" subtitle="Unsplash Landscape" >}}
{{< /cards >}}
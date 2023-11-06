---
title: Podman 101
type: docs
prev: docs/Debian/
---

## Podman

Podman is a **container management tool** that is similar to Docker but has some differences in its approach. It allows you to run and manage containers on your system, just like Docker, but it offers some advantages, such as being daemonless (no central server) and providing **compatibility with Docker commands and images**. 

## Why Podman?

Both Podman and Docker are open-source projects, and they are released under different open-source licenses. Here are the licensing details for each of them:

**Docker:**
Docker uses a combination of open-source licenses for its various components. Docker Engine, the core container runtime, was historically under the Apache License 2.0. However, as of Docker CE 19.03 and later, it is released under the "Community Edition License Agreement" (formerly the Docker Software End User License Agreement). This license allows **free use of Docker for non-commercial purposes** but may have some restrictions for commercial use. Be sure to review the license agreement for specific terms and conditions.

Docker also incorporates various open-source components and libraries, each with its own licensing terms. For example, Docker Compose, which is often used with Docker, is typically licensed under the MIT License.

**Podman:**
Podman is released under the terms of the **Apache License 2.0**, which is an open-source license that is generally considered **permissive and business-friendly**. It allows you to use, modify, and distribute the software freely, including for commercial purposes, with relatively few restrictions.

It's worth noting that the choice of open-source license can impact how the software can be used, modified, and redistributed. The Apache License 2.0 used by Podman is considered more permissive and less restrictive than some other open-source licenses, providing greater flexibility for users and developers.


## How to use Podman?


Here's a brief introduction to Podman and how to use it like Docker:

1. **Installation**:
   You can install Podman on a Linux system by using the package manager specific to your distribution. For example, on Ubuntu, you can install it with:

   ```bash
   sudo apt install podman
   ```

2. **Running Containers**:
   To run a container with Podman, you can use the `podman run` command. It works similarly to Docker's `docker run` command. For example:

   ```bash
   podman run -it --rm ubuntu:latest /bin/bash
   ```

   This command runs an Ubuntu container and opens an interactive shell inside it. The `--rm` flag removes the container when it exits.

3. **Pulling Images**:
   You can pull container images from container registries using the `podman pull` command. For example:

   ```bash
   podman pull nginx
   ```

   This command pulls the official Nginx image from the default container registry (Docker Hub).

4. **Listing Containers and Images**:
   To list running containers, you can use `podman ps`. To list all containers (including stopped ones), use `podman ps -a`. To list downloaded images, use `podman images`.

5. **Stopping and Removing Containers**:
   You can stop a running container with `podman stop <container-id>` and remove it with `podman rm <container-id>`. You can also use the `--rm` flag when running containers to automatically remove them when they exit.

6. **Docker Compatibility**:
   Podman is designed to be compatible with Docker commands and syntax. Most Docker commands can be used with Podman without modification, making it easy for Docker users to switch.

7. **Rootless Containers**:
   Podman supports running containers as a non-root user, which enhances security and is similar to Docker's "rootless" mode.

8. **Pods**:
   Podman introduces the concept of "pods," which allow you to group multiple containers together and manage them as a single unit. This is similar to Docker Compose but integrated into Podman.

These are the basic steps for using Podman like Docker. Podman provides a robust and compatible alternative for container management, and you can explore its features and options further by referring to its documentation and using the `man` command for detailed information on specific commands and flags.
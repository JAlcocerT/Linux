---
title: Arch Based Distros
type: docs
prev: docs/first-page
next: docs/Debian/docker
sidebar:
  open: false
---

Arch Linux is a popular, **rolling-release Linux distribution** known for its simplicity, customization, and minimalist design.

It follows a "do-it-yourself" philosophy, allowing users to build their Linux environment from the ground up. Arch's **package manager, Pacman**, provides easy access to a vast repository of software packages, and the **Arch User Repository (AUR)** offers even more community-contributed packages.

While Arch Linux demands a deeper understanding of Linux and requires users to configure many aspects of their system manually, it rewards users with a highly personalized and efficient computing experience. It's a favorite among Linux enthusiasts and experienced users seeking a lightweight and highly customizable operating system.

## WHY a rolling release?

* Continuous Updates: You’re always running the latest software versions without waiting for a new release.
* Less Disruption: No need to perform major version upgrades, which can sometimes require a lot of time and effort.
* Access to New Features: You can access new features and improvements as soon as they’re available.

{{% details title=" WHY a fixed release like Debian?" closed="true" %}}

* Stability: Software updates are thoroughly tested before being released, which can lead to a more stable experience.
* Predictability: You know when major releases will occur, allowing for better planning.
* Long-term Support: Some fixed-release distributions offer long-term support (LTS) versions, which receive updates and security patches for an extended period.

{{% /details %}}

## Ways to Manage Packages in Arch

* [Flatpak](https://jalcocert.github.io/Linux/docs/debian/linux_installing_apps/#flatpak)

* [Nix](https://jalcocert.github.io/Linux/docs/nix/)
  * And [installing common Apps with NIX](https://jalcocert.github.io/Linux/docs/nix/fav-apps/) is as simple as one command.

* [Pacman](https://jalcocert.github.io/Linux/docs/arch/garuda/#pacman---garuda-package-manager)


### SelfHosting with Arch

If you are used to deploy your favourite Apps with [Docker](https://jalcocert.github.io/Linux/docs/debian/docker/) (or [Podman](https://jalcocert.github.io/Linux/docs/debian/podman/)), congratulations, you can use them seamlessly with Arch as you do with Debian, mac or Windows.

For example:

* [Analytic Tools](https://jalcocert.github.io/Linux/docs/linux__cloud.md/analytics/)
* Local Gen AI - [LLMs](https://jalcocert.github.io/Linux/docs/linux__cloud.md/llms/)
* [SelfHosting](https://fossengineer.com/tags/self-hosting/)
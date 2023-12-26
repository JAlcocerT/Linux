---
title: Must Have Apps
type: docs
prev: /docs/gcp/
next: docs/ansible/
draft: false
---

A list of Apps that will [cover 80% of the needs from 80% of the people](https://fossengineer.com/pareto-principle-for-data-analytics/).

## Productivity

* LogSec + Pomatez

```sh
#https://github.com/logseq/logseq/releases/download/0.10.2/Logseq-linux-x64-0.10.2.AppImage
#https://zidoro.github.io/pomatez/
```

* Thunderbird

```sh
nix-shell -p thunderbird
```

## Daily Driver

* Browser

```sh
nix-shell -p librewolf
#nix-shell -p mullvad-browser
```

* Office

```sh
nix-env -iA nixpkgs.libreoffice
```

* Cloud

```sh
nix-shell -p nextcloud-client
```


{{< callout type="info" >}}
This is a Nextcloud Client. For server, [checkout Docker installation](https://jalcocert.github.io/RPi/posts/selfhosting-nextcloud/).
{{< /callout >}}

## Dev + Content

* VSCodium

```sh
nix-shell -p vscodium
```

* OBS Studio

```sh
nix-shell -p obs-studio
```

* Blender

```sh
nix-env -iA nixpkgs.blender
```

## Sec/Privacy

* Bitwarden

```sh
nix-shell -p bitwarden
```

* 2Fa's

```sh
nix-env -iA nixpkgs.waydroid
#https://github.com/twofas/2fas-android
```

* Mullvad VPN

```sh
nix-shell -p mullvad-vpn
```

* Freetube

```sh
nix-env -iA nixpkgs.freetube
```

* Chat

```sh
nix-env -iA nixpkgs.element-desktop
```

{{< callout type="info" >}}
This will install a client for Matrix. If want your own server, checkout the [**Matrix Server** Docker installation](https://fossengineer.com/selfhosting-matrix-synapse-docker/).
{{< /callout >}}


{{% details title="Others" closed="true" %}}

* For offline explorers:

```sh
nix-env -iA nixpkgs.organicmaps
```

* For tinkerers:

```sh
nix-env -iA nixpkgs.rpi-imager
```

{{% /details %}}


## FAQ

### What if I am using Windows still?

You can get these Apps in Windows as well. It would be great if you try them out before switching to Linux as main OS.

If you want to make your life easier, check how to install them with [Chocolatey](https://jalcocert.github.io/Linux/docs/chocolatey/chocolatey).

### What about browser extensions?

* https://2fas.com/browser-extension/
* https://bitwarden.com/download/

### What about the remaining 20% of people and 20% of use cases?

First, I did not want to make this a really complex and long list.

Secondly, if you are able to use Linux with these Apps covering most of your needs, you need to celebrate. You have already passed the most difficult part in your Linux journey.

And now, you should be able to find and use any other App that you need. 

Still something offering resistance? Checkout [how to Virtualize other OS's](https://jalcocert.github.io/Linux/docs/debian/virtualization/)
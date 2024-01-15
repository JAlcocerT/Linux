
---
title: Privacy
type: docs
prev: docs/debian
next: docs/arch
sidebar:
  open: false
---

I was also tired of being bombarded with targeted adds - Until I discovered these Apps in Linux.

## Making Linux Private

You already [have a secure OS](https://jalcocert.github.io/Linux/docs/debian/securing_linux/) - with no built in backdoors. And now you want to make it more private.

### Changing Linux DNS

You can try with [PiHole](https://fossengineer.com/selfhosting-PiHole-docker/)

* <https://jalcocert.github.io/RPi/posts/selfh-internet-better/#unbound-dns>

Whats my current DNS?

```sh
sudo apt install resolvconf
sudo systemctl status resolvconf.service
```

## Changing Bad Habits

Use different tools to search:


* [Whoogle!](https://fossengineer.com/selfhosting-whoogle-docker/)
* <https://jalcocert.github.io/RPi/posts/selfh-internet-better/#searxng>
* Youtube Alternatives:
  * NewPipe / Youtube-DL https://jalcocert.github.io/RPi/posts/youtube-video-download/
  * https://github.com/tubearchivist/tubearchivist

### VPNs

* <https://jalcocert.github.io/Linux/docs/debian/linux_vpn_setup/>

---

## FAQ

### Crypto? 

You are not in the right place.

But there are couple of wallets that you can use in Linux:

```sh
flatpak install flathub org.electrum.electrum #BTC

flatpak install flathub org.featherwallet.Feather #Monero
#flatpak install flathub org.getmonero.Monero
```

Use them wisely and be responsible.


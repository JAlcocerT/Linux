
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
  * <https://github.com/JamesTurland/JimsGarage/tree/main/Unbound>
* Or try [Bind9](https://hub.docker.com/r/ubuntu/bind9#!)

Whats my current DNS?

```sh
sudo apt install resolvconf
sudo systemctl status resolvconf.service
```

{{< callout type="info" >}}
Check your DNS with: WireShark
And the DNS performance with: GRC's DNS Benchmark, Knot DNS Resolver , DNSPerf or dnsmasq
{{< /callout >}}

<iframe width="560" height="315" src="https://www.youtube.com/embed/xAo61IaXun8" frameborder="0" allowfullscreen></iframe>

## Changing Bad Habits

Use different tools to search:


* [Whoogle!](https://fossengineer.com/selfhosting-whoogle-docker/)
* <https://jalcocert.github.io/RPi/posts/selfh-internet-better/#searxng>
* Youtube Alternatives:
  * NewPipe / Youtube-DL https://jalcocert.github.io/RPi/posts/youtube-video-download/
  * https://github.com/tubearchivist/tubearchivist

* Use a Password Manager: Bitwarden, KeePass...

### VPNs

* <https://jalcocert.github.io/Linux/docs/debian/linux_vpn_setup/>

### Communication

* Thunderbird allows you not only to use email, but to connect to Matrix Servers
* Rocket.chat
* 

{{< callout type="info" >}}
You can [SelfHost your own Matrix Server](https://fossengineer.com/selfhosting-matrix-synapse-docker/) and Federate it with other servers if you wish.
{{< /callout >}}


---

## FAQ

Definitely check: 

* <https://github.com/pluja/awesome-privacy>
* <https://github.com/awesome-selfhosted/awesome-selfhosted>
* <https://github.com/anderspitman/awesome-tunneling>
* <https://www.techlore.tech/>

<!-- 
https://libreselfhosted.com/ -->

### Crypto? 

This is not in the right place to learn big about Crypto - but [WhyCryptoCurrencies](https://whycryptocurrencies.com/) it is (and Free).

But there are couple of wallets that you can use in Linux:

```sh
flatpak install flathub org.electrum.electrum #BTC

flatpak install flathub org.featherwallet.Feather #Monero
#flatpak install flathub org.getmonero.Monero
```

Use them wisely and be responsible.

* DeFi Protocols Info: <https://defillama.com/top-protocols>
  * Example: <https://defillama.com/yields?attribute=stablecoins>
    * <https://ethereum.org/stablecoins>
* Create your own Crypto Analytics Dashboard with [Dune](https://github.com/duneanalytics/docs)
  * Also, you can see [what others have created and whats trending](https://dune.com/browse/dashboards?tags=DeFi)

{{< callout type="info" >}}
How this also resonates with Linux? 

Well, nature of crypto is F/OSS (if it is not you better run):

* Many [wallets](https://ethereum.org/wallets/find-wallet) are F/OSS
* Smart Contracts are F/OSS
  * And [dApps](https://dappradar.com/) sense is also F/OSS
* And you can have a look to full history of transactions: [ETH](https://etherscan.io/txs), [BTC](https://bitcoinexplorer.org/)...
{{< /callout >}}
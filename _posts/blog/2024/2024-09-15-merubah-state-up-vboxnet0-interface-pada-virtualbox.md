---
layout: 'post'
title: "Merubah State UP vboxnet0 Interface pada VirtualBox di Arch Linux"
date: 2024-09-15 19:05
permalink: '/blog/:title'
author: 'BanditHijo'
license: true
comments: true
toc: true
category: 'blog'
tags: ['Tips', 'VirtualBox', 'Arch Linux']
pin:
hot:
contributors: []
description: "Ketika baru memasang Oracle VirtualBox di Arch Linux, saya tidak dapat terhubung dengan instance yang baru saya buat, padahal saya sudah menggunakan Host-only network adapter. Ternyata interface vboxnet0 belum diberikan permission untuk UP state."
---

# Pendahuluan

{{ page.description }}

```
5: vboxnet0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 0a:00:27:00:00:00 brd ff:ff:ff:ff:ff:ff
```

Saya tidak tahu apakah problem ini dialami juga oleh distro lain atau tidak karena saya tidak menggunakan distro selain Arch Linux.


# Solusi

Sata perlu melakukan set `vboxnet0` interface permission untuk dapat UP, sebelum saya dapat menggunakan dengan Host-only Network Adapter.

{% shell_user %}
sudo ip link set vboxnet0 up
{% endshell_user %}

```
5: vboxnet0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 0a:00:27:00:00:00 brd ff:ff:ff:ff:ff:ff
```

Seperti yang kamu dapat lihat pada `<BROADCAST,MULTICAST,UP>`, sekarang `vboxnet0` interface sudah ketambahan permission untuk `UP` state.

Tapi, langkah penyelesaian masalah belum selesai.

Saya perlu menambahkan IP network range (CIDR. Classless Inter-Domain Routing) yang sudah saya setup di VirtualBox untuk `vboxnet0` interface.

Saya sudah mengkonfigurasi IP network yang saya definisikan sendiri untuk Host-only Network Adapter,

```
IPv4 Address: 10.10.10.1
IPv4 Network Mask: 255.255.255.0
```

Jadi, saya punya `10.10.10.1/24` sebagai IP network range.

Kemudian tinggal dimasukkan ke perintah,

{% shell_user %}
sudo ip addr add 10.10.10.1/24 dev vboxnet0
{% endshell_user %}

```
5: vboxnet0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
    link/ether 0a:00:27:00:00:00 brd ff:ff:ff:ff:ff:ff
    inet 10.10.10.1/24 scope global vboxnet0
       valid_lft forever preferred_lft forever
```

That's it!

Sekarang, saya dapat melakukan ping ke instance IP address yang saya buat di VirtualBox dan dapat melakukan SSH ke dalamnya.

{% box_info %}
VirtualBox mungkin sudah memiliki IP network range (CIDR. Classless Inter-Domain Routing) default untuk interface `vboxnet0` yang biasanya bernilai,

```
IPv4 Address: 192.168.57.1
IPv4 Network Mask: 255.255.255.0
```

Ini berarti, IP network rangenya (CIDR) adalah `192.168.57.1/24`.
{% endbox_info %}


# Pesan Penulis

Terima kasih sudah mampir yaa.


# Referensi

1. bbs.archlinux.org: virtualbox can not UP the vboxnet0 interface \
   <https://bbs.archlinux.org/viewtopic.php?id=131711> \
   Diakses tanggal: 2024-09-15

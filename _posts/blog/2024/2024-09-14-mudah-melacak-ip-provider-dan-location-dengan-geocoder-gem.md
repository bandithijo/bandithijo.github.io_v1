---
layout: 'post'
title: "Mudah Melacak IP Provider dan Location dengan Geocoder Gem"
date: 2024-09-14 08:34
permalink: '/blog/:title'
author: 'BanditHijo'
license: true
comments: true
toc: true
category: 'blog'
tags: ['Tips', 'Ruby']
pin:
hot:
contributors: []
description: "Sebelum menggunakan Geocoder Gem, saya menggunakan infosniper.net untuk mengetahui IP provider dan location. Repotnya, saya harus membuka browser. Dengan Geocoder Gem, saya hanya perlu menggunakan Terminal. Praktis."
---

# Pendahuluan

{{ page.description }}

{% image https://i.postimg.cc/N0H4RbVD/gambar-01.png | 1 | Tampilan Website infosniper.net %}

# Problem

Mengakses web service infosniper.net hanya untuk mengetahui location dan provider dari sebuah IP address, sangat tidak praktis.

# Solusi

Praktis akan sangat berbeda-beda bagi setiap orang, tapi bagi saya, praktis artinya saya dapat menyelesaikan tujuan saya hanya dari Terminal. Hanya dengan mengetikkan baris command ke Terminal, kemudian hasil yang saya inginkan sudah tercapai.

Saya membutuhkan gem (library pada Ruby) yang bernama [Geocoder](https://github.com/alexreisner/geocoder).

Gem ini menambahkan command `geocoder` ke dalam command shell kita. Kita dapat mencari *street address*, IP Address, *postal code*, *coordinates (latitude, longitude)*, dan lain-lain.

{% box_perhatian %}
Geocoder Gem ini secara default menggunakan OpenStreetMap Service.
{% endbox_perhatian %}

## Prerequisite

Sudah harus terinstall Ruby di sistem

## Install Gem

Install gem dengan cara,

{% shell_user %}
gem install geocoder
{% endshell_user %}

## Cara penggunaan

{% shell_user %}
geocode 18.139.194.139
{% endshell_user %}

```
Latitude:         1.2897
Longitude:        103.8501
Full address:     Singapore 018989, SG
City:             Singapore
State/province:   Singapore
Postal code:      018989
Country:          SG
Map:              https://www.openstreetmap.org/?lat=1.2897&lon=103.8501&zoom=15&layers=M
```

Atau gunakan option `--json` atau `-j` untuk output dalam bentuk JSON.

{% shell_user %}
geocode 18.139.194.139 --json
{% endshell_user %}

```
{
  "ip": "18.139.194.139",
  "hostname": "ec2-18-139-194-139.ap-southeast-1.compute.amazonaws.com",
  "city": "Singapore",
  "region": "Singapore",
  "country": "SG",
  "loc": "1.2897,103.8501",
  "org": "AS16509 Amazon.com, Inc.",
  "postal": "018989",
  "timezone": "Asia/Singapore",
  "readme": "https://ipinfo.io/missingauth"
}
```

That's it!


# Pesan Penulis

Terima kasih sudah mampir yaa.


# Referensi

1. infosniper.net \
   <https://infosniper.net/> \
   Diakses tanggal: 2024/09/14

2. alexreisner/geocoder \
   <https://github.com/alexreisner/geocoder> \
   Diakses tanggal: 2024/09/14

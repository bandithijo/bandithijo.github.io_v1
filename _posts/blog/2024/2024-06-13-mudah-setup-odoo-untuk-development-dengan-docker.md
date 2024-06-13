---
layout: 'post'
title: "Mudah Setup Odoo untuk Development dengan Docker"
date: 2024-06-13 07:52
permalink: '/blog/:title'
author: 'BanditHijo'
license: true
comments: true
toc: true
category: 'blog'
tags: ['Tips', 'Docker', 'Odoo']
pin:
hot:
contributors: []
description: "Catatan kali ini saya mendemonstrasikan proses pemasangan Odoo dengan Docker untuk proses development. Docker dipilih karena membuat proses pemasangan Odoo menjadi lebih praktis."
---

# Pendahuluan

{{ page.description }}

# Latar Belakang Masalah

Memasang paket Odoo dari source code cukup membuat khawatir karena banyaknya paket dependensi yang mesti dipasang. Belum lagi kalau proses nya gagal dengan sebab yang bermacam-macam.

Developer experience memasang Odoo dari source code kurang begitu menyenangkan untuk saya.

# Pemecahan Masalah

Oleh karena itu, saya memilih menggunakan pemasangan Odoo dengan [Docker image](https://hub.docker.com/_/odoo).

# Rules for My Development Tools

1. Odoo data and PostgreSQL data should lay down on the host, not in the Docker volume. This ensures that I don't need to worry about the data.
1. It should be possible to doing Docker compose up and down in a robust and flexible manner.

# Cooking

1. Create directory to keep all ingredients in one place

   ```
   mkdir odoo-docker
   ```
   Go in to those directory.

1. Create file with name `docker-compose.yml`

   ```
   touch docker-compose.yml
   ```

1. Open file `docker-compose.yml` with your favorit text edior and fill in with recipe below

   ```yaml
    services:
        odoo:
            container_name: odoo
            image: odoo:17.0
            env_file: .env
            volumes:
                - ./etc/odoo:/etc/odoo
                - ./extra-addons:/mnt/extra-addons
                - ./var/lib/odoo:/var/lib/odoo
            ports:
                - 8069:8069
            depends_on:
                - postgres
            networks:
                - odoo-network
        postgres:
            container_name: odoo-postgres
            image: postgres:16.1
            env_file: .env
            volumes:
                - ./var/lib/postgresql/data/pgdata:/var/lib/postgresql/data/pgdata
            networks:
                - odoo-network
    networks:
        odoo-network:
            driver: bridge
   ```

1. Please provide directories to store the Odoo data and PostgreSQL data

   ```
   mkdir -p ./var/lib/odoo && mkdir -p ./var/lib/postgresql/data/pgdata
   ```

1. Compose it up, to cook the recipe

   ```
   docker compose up -d
   ```

   ```
   [+] Running 3/3
    ✔ Network 20_odoo-network  Created                               0.1s
    ✔ Container odoo-postgres  Started                               0.6s
    ✔ Container odoo           Started                               0.9s
   ```
   As you can see, it will create `odoo`, `odoo-postgres` container and `odoo-network` network.

1. Check all `odoo` and `odoo-postgres` container status. It must be `Up`

   ```
   docker ps -n 2
   ```

   ```
   CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS         PORTS                                                      NAMES
   a3d40f8d967b   odoo:17.0       "/entrypoint.sh odoo"    6 seconds ago   Up 4 seconds   0.0.0.0:8069->8069/tcp, :::8069->8069/tcp, 8071-8072/tcp   odoo
   ad76281699bd   postgres:16.1   "docker-entrypoint.s…"   6 seconds ago   Up 4 seconds   5432/tcp                                                   odoo-postgres
   ```

1. Fix Odoo data `var/lib/odoo` directory permission *

   ```
   docker exec -u root odoo chown odoo:odoo -R /var/lib/odoo
   ```
   \* Above command only run once on the first time. Next compose up, you don't need to run this command again.

1. Open your browser and access Odoo
   ```
   http://localhost:8069
   ```
   Done! You're good to go!


# Re-cooking

If you have done playing with Odoo, just run

```
docker compose down
```

```
[+] Running 3/3
 ✔ Container odoo           Removed                                 0.9s
 ✔ Container odoo-postgres  Removed                                 0.2s
 ✔ Network 20_odoo-network  Removed                                 0.1s
```

to taking down all the Odoo container things.

**Don't worry about your data.** It safe on `var/lib/odoo/.local/` and `var/lib/postgresql/data/pgdata/`.

And if you want to get Odoo again, just run 

```
docker compose up -d
```

And you get your data back.

That's it!


# Pesan Penulis

Saya sudah membuatkan GitHub repository untuk mendokumentasikan Odoo docker-compose recipe racikan saya, yang bisa kamu akses di sini, [BanditHijio's Odoo Docker Compose](https://github.com/bandithijo/odoo-docker-compose).

Terima kasih sudah mampir yaa.

# Referensi

1. Odoo tutorials \
   <https://www.odoo.com/slides/all/tag/odoo-tutorials-9> \
   Diakses tanggal: 2024/06/13
1. Define modue data \
   <https://www.odoo.com/documentation/17.0/developer/tutorials/define_module_data.html> \
   Diakses tanggal: 2024/06/13
1. Coding guidelines (Module structure, XML files, Python, JavaScript, CSS, and SCSS) \
   <https://www.odoo.com/documentation/17.0/contributing/development/coding_guidelines.html> \
   Diakses tanggal: 2024/06/13

# 📦 BanditHijo.dev

<a href="https://bandithijo.github.io">
<img alt="banner" width="100%" src="./assets/img/banner/banner.png" />
</a>

## 🍱 Requirements

`Ruby 3.3.4` `Jekyll 4.3.3`

## 🏃 Menjalankan Blog secara Offline

Untuk menjalankan blog ini secara offline, berikut langkah-langkahnya:

1. **Cloning**
    ```
    $ git clone https://github.com/bandithijo/bandithijo.github.io.git
    ```

1. **Install daftar gem yang diperlukan**
    ```
    $ bundle install
    ```

1. **Jalankan Jekyll pada localhost**
    ```
    $ rake jekyll:server
    ```
    \* Blog ini berisi ratusan artikel, tunggu proses build hingga selesai, <u>+</u> 40 detik. \
    Untuk proses edit, yang tidak berhubungan dengan perubahan style, penambahan file, dll, dapat menggunakan \
    ```
    $ rake jekyll:server:inc
    ```
    \* Dengan penambahan flag `:inc` / `--incremental` proses build saat mengedit artikel akan menjadi lebih cepat! ⚡

1. **Buka Browser, akses blog pada alamat:**
    ```
    http://localhost:4000
   ```

1. **Push to Source Branch** \
    Setelah selesai menambahkan atau mengedit *content*, jalankan perintah berikut ini untuk mendeploy perubahan ke *remote repo*.
    ```
    $ rake jekyll:push
    ```


## 📬 Update Konten Terbaru

Untuk mengunduh konten terbaru ke lokal repo, berikut langkahnya:

1. **Pulling** \
    Selalu lakukan _pulling_ untuk mensinkronisasikan dengan data _remote repo_.
    ```
    $ git pull origin source
    ```
1. **Jalankan blog secara offline, di mulai dari nomor 3** \
    [di sini](#-menjalankan-blog-secara-offline) 


## 🧱 Ingin Ikut Berkontribusi Menulis/Mengedit Artikel?

*Sedang dalam proses penyusunan...*

---
layout: 'page'
title: 'Rambu-rambu dalam Blog'
permalink: '/bantuan/'
toc: true
---

<img class="post-body-img" src="{{ site.lazyload.logo_blank_banner }}" data-echo="https://s20.postimg.cc/6y5oddqtp/banner_bantuan.png" alt="banner">

{% include doa_awal.html %}

Selamat datang, mas Bro!

Halaman bantuan BanditHijo.dev. Ini adalah halaman yang berisi beberapa penjelasan dan keterangan mengenai bentuk-bentuk tanda baca, atau saya sebut rambu-rambu, yang mungkin diperlukan untuk memahami dalam membaca artikel yang ada di dalam blog ini.

# Anatomi Blog

{% image https://i.postimg.cc/Hkr6B2P9/gambar-03.png | 3 %}

1. **Navigation Menu**
2. **Body Blog**: Dapat berubah-ubah sesuai dengan judul dari halaman
3. **Sidebar**: Dapat berubah-ubah sesuai dengan isi dari halaman

# Command Line
Berikut ini adalah contoh _command line interface_,

## User Terminal

{% shell_user %}
sudo pacman -Syu
{% endshell_user %}

## Root Terminal

{% shell_root %}
pacman -Syu
{% endshell_root %}

Kamu perlu menyalin / _copy & paste_ baris-perbaris tanpa diikuti dengan simbol yang ada di depannya **$** dan **#**, karena simbol ini adalah simbol yang menandakan _previlege_ dari _shell_ tersebut, apakah sedang menggunakan _user shell_ atau _root shell_.

# Command Line & Output

## Output dari Terminal Command

Output dari Terminal, akan langsung ditampilkan di bawah dari command.

{% shell_user %}
sudo pacman -Syu
{% endshell_user %}

```
:: Synchronizing package databases...
 core                                                                         130.1 K
 extra                    1599.3 KiB   186K/s 00:09 [##########################] 100%
 community                   4.2 MiB   127K/s 00:34 [##########################] 100%
 multilib                  168.4 KiB  4.98M/s 00:00 [##########################] 100%
:: Starting full system upgrade...
resolving dependencies...
looking for conflicting packages...

```

## Output dari Text Editor

Ketika membuka text editor, outputnya juga akan ditampilkan di bawahnya.

{% shell_user %}
sudo vim /etc/pam.d/polkit-1
{% endshell_user %}

{% highlight_caption /etc/pam.d/polkit-1 %}
{% highlight sh linenos %}
#%PAM-1.0

auth       sufficient   pam_fprintd.so
auth       include      system-auth
account    include      system-auth
password   include      system-auth
session    include      system-auth
{% endhighlight %}

# Code & Output

Code dan output dapat ditampilkan dengan kotak yang bentuknya hampir sama. Code di atas dan output ada di bawahnya, cara membedakannya tergantung dari konteks yang sedang dibahas.

## Single Line Code

```python
print('Hello, mas Bro !')
```

```
Hello, mas Bro !
```

Kadang terdapat pula code block dengan line number dan nama file.

{% highlight_caption file_name.py %}
{% highlight python linenos %}
print('Hello, mas Bro !')
{% endhighlight %}

```
Hello, mas Bro !
```

## Multi Line Code

```python
# Menampilkan output sebanyak n
if bandit in range(5):
    print(angka)
```

```
bandit
bandit
bandit
bandit
bandit
```

Kadang terdapat pula code block dengan line number dan nama file.

{% highlight_caption file_name.py %}
{% highlight python linenos %}
# Menampilkan output sebanyak n
if bandit in range(5):
    print(angka)
{% endhighlight %}

```
bandit
bandit
bandit
bandit
bandit
```

## Code in Paragraph

Ini adalah contoh `code` di dalam sebuah paragraf. Dapat digunakan untuk menunjukkan command line, code one line, ataupun nama dari file atau direktori.

# Quote

## Quote Biasa

>Apabila fingerprint option tidak terdapat pada menu Settings, kalian dapat menambahkan username kalian ke dalam input group.

## Quote Perhatian

Apabila terdapat hal yang sangat penting untuk disampaikan di tengah-tengah artikel, akan terdapat box seperti di bawah.

{% box_perhatian %}
<p>Apabila fingerprint option tidak terdapat pada menu Settings, kalian dapat menambahkan username kalian ke dalam input group.</p>
{% endbox_perhatian %}

## Quote Informasi

Box informasi akan diberikan apabila terdapat informasi yang ingin ditekankan oleh penulis. Tampilan box informasi akan seperti di bawah.

{% box_info %}
<p>Kabar gembira! Bagi teman-teman yang belum mempunyai akun netacad untuk mendownload Cisco Packet Tracer, dapat terlebih dahulu membaca instruksi yang diberikan oleh mas <b>fathurhoho</b> pada tautan berikut ini >> <a href=""><b>Cara Mendaftar Akun Netacad</b></a></p>
{% endbox_info %}

## Quote Pertanyaan

Apabila terdapat pertanyaan-pertanyaan yang sering diajukan, saya akan menampilkannya dalam box seperti di bawah.

{% box_pertanyaan %}
<p><b>Apakah penulis juga menggunakan fingerprint scanner saat login?</b></p>
<p>Saya sendiri, menggunakan LightDM untuk login kedalam i3wm, dan saya tidak mengatur option fingerprint scanner untuk login ke dalam sistem.</p>
{% endbox_pertanyaan %}

# Gambar

Gambar yang ada di dalam post, dapat diklik untuk memperbesar. Lalu, klik di area mana saja untuk keluar.

## Gambar Besar

{% image https://i.postimg.cc/yxBZdyR4/gambar-01.png | 1 | Contoh gambar besar %}

## Gambar Kecil

{% image https://i.postimg.cc/C1b8SQzs/gambar-02.png | 2 | Contoh gambar kecil %}

## Gambar Tanpa Caption

{% image https://i.postimg.cc/C1b8SQzs/gambar-02.png %}

# Bullets & Numbering
## Bullets
* Unorder list 1
* Unorder list 2
* Unorder list 3

## Numbers
1. Order list 1
2. Order list 2
3. Order list 3

# Keyboard
Untuk instruksi berupa tekan tombol tertentu pada _keyboard_, akan ditampillkan dalam rambu seperti di bawah.

<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Del</kbd>

<kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>B</kbd>

<kbd>Super</kbd> + <kbd>2</kbd>

<kbd>1</kbd> + <kbd>2</kbd> + <kbd>3</kbd> + <kbd>4</kbd>

<kbd>F1</kbd>

# Tabel

| No | Header 1 | Header 2 | <center>Header 3</center> | Header 4 | <center>Header 5</center> |
| :--: | :--: | :--: | :-- | :--: | :-- |
| 1 | Data | Data | Data | Data | `data.service` |
| 2 | Data | Data | Data | Data | `data` |
| 3 | Data | Data | Data | Data | `data.service` |
| 4 | Data | Data | Data | Data | `data.service` |
| 5 | Data | Data | Data | Data | `data.service` |

<p class="img-caption" style="text-align:left;">Sumber: <a href="" target="_blank">Arch Wiki</a></p>

# Fitur Tambahan

{% image https://i.postimg.cc/sXGmRr1Z/gambar-04.png %}

Untuk memenuhi kebutuhan area baca yang lebih lebar, teman-teman dapat menggunakan tombol seperti ini
<span style="background:#008352;color:#FFF;font-weight:bold;border-radius:3px;padding:1px 2px;">&#9776;</span> yang tepat berada di samping kanan dari judul artikel.

{% image https://i.postimg.cc/Hsyq9q2n/gambar-05.png %}

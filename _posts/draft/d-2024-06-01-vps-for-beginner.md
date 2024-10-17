---
layout: post
title: Deploy Web Sederhana ke VPS BiznetGio
author: huda
categories: [Coding]
tags: [tutorial, devops]
math: true
---

Pada kesempatan kali ini aku mau sharing tutorial deploy web sederhana ke Virtual Private Server (VPS). VPS yang aku gunakan adalah VPS dari [BiznetGio](https://www.biznetgio.com/?ref=iniakunhudacom) yaitu Neo LITE. Sebenernya kriteria VPS yang paling kecil juga boleh karena tutorial kali ini hanya fokus ke langkah-langkah bagaimana deploy web dengan connect menggunakan ssh.

## Persiapan

Tutorial ini menggunakan environment MacOS, namun untuk OS lainnya seharusnya tidak jauh berbeda. Jika teman-teman menggunakan Linux, seharusnya lebih mudah karena Linux sudah built-in dengan ssh. Sedangkan untuk Windows, teman-teman bisa menggunakan [Windows Terminal](https://aka.ms/terminal) yang sudah support ssh.

Atau menggunakan aktivasi SSH Server via Command Prompt (Windows 10 / 11) [https://www.youtube.com/watch?v=zsZMKsZHXEE](https://www.youtube.com/watch?v=zsZMKsZHXEE)

## Registrasi & Beli VPS

### 1. Registrasi terlebih dahulu

Lakukan registrasi seperti biasa di website [BiznetGio](https://portal.biznetgio.com/user/register?ref=iniakunhudacom). Setelah melakukan registrasi lakukan konfirmasi melalui email. Kemudian masuk ke dashboard Portal BiznetGio menggunakan username dan password yang sudah dibuat sebelumnya. 

![Step 1](https://web-cms.biznetgio.com/uploads/pemula_1_3ca843e818.png){: .shadow .rounded-10 .bg-white }

### 2. Pilih NEO Lite

Setelah berhasil daftar, lengkapi profil kamu terlebih dahulu. Kemudian ke halaman Dashboard dan pilih menu **Compute** lalu ke **NEO Lite** lalu **Create New** untuk membeli VPS. 

![Step 2](https://web-cms.biznetgio.com/uploads/pemula_2_f43e3a00b5.png){: .shadow .rounded-10 .bg-white }

### 3. Lengkapi form NEO Lite

Banyak pilihan VPS yang kamu pilih sesuai dengan kebutuhan. Informasi tipe & spesifikasinya bisa kamu lihat di halaman detail produk [Neo Lite](https://www.biznetgio.com/product/neo-lite?ref=iniakunhudacom).

Tutorial kali ini menggunakan spesifikasi *NEO Lite SS 2.2* menggunakan vCPU 2 Core, RAM 2 GB, dan storage 60 GB. Kamu boleh pakai apa aja.

![Step 3](/assets/img/posts/12/step0.png){: .shadow .rounded-10 .bg-white }

Penjelasan :

- **NEO Lite Service Name**: Merupakan nama dari layanan, bisa dibuat sesuai keinginanmu.
- **Region**: Merupakan lokasi dari server tempat berjalannya NEO Lite. Saat ini tersedia pilihan di Jakarta dan West Java.
- **Operating System**: Bisa kamu pilih sesuai OS yang ingin digunakan, tersedia beberapa pilihan distro Linux. Pilih Ubuntu 20.04.
- **SSH Key**: SSH Key sendiri cara untuk mengakses NEO Lite menggunakan SSH. Fungsi SSH Key akan dijelaskan kembali kemudian. Disini kamu meng-generate SSH key baru atau meng-import SSH Key yang lama.
- **Console**: Merupakan kredensial yang digunakan untuk mengakses server menggunakan web browser.
- **Username**: Username yang digunakan untuk mengakses server menggunakan SSH. Misal: hudadev
- **Password**: Password yang digunakan untuk mengakses server. Gunakan kombinasi password yang kuat.

<div class="alert alert-warning d-flex" role="alert">
    <a name="explain_query_key_value">&nbsp;</a>
    <i class="fas fa-info-circle mt-2"></i>
    <div style="margin-left: 0.7em;">
        <p><strong>Penting</strong></p>
        <p>Kita akan melakukan generate SSH Key sendiri, form jangan disimpan terlebih dahulu</p>
    </div>
</div>

### 4. Generate SSH Key

Pada bagian section SSH Key, kita akan membuat SSH Key sendiri. Caranya klik **IMPORT SSH KEY** dan akan muncul form inputan nama SSH Key dan Publik key dari SSH.

Kita buka terminal / command prompt terlebih dahulu. Dan ketikkan perintah di bawah ini untuk menggenerate ssh key baru.

```bash
ssh-keygen
```

![Step 4](/assets/img/posts/12/step1.png){: .shadow .rounded-10 .bg-white }

Catatan :

- Simpan SSH Key dengan nama yang mudah diingat, misalnya `id_neo_testing`.
- Enter phassphrase bisa dikosongkan
- Enter same passphrase again bisa dikosongkan


Perintah di atas akan menghasilkan 2 file baru yaitu private key dan public key.

> Private key berfungsi untuk mendekripsi pesan atau data yang telah di enkripsi menggunakan public key. Karena memiliki peran yang sangat penting dalam keamanan sistem, private key harus disimpan dengan aman dan tidak boleh dibagikan kepada orang lain.
> Sementara itu, public key digunakan untuk mengenkripsi pesan atau data, dan hanya private key yang sesuai yang dapat melakukan dekripsi terhadap pesan atau data tersebut.

 Yang akan kita upload di form Neo Lite adalah public key. Untuk melihat public key, kita bisa menggunakan perintah berikut.

```bash
cat **FOLDER_SSH**/id_neo_testing.pub
```

- `FOLDER_SSH` adalah folder tempat SSH Key disimpan. Jika kamu tidak mengubah lokasi penyimpanan, maka folder defaultnya adalah `~/.ssh/`.
- Kalau di mac, `FOLDER_SSH` biasanya ada di `/Users/USERNAME/.ssh/`

Kemudian, copy semua isi dari file tersebut dan paste ke form SSH Key di BiznetGio.

![Step 4](/assets/img/posts/12/step2.png){: .shadow .rounded-10 .bg-white }

- **SSH Key Name**: Nama SSH Key. Misal: MAC-NEOL-TEST
- **Public Key**: Isi dari file public key yang sudah di-generate sebelumnya.

Setelah itu, isi form lainnya sesuai kebutuhan dan klik **Next**.

### 5. Review & Order

Setelah mengisi semua form, cek kembali apakah sudah benar atau belum. Jika sudah benar, klik **Order**. Tambahkan kupon dengan memilih **Have a promo code?** dan masukkan kode kupon yang kamu miliki.

![Step 4](/assets/img/posts/12/step3.png){: .shadow .rounded-10 .bg-white }

Tunggu sampai status VPS berubah menjadi **Active**. Setelah itu, kamu bisa mengakses VPS menggunakan SSH.


## Menggunakan VPS

### 1. Mengakses VPS

Setelah berhasil membuat VPS, kamu bisa mengakses VPS menggunakan SSH. Buka terminal dan ketikkan perintah berikut.

```bash
ssh -i LOKASI_KEY USERNAME@IP_ADDRESS
```

- `LOKASI_KEY` adalah lokasi dari SSH Key yang sudah kamu buat sebelumnya.
- `USERNAME` adalah username yang kamu buat sebelumnya.
- `IP_ADDRESS` adalah alamat IP dari VPS yang kamu beli.

Misalnya seperti ini.

```bash
ssh -i /Users/miftahulhudaf/.ssh/id_neo_testing hudadev@103.127.111.111
```

Jadi,

- `/Users/miftahulhudaf/.ssh/id_neo_testing` adalah lokasi dari SSH Key yang sudah aku buat sebelumnya.
- `hudadev` adalah username yang aku buat sebelumnya.
- `103.127.111.111` adalah alamat IP dari VPS yang aku beli.


Kemudian klik enter. Jika berhasil, kamu akan masuk ke VPS seperti gambar di bawah ini.

![Step 5](/assets/img/posts/12/step5.png){: .shadow .rounded-10 .bg-white }


### 2. Menginstall Nginx

Setelah berhasil masuk ke VPS, langkah selanjutnya adalah menginstall Nginx. Nginx adalah web server yang ringan dan cepat. Ketikkan perintah berikut.

```bash
sudo apt update
sudo apt install nginx
```

Setelah proses instalasi selesai, coba buka browser dan akses IP VPS kamu. Jika berhasil, kamu akan melihat halaman default Nginx.

![Step 6](/assets/img/posts/12/step6.png){: .shadow .rounded-10 .bg-white }


### 3. Deploy Web

Langkah terakhir adalah deploy web ke VPS. Kamu bisa menggunakan git untuk mengupload web ke VPS. Pada tutorial kali ini, saya akan menggunakan repository web cv sederhana yang sudah dibuat oleh [KalanaKt](https://github.com/kalanakt/cv-site)

![Step 6](/assets/img/posts/12/step7.png){: .shadow .rounded-10 .bg-white }


Berikut langkah-langkahnya.

#### 1. Buat folder untuk menyimpan web.

```bash
sudo mkdir /var/www/html/cv
```

#### 2. Ubah permission folder.

```bash
sudo chown -R $USER:$USER /var/www/html/cv
```

#### 3. Clone repository web.

```bash
cd /var/www/html/cv
git clone https://github.com/iniakunhuda/cv-site.git .
```


#### 5. Buka browser dan akses IP VPS kamu misalnya 172.168.111.111/cv Jika berhasil, kamu akan melihat web yang sudah di-deploy.

![Step 7](/assets/img/posts/12/step8.png){: .shadow .rounded-10 .bg-white }


## Kesimpulan

Itulah tutorial deploy web sederhana ke VPS BiznetGio. Semoga tutorial ini bermanfaat dan bisa membantu kamu dalam mengelola VPS. Jika ada pertanyaan, jangan ragu untuk bertanya di kolom komentar.

Mungkin selanjutnya kita akan melakukan setup domain dan SSL di VPS BiznetGio menggunakan *server blocks* Nginx (sama seperti *virtual hosts* in Apache). Stay tuned!

## Referensi

- [https://www.biznetgio.com/?ref=iniakunhudacom](https://www.biznetgio.com/?ref=iniakunhudacom)
- [https://www.biznetgio.com/product/neo-lite?ref=iniakunhudacom](https://www.biznetgio.com/product/neo-lite?ref=iniakunhudacom)
- [https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04)
- [https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04)
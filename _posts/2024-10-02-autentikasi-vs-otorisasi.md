---
layout: post
title: Autentikasi vs Otorisasi (Authentication vs Authorization)
author: huda
categories: [System Design]
tags: [security, authentication, authorization]
image: /assets/img/posts/14/banner.png
math: true
---

# Perbedaan Antara Autentikasi dan Otorisasi (Authorization vs Authentication)

Autentikasi (authentication) dan otorisasi (authorization) adalah dua konsep penting dalam dunia keamanan sistem informasi. Meskipun sering digunakan secara bergantian, keduanya memiliki peran yang sangat berbeda dalam memastikan bahwa hanya pengguna yang berhak yang dapat mengakses sumber daya atau informasi tertentu. Mari kita bahas lebih dalam perbedaan, kapan perlu menggunakannya, serta istilah-istilah dan tips terkait.

---

## Perbedaan Antara Autentikasi dan Otorisasi

### Autentikasi (Authentication):  
  Autentikasi adalah proses untuk memverifikasi identitas pengguna. Tujuan utama dari autentikasi adalah untuk memastikan bahwa pengguna yang mengakses sistem atau aplikasi benar-benar orang yang mereka klaim. Autentikasi biasanya dilakukan dengan cara memeriksa kredensial pengguna, seperti username dan password, atau metode biometrik, seperti sidik jari atau pemindai wajah.

![Authentikasi](/assets/img/posts/14/1.png){: .shadow .rounded-10 .bg-white }

  **Contoh Autentikasi:**
  - Pengguna login menggunakan nama pengguna dan kata sandi.
  - Pengguna memverifikasi identitas melalui otentikasi dua faktor (2FA), seperti kode OTP yang dikirimkan ke ponsel.

### Otorisasi (Authorization):  
  Setelah proses autentikasi, otorisasi adalah langkah untuk menentukan hak akses atau izin yang dimiliki oleh pengguna. Ini memastikan bahwa pengguna yang telah terverifikasi hanya dapat mengakses informasi atau sumber daya yang sesuai dengan izin yang diberikan. Otorisasi menentukan apa yang dapat dan tidak dapat dilakukan oleh pengguna di dalam sistem.

![Otorisasi](/assets/img/posts/14/2.png){: .shadow .rounded-10 .bg-white }

  **Contoh Otorisasi:**
  - Setelah login, pengguna hanya dapat mengakses halaman profil dan tidak dapat mengakses data admin.
  - Seorang manajer dapat membuat dan mengedit data, sementara karyawan biasa hanya dapat melihat data.

---

## Kapan Perlu Menggunakan Autentikasi dan Otorisasi?

![Keduanya](/assets/img/posts/14/3.png){: .shadow .rounded-10 .bg-white }

- **Autentikasi Diperlukan:**
  Autentikasi diperlukan setiap kali sistem perlu memverifikasi siapa yang mengakses aplikasi atau data. Ini adalah langkah pertama untuk menjaga keamanan data dan memastikan hanya pengguna yang sah yang dapat mengakses sistem. Misalnya:
  - Aplikasi yang menyimpan data sensitif, seperti aplikasi perbankan atau sistem manajemen perusahaan, memerlukan autentikasi agar hanya pengguna yang terdaftar yang dapat masuk.
  - Sistem yang melibatkan transaksi atau pengelolaan data penting juga memerlukan autentikasi.

- **Otorisasi Diperlukan:**
  Otorisasi diperlukan untuk mengelola hak akses dan memberikan batasan pada apa yang dapat dilakukan pengguna setelah mereka terverifikasi. Ini memastikan bahwa pengguna hanya dapat mengakses data atau fitur yang sesuai dengan peran atau tingkat izin mereka. Misalnya:
  - Dalam sistem manajemen proyek, hanya manajer yang dapat menambah atau mengedit proyek, sementara anggota tim hanya dapat melihat dan berkomentar.
  - Dalam sistem file berbasis cloud, admin dapat mengatur hak akses bagi setiap pengguna untuk membaca, menulis, atau menghapus file.

- **Kapan Kedua-duanya Diperlukan?**
  Dalam kebanyakan aplikasi atau sistem yang kompleks, **autentikasi dan otorisasi** harus digunakan bersama-sama untuk mencapai keamanan yang optimal. Sistem yang memerlukan autentikasi untuk memverifikasi identitas pengguna, dan otorisasi untuk mengatur hak akses pengguna sesuai peran dan kebutuhan mereka.  
  **Contoh:**
  - Di platform e-commerce, pengguna harus terlebih dahulu login (autentikasi) sebelum bisa membeli produk atau mengakses informasi akun pribadi mereka. Otorisasi digunakan untuk membedakan antara pelanggan, admin, dan penjual yang memiliki hak akses berbeda.

---

## Istilah-istilah dalam Autentikasi dan Tips untuk Keamanan

- **Username dan Password:**  
  Merupakan metode paling dasar dalam autentikasi. Meskipun cukup umum, menggunakan password yang kuat dan unik adalah penting untuk melindungi akun Anda. Hindari penggunaan password yang mudah ditebak atau serupa dengan password lama.

- **Otentikasi Dua Faktor (2FA):**  
  Ini adalah metode yang menambah lapisan keamanan ekstra dengan memerlukan dua langkah untuk mengonfirmasi identitas pengguna. Misalnya, setelah memasukkan username dan password, pengguna diminta memasukkan kode yang dikirim melalui SMS atau aplikasi autentikator (seperti Google Authenticator).

- **Single Sign-On (SSO):**  
  SSO memungkinkan pengguna untuk mengakses berbagai aplikasi dengan satu kali login. Ini sangat mempermudah pengguna dan mengurangi risiko karena mengurangi jumlah password yang perlu diingat.

- **Saran Keamanan untuk Autentikasi:**
  - Gunakan password yang kuat dan aktifkan autentikasi dua faktor (2FA).
  - Jangan menggunakan password yang sama untuk berbagai akun.
  - Gunakan aplikasi pengelola kata sandi untuk menyimpan password secara aman.

---

## Istilah-istilah dalam Otorisasi dan Tips untuk Keamanan

- **Role-Based Access Control (RBAC):**  
![RBAC](/assets/img/posts/14/4.png){: .shadow .rounded-10 .bg-white }
  Merupakan sistem otorisasi yang membatasi akses berdasarkan peran pengguna. Setiap peran diberikan hak akses tertentu, seperti admin, user, atau guest, untuk membatasi data atau tindakan yang bisa diambil.

- **Attribute-Based Access Control (ABAC):**  
![ABAC](/assets/img/posts/14/5.png){: .shadow .rounded-10 .bg-white }
  Metode otorisasi yang lebih canggih, di mana hak akses diberikan berdasarkan atribut pengguna, seperti usia, lokasi, atau status keanggotaan dalam grup tertentu.

- **Least Privilege:**  
![Least Privilige](/assets/img/posts/14/6.png){: .shadow .rounded-10 .bg-white }
  Prinsip ini mengharuskan pengguna diberi hak akses sesedikit mungkin yang diperlukan untuk menjalankan tugas mereka. Ini mengurangi potensi kerusakan yang dapat terjadi jika akun pengguna diakses oleh pihak yang tidak berwenang.

- **Saran Keamanan untuk Otorisasi:**
  - Terapkan prinsip least privilege untuk meminimalkan risiko.
  - Selalu review dan perbarui hak akses pengguna secara berkala.
  - Gunakan mekanisme otorisasi yang dinamis untuk menyesuaikan akses berdasarkan situasi atau kondisi tertentu.

---

## Tools / Library untuk Membantu Autentikasi dan Otorisasi

- **OAuth 2.0:**  
  OAuth 2.0 adalah protokol otorisasi yang memungkinkan aplikasi untuk mengakses sumber daya pengguna atas nama pengguna tersebut tanpa memberikan akses penuh ke kredensial mereka. OAuth 2.0 sering digunakan dalam aplikasi pihak ketiga, seperti aplikasi yang memerlukan akses ke profil media sosial.

- **OpenID Connect (OIDC):**  
  OIDC adalah lapisan identitas yang dibangun di atas OAuth 2.0, memungkinkan aplikasi untuk memverifikasi identitas pengguna dan mendapatkan informasi dasar terkait pengguna (misalnya, nama, alamat email). Sering digunakan dalam sistem Single Sign-On (SSO).

- **JWT (JSON Web Token):**  
  JWT adalah format token yang digunakan untuk mengotentikasi dan mengotorisasi pengguna di aplikasi web atau API. Token ini sering digunakan untuk sesi pengguna yang diakses melalui API atau aplikasi mobile.

- **Keycloak:**  
  Keycloak adalah open-source Identity and Access Management (IAM) system yang menyediakan autentikasi dan otorisasi untuk aplikasi web dan API. Keycloak mendukung SSO, otorisasi berbasis peran (RBAC), dan autentikasi dua faktor (2FA).

- **Auth0:**  
  Auth0 adalah platform layanan identitas yang menyediakan solusi autentikasi dan otorisasi untuk aplikasi. Auth0 mendukung otentikasi dengan menggunakan berbagai metode, termasuk OAuth 2.0, OpenID Connect, dan SAML.

---

## Kesimpulan

Autentikasi dan otorisasi adalah dua komponen yang sangat penting dalam menjaga keamanan sistem dan data. **Autentikasi** memastikan bahwa pengguna yang mengakses sistem benar-benar siapa yang mereka klaim, sedangkan **otorisasi** memastikan bahwa mereka hanya dapat mengakses data atau melakukan tindakan yang sesuai dengan hak akses mereka. Keduanya harus diterapkan bersama-sama dalam aplikasi atau sistem untuk memastikan keamanan yang maksimal. Menggunakan istilah dan tips yang tepat, serta alat yang tersedia, dapat membantu mengimplementasikan autentikasi dan otorisasi dengan lebih efektif dan aman.

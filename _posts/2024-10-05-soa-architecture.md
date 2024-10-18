---
layout: post
title: Service Oriented Architecture (SOA)
author: huda
categories: [System Design]
tags: [soa, system design, architecture]
image: /assets/img/posts/17/banner.png
math: true
---

## Apa itu SOA?

Service Oriented Architecture (SOA) adalah pendekatan arsitektur perangkat lunak yang memecah sistem menjadi komponen-komponen yang independen dan modular, yang disebut layanan (service). Setiap layanan menyediakan fungsionalitas tertentu dan dapat diakses oleh aplikasi atau layanan lain melalui protokol komunikasi standar, seperti SOAP atau REST. SOA sering diterapkan pada sistem yang kompleks dan berorientasi bisnis, terutama yang melibatkan banyak subsistem berbeda, seperti pada sistem informasi akademik (SIAKAD) di perguruan tinggi.

![SOA](/assets/img/posts/17/1.png){: .shadow .rounded-10 .bg-white }


## Kelebihan SOA

![SOA](/assets/img/posts/17/2.png){: .shadow .rounded-10 .bg-white }

SOA memiliki sejumlah kelebihan yang menjadikannya pilihan populer dalam pengembangan perangkat lunak, terutama di lingkungan organisasi besar. Berikut adalah beberapa kelebihan utama:

1. **Interoperabilitas**: Karena SOA menggunakan protokol standar untuk komunikasi, berbagai aplikasi dan sistem yang berbeda (bahkan yang menggunakan bahasa pemrograman atau platform yang berbeda) dapat saling berinteraksi dengan mudah.
   
2. **Reuse (Penggunaan Ulang)**: Salah satu keuntungan utama dari SOA adalah penggunaan ulang layanan yang sudah ada. Layanan-layanan ini dapat diintegrasikan ke dalam berbagai aplikasi tanpa harus mengembangkan fitur yang sama berulang kali.

3. **Scalability (Skalabilitas)**: SOA memungkinkan penambahan layanan baru tanpa mengganggu layanan yang sudah ada. Ini membuat SOA ideal untuk pengembangan sistem yang ingin dikembangkan secara bertahap.

4. **Flexibility (Fleksibilitas)**: SOA memudahkan perusahaan untuk menyesuaikan diri dengan perubahan teknologi atau kebutuhan bisnis. Komponen layanan yang modular membuat setiap layanan dapat diperbarui tanpa memengaruhi sistem lain.

5. **Maintenance (Pemeliharaan yang Lebih Mudah)**: Karena fungsi sistem dibagi ke dalam beberapa layanan independen, setiap layanan dapat diperbaiki atau ditingkatkan tanpa mengganggu layanan lain, sehingga mengurangi downtime dan risiko kegagalan sistem.

## Prinsip Dasar dari SOA

Beberapa prinsip dasar yang menjadi fondasi arsitektur SOA adalah:

1. **Layanan Mandiri (Loose Coupling)**: Setiap layanan di dalam SOA tidak saling ketergantungan secara langsung. Setiap komponen harus dapat berfungsi secara independen dengan memberikan antarmuka yang jelas untuk diakses oleh komponen lain.

2. **Kontrak Layanan (Service Contract)**: Setiap layanan harus memiliki kontrak yang jelas, yang mendefinisikan bagaimana layanan tersebut dapat diakses oleh layanan atau aplikasi lain. Ini biasanya mencakup protokol komunikasi, format data, dan metode akses.

3. **Abstraksi Layanan**: Detail teknis dari implementasi layanan disembunyikan dari konsumen layanan. Konsumen hanya perlu mengetahui antarmuka layanan, sementara detail bagaimana layanan tersebut bekerja di belakang layar tidak perlu diketahui.

4. **Penggunaan Ulang**: Layanan dirancang sedemikian rupa agar dapat digunakan ulang oleh aplikasi atau layanan lain. Ini membantu mengurangi duplikasi kode dan meningkatkan efisiensi pengembangan.

5. **Interoperabilitas**: Layanan dalam SOA dirancang untuk berinteraksi menggunakan protokol yang umum, sehingga memfasilitasi komunikasi antar aplikasi lintas platform.

6. **Komposisi Layanan**: Layanan-layanan yang terpisah dapat dikombinasikan untuk membentuk layanan atau proses yang lebih besar. Hal ini memungkinkan fleksibilitas dalam membangun sistem yang kompleks dari layanan-layanan kecil.

## Komponen SOA

Dalam arsitektur SOA, terdapat beberapa komponen penting yang mendukung operasional dan fungsionalitas sistem secara keseluruhan. Berikut ini adalah beberapa komponen utama dari SOA:

1. **Layanan (Service)**: Unit independen yang menyediakan fungsionalitas tertentu. Setiap layanan memiliki tanggung jawab yang spesifik, seperti layanan manajemen mahasiswa, layanan pengelolaan jadwal kuliah, atau layanan pembayaran biaya kuliah.

2. **Service Provider (Penyedia Layanan)**: Penyedia layanan bertanggung jawab untuk membuat dan mengelola layanan yang tersedia dalam sistem SOA. Mereka juga menyediakan antarmuka untuk mengakses layanan tersebut.

3. **Service Consumer (Pengguna Layanan)**: Pengguna layanan adalah entitas yang mengonsumsi layanan yang disediakan oleh penyedia layanan. Ini bisa berupa aplikasi lain atau komponen lain dalam sistem yang membutuhkan data atau fungsionalitas dari layanan tersebut.

4. **Service Registry**: Pusat informasi yang mencatat dan mengelola metadata tentang layanan yang tersedia. Service registry memungkinkan aplikasi lain untuk menemukan dan memanfaatkan layanan yang tersedia.

5. **Enterprise Service Bus (ESB)**: Jaringan atau sistem yang menghubungkan berbagai layanan dalam SOA. ESB memungkinkan pengiriman pesan antar layanan dan bertindak sebagai mediator untuk memastikan layanan-layanan tersebut dapat saling berkomunikasi.

6. **Service Contracts (Kontrak Layanan)**: Kontrak formal yang mendefinisikan bagaimana layanan akan digunakan. Kontrak ini mencakup informasi tentang metode yang tersedia, format data, dan aturan komunikasi antara layanan.

## Bagaimana Cara Kerja SOA?

Proses kerja SOA dapat dijelaskan melalui beberapa langkah dasar berikut:

1. **Permintaan Layanan**: Client atau pengguna layanan (misalnya, aplikasi SIAKAD) mengirim permintaan ke layanan yang diinginkan, misalnya, layanan pengelolaan data mahasiswa.

2. **Pencarian Layanan**: Aplikasi dapat mencari layanan yang dibutuhkan melalui **service registry** untuk menemukan informasi terkait bagaimana layanan tersebut diakses (misalnya, URL atau endpoint API layanan).

3. **Komunikasi Melalui ESB**: Setelah client mengetahui cara mengakses layanan, komunikasi dilakukan melalui **Enterprise Service Bus (ESB)**, yang bertindak sebagai mediator untuk mengatur pesan antara client dan layanan.

4. **Proses Layanan**: Layanan yang diminta menerima permintaan, memprosesnya, dan menghasilkan respons. Jika layanan ini memerlukan data atau layanan dari sistem lain, komunikasi antar layanan akan terjadi melalui ESB.

5. **Pengiriman Respons**: Setelah layanan selesai memproses permintaan, layanan mengirim respons kembali ke client yang mengirimkan permintaan awal.

Komunikasi antar Layanan SOA  dapat menggunakan protokol SOAP (Simple Object Access Protocol) dan WSDL (Web Services Description Language) untuk berkomunikasi antar layanan. SOA memerlukan infrastruktur yang kompleks, seperti ESB (Enterprise Service Bus), yang bertindak sebagai perantara dalam komunikasi antar layanan.


## Contoh Kasus: Penerapan SOA pada Website SIAKAD

SIAKAD (Sistem Informasi Akademik) adalah sebuah sistem yang digunakan oleh universitas untuk mengelola berbagai data akademik, termasuk pendaftaran mahasiswa, nilai, jadwal kuliah, dan sebagainya. Implementasi SOA pada SIAKAD memungkinkan setiap komponen untuk dipecah menjadi layanan-layanan independen, yang masing-masing memiliki tanggung jawab spesifik.

![SOA](/assets/img/posts/17/3.png){: .shadow .rounded-10 .bg-white }

Sebagai contoh, layanan-layanan berikut dapat diimplementasikan di dalam sistem SIAKAD menggunakan SOA:

1. **Layanan Manajemen Mahasiswa**: Layanan ini menangani semua informasi yang terkait dengan mahasiswa, seperti data pribadi, status pendaftaran, dan transkrip nilai.

2. **Layanan Jadwal Kuliah**: Layanan yang menangani pengaturan jadwal kuliah, termasuk informasi waktu dan tempat perkuliahan, serta dosen yang mengajar.

3. **Layanan Nilai**: Layanan ini bertugas mengelola data nilai mahasiswa, memberikan akses kepada mahasiswa untuk melihat nilai mereka, serta menyediakan antarmuka bagi dosen untuk memasukkan nilai.

4. **Layanan Pembayaran**: Layanan yang mengelola pembayaran biaya kuliah mahasiswa, yang terintegrasi dengan sistem pembayaran eksternal atau perbankan.

Pada contoh implementasi SOA di sistem SIAKAD, langkah ini bisa terjadi saat seorang mahasiswa mengakses layanan untuk melihat jadwal kuliah. Sistem akan melakukan permintaan ke layanan yang menyimpan informasi jadwal, mengambil data yang sesuai, dan menampilkannya ke mahasiswa.

Dengan pendekatan SOA, setiap layanan ini dapat di-deploy dan di-maintain secara independen. Jika terjadi perubahan pada layanan nilai, misalnya, layanan lainnya seperti manajemen mahasiswa atau jadwal kuliah tidak akan terpengaruh.

## Limitasi / Kekurangan SOA

Meskipun memiliki banyak kelebihan, SOA juga memiliki beberapa keterbatasan yang perlu dipertimbangkan:

1. **Kompleksitas Implementasi**: SOA dapat menjadi sangat kompleks dalam hal arsitektur, terutama ketika banyak layanan harus berkomunikasi satu sama lain. Koordinasi antar layanan, monitoring, dan pemeliharaan service registry memerlukan pengelolaan yang baik.

2. **Kinerja (Performance)**: Setiap kali layanan berkomunikasi melalui jaringan, ada overhead yang dihasilkan. Jika tidak dioptimalkan, ini dapat memperlambat kinerja sistem, terutama ketika melibatkan layanan yang memerlukan respons cepat.

3. **Keamanan**: Karena layanan dapat diakses dari berbagai aplikasi atau sistem lain, keamanan menjadi tantangan utama. Setiap layanan harus memiliki pengaturan autentikasi dan otorisasi yang kuat untuk melindungi data dan mencegah akses tidak sah.

4. **Biaya**: Membangun infrastruktur SOA yang solid membutuhkan investasi yang cukup besar, terutama untuk penyediaan ESB, alat monitoring, dan keamanan.

5. **Reliabilitas**: Ketergantungan antar layanan juga dapat menjadi masalah. Jika satu layanan penting mengalami downtime, ini bisa berdampak pada seluruh sistem.


## SOA dengan Beberapa Database

![SOA](/assets/img/posts/17/4.gif){: .shadow .rounded-10 .bg-white }

Pada arsitektur SOA, layanan yang ada biasanya lebih besar dan cenderung terintegrasi dengan sistem-sistem lain yang sudah ada di organisasi. Setiap layanan dalam SOA dapat memiliki database sendiri jika diperlukan. Contoh pada SIAKAD:

- Layanan Manajemen Ujian Sekolah memiliki database yang berisi informasi tentang jadwal ujian, ruang ujian, dan peserta ujian.

- Layanan Akreditasi Sekolah memiliki database yang berisi informasi tentang akreditasi sekolah, evaluasi, dan rekomendasi.

- Layanan Manajemen Orang Tua memiliki database yang berisi informasi tentang data orang tua siswa, hubungan keluarga, dan kontak darurat.

Dalam skenario ini, setiap layanan mungkin memiliki database sendiri atau berbagi database dengan layanan lain, tergantung pada kebutuhan dan skala sistem.

Namun, SOA biasanya menggunakan Enterprise Service Bus (ESB) untuk mengkoordinasikan komunikasi antar layanan, sehingga meskipun beberapa layanan menggunakan database terpisah, mereka dapat tetap saling berkomunikasi melalui ESB. Layanan pada SOA sering kali saling terhubung dan berbagi data melalui mekanisme yang lebih kompleks, berbeda dengan microservices.

**Perbedaan antara SOA dan microservices akan dibahas lebih detail di artikel lainnya.**

## Produk Enterprise Service Bus (ESB) dalam SOA

1. **Apache ServiceMix**: Apache ServiceMix adalah platform open-source yang menyediakan ESB untuk menghubungkan berbagai layanan dalam SOA. ServiceMix mendukung berbagai protokol komunikasi, seperti SOAP, REST, dan JMS.

2. **Apache Thrift**: Apache Thrift adalah framework komunikasi yang digunakan dalam SOA untuk menghasilkan kode stub dan skeleton untuk berbagai bahasa pemrograman. Thrift memungkinkan layanan-layanan yang berbeda untuk berkomunikasi dengan mudah.

3. **Active MQ**: Active MQ adalah layanan messaging yang digunakan dalam SOA untuk mengirim pesan antar layanan. Active MQ mendukung berbagai protokol messaging, seperti AMQP, MQTT, dan STOMP.


## Kesimpulan

Service Oriented Architecture (SOA) menawarkan pendekatan yang sangat fleksibel dan skalabel dalam pengembangan sistem informasi yang kompleks, seperti SIAKAD di perguruan tinggi. Dengan SOA, sistem dapat dipecah menjadi layanan-layanan independen yang dapat dikembangkan, diperbarui, dan dipelihara secara terpisah. Namun, tantangan seperti kompleksitas, performa, dan keamanan juga harus dikelola dengan baik agar implementasi SOA dapat berjalan optimal.

Meskipun terdapat beberapa keterbatasan, SOA tetap menjadi solusi yang kuat untuk integrasi sistem lintas platform dan pengembangan sistem yang terus berkembang.

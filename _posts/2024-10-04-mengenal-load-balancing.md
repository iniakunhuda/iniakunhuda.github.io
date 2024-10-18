---
layout: post
title: Mengenal Load Balancing
author: huda
categories: [System Design]
tags: [load balancing, system design]
image: /assets/img/posts/16/banner.png
math: true
---

## Apa Itu Load Balancing?

**Load Balancing** adalah teknik yang digunakan untuk mendistribusikan lalu lintas jaringan atau beban kerja di antara beberapa server atau node jaringan. Tujuan utama dari load balancing adalah untuk mencegah satu server menjadi kelebihan beban, sehingga meningkatkan kinerja, keandalan, dan ketersediaan sistem secara keseluruhan.

Load balancing dapat diterapkan pada berbagai tingkatan, mulai dari tingkat jaringan hingga tingkat aplikasi. Pada tingkat jaringan, load balancing membagi lalu lintas jaringan di antara beberapa server atau node jaringan, sedangkan pada tingkat aplikasi, load balancing membagi beban kerja aplikasi di antara beberapa server aplikasi.

## Mengapa Load Balancing Penting?

![Load Balancing](/assets/img/posts/16/1.gif){: .shadow .rounded-10 .bg-white }

Ada beberapa alasan mengapa load balancing penting dalam sistem komputasi modern:

1. **Meningkatkan Kinerja**: Load balancing memungkinkan sistem untuk menangani lalu lintas yang lebih besar dengan lebih efisien, sehingga meningkatkan kinerja dan responsivitas sistem.

2. **Meningkatkan Ketersediaan**: Dengan mendistribusikan lalu lintas di antara beberapa server, load balancing membantu mencegah satu titik kegagalan yang dapat menyebabkan sistem menjadi tidak tersedia.

3. **Meningkatkan Skalabilitas**: Load balancing memungkinkan sistem untuk dengan mudah diperluas dengan menambahkan server tambahan, sehingga meningkatkan kapasitas sistem secara keseluruhan.

4. **Meningkatkan Keandalan**: Dengan mendistribusikan lalu lintas di antara beberapa server, load balancing membantu mencegah satu server menjadi titik kegagalan yang dapat menyebabkan sistem menjadi tidak tersedia.

## Cara Kerja Load Balancing

![Load Balancing](/assets/img/posts/16/2.gif){: .shadow .rounded-10 .bg-white }

Load balancing bekerja dengan mendistribusikan lalu lintas jaringan di antara beberapa server atau node jaringan. Terdapat beberapa algoritma load balancing yang dapat digunakan untuk menentukan cara mendistribusikan lalu lintas, seperti:

1. **Round Robin**: Algoritma ini mendistribusikan lalu lintas secara merata di antara server-server yang tersedia. Setiap permintaan diteruskan ke server berikutnya dalam daftar.

2. **Least Connections**: Algoritma ini mendistribusikan lalu lintas ke server dengan jumlah koneksi terendah. Hal ini membantu mencegah satu server menjadi kelebihan beban.

3. **IP Hash**: Algoritma ini menggunakan alamat IP pengguna untuk menentukan server yang akan menerima permintaan. Hal ini memastikan bahwa pengguna akan selalu terhubung ke server yang sama.

4. **Weighted Round Robin**: Algoritma ini mirip dengan Round Robin, namun memberikan bobot yang berbeda untuk setiap server. Server dengan bobot yang lebih tinggi akan menerima lebih banyak lalu lintas.

5. **Weighted Least Connections**: Algoritma ini mirip dengan Least Connections, namun memberikan bobot yang berbeda untuk setiap server. Server dengan bobot yang lebih rendah akan menerima lebih sedikit lalu lintas.

6. **Least Response Time**: Algoritma ini mendistribusikan lalu lintas ke server dengan waktu respons terendah. Hal ini membantu memastikan bahwa pengguna akan terhubung ke server yang paling responsif.

7. **Random**: Algoritma ini memilih server secara acak untuk menerima permintaan. Hal ini dapat membantu mencegah prediktabilitas dalam distribusi lalu lintas.

8. **Least Bandwidth**: Algoritma ini mendistribusikan lalu lintas ke server dengan penggunaan bandwidth terendah. Hal ini membantu mencegah satu server menjadi kelebihan beban.

Setiap algoritma load balancing memiliki kelebihan dan kekurangan yang berbeda, tergantung pada kebutuhan sistem dan karakteristik lalu lintas. Kita akan membahas lebih lanjut tentang algoritma load balancing di postingan selanjutnya.

## Load Balancer

![Load Balancer](/assets/img/posts/16/3.png){: .shadow .rounded-10 .bg-white }

Load balancer adalah perangkat lunak atau perangkat keras yang bertindak sebagai titik masuk tunggal untuk lalu lintas jaringan yang masuk dan mendistribusikannya di antara beberapa server atau node jaringan. Load balancer dapat beroperasi pada tingkat jaringan atau tingkat aplikasi, tergantung pada kebutuhan sistem.

Beberapa fitur umum dari load balancer meliputi:

1. **Health Checks**: Load balancer dapat memeriksa kesehatan server secara berkala untuk memastikan bahwa server masih berfungsi dengan baik. Jika server tidak responsif, load balancer dapat menghentikan lalu lintas ke server tersebut.

2. **Session Persistence**: Load balancer dapat memastikan bahwa pengguna terhubung ke server yang sama selama sesi mereka, sehingga mencegah kehilangan data atau kegagalan otentikasi.

3. **SSL Termination**: Load balancer dapat menangani enkripsi dan dekripsi SSL untuk mengurangi beban pada server aplikasi.

4. **Caching**: Load balancer dapat menyimpan cache dari permintaan sebelumnya untuk meningkatkan kinerja sistem.

5. **Global Load Balancing**: Load balancer dapat mendistribusikan lalu lintas di antara beberapa pusat data yang tersebar di berbagai lokasi geografis, sehingga meningkatkan ketersediaan dan kinerja sistem secara global.


## Provider Load Balancer

Ada beberapa penyedia layanan load balancer yang tersedia di pasaran, seperti:

1. **Amazon Elastic Load Balancing (ELB)**: Layanan load balancer yang disediakan oleh Amazon Web Services (AWS) untuk mendistribusikan lalu lintas di antara beberapa server EC2.

2. **Google Cloud Load Balancing**: Layanan load balancer yang disediakan oleh Google Cloud Platform untuk mendistribusikan lalu lintas di antara beberapa server Compute Engine.

3. **Azure Load Balancer**: Layanan load balancer yang disediakan oleh Microsoft Azure untuk mendistribusikan lalu lintas di antara beberapa server Virtual Machine.

4. **NGINX Load Balancer**: Perangkat lunak load balancer open-source yang dapat digunakan untuk mendistribusikan lalu lintas di antara beberapa server atau node jaringan.

5. **HAProxy**: Perangkat lunak load balancer open-source yang dapat digunakan untuk mendistribusikan lalu lintas di antara beberapa server atau node jaringan.

Setiap penyedia load balancer memiliki fitur dan harga yang berbeda, sehingga penting untuk memilih penyedia yang sesuai dengan kebutuhan bisnis Anda.


## Perbedaan Load Balancing dan CDN

![Load Balancer](/assets/img/posts/16/4.png){: .shadow .rounded-10 .bg-white }

<div class="alert alert-info d-flex" role="alert">
    <a name="explain_query_key_value">&nbsp;</a>
    <i class="fas fa-info-circle mt-2"></i>
    <div style="margin-left: 0.7em;">
        <p class="mb-0">Artikel mengenai <b>Content Delivery Network (CDN)</b> dapat ditemukan <a href="/posts/mengenal-cdn/" target="_blank">disini</a>.</p>
    </div>
</div>

Meskipun load balancing dan **Content Delivery Network (CDN)** memiliki tujuan yang sama, yaitu mendistribusikan lalu lintas di antara beberapa server, ada perbedaan utama antara keduanya:

1. **Tujuan Utama**: Load balancing bertujuan untuk mendistribusikan lalu lintas jaringan atau beban kerja di antara beberapa server atau node jaringan, sedangkan CDN bertujuan untuk menyimpan dan mengirimkan konten situs web kepada pengguna secara lebih cepat dan efisien.

2. **Lingkup Aplikasi**: Load balancing dapat diterapkan pada berbagai tingkatan, mulai dari tingkat jaringan hingga tingkat aplikasi, sedangkan CDN biasanya diterapkan pada tingkat aplikasi untuk mengoptimalkan pengiriman konten situs web.

3. **Algoritma Distribusi**: Load balancing menggunakan algoritma tertentu untuk mendistribusikan lalu lintas di antara beberapa server, sedangkan CDN menggunakan teknik caching dan pengalihan pengguna ke server terdekat untuk mengoptimalkan pengiriman konten.

4. **Fitur Utama**: Load balancing fokus pada mendistribusikan lalu lintas jaringan secara merata di antara server-server yang tersedia, sedangkan CDN fokus pada menyimpan dan mengirimkan konten situs web secara efisien kepada pengguna.

5. **Penyedia Layanan**: Load balancing biasanya disediakan oleh penyedia layanan cloud atau perangkat lunak load balancer, sedangkan CDN disediakan oleh penyedia layanan CDN seperti Cloudflare, Akamai, atau Amazon CloudFront.

Meskipun ada perbedaan antara load balancing dan CDN, keduanya dapat digunakan bersama-sama untuk meningkatkan kinerja, ketersediaan, dan keandalan sistem secara keseluruhan.


## Kesimpulan

Load balancing adalah teknik yang digunakan untuk mendistribusikan lalu lintas jaringan atau beban kerja di antara beberapa server atau node jaringan. Load balancing penting dalam sistem komputasi modern karena meningkatkan kinerja, ketersediaan, skalabilitas, dan keandalan sistem secara keseluruhan. Load balancer adalah perangkat lunak atau perangkat keras yang bertindak sebagai titik masuk tunggal untuk lalu lintas jaringan yang masuk dan mendistribusikannya di antara beberapa server atau node jaringan.
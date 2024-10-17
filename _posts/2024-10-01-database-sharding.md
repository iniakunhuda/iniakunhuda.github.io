---
layout: post
title: Database Sharding
author: huda
categories: [System Design]
tags: [devops, system design]
image: /assets/img/posts/13/banner.png
math: true
pin: true
---

# Database Sharding

## Pengertian Database Sharding

Database sharding adalah teknik untuk membagi sebuah database besar menjadi beberapa bagian yang lebih kecil, disebut dengan "shard". Setiap shard ini adalah subset dari data yang lebih besar, dan setiap shard dapat diakses serta dikelola secara terpisah. Teknik ini umumnya digunakan dalam skenario di mana beban kerja atau ukuran data terlalu besar untuk ditangani oleh satu server database saja.

Dengan sharding, data dibagi berdasarkan kriteria tertentu seperti range data, hash dari nilai tertentu, atau kriteria lainnya yang memungkinkan data dipecah ke beberapa server atau node. Teknik ini bertujuan untuk meningkatkan performa, skalabilitas, serta ketersediaan data dengan mendistribusikan beban kerja ke beberapa server.

## Mengapa Menggunakan Database Sharding?

Database sharding menjadi relevan ketika ukuran database menjadi terlalu besar untuk ditangani oleh satu mesin tunggal. Beberapa alasan utama untuk menggunakan sharding antara lain:

1. **Skalabilitas**: Dengan membagi database menjadi beberapa shard, beban kerja dapat didistribusikan ke beberapa server. Hal ini memungkinkan peningkatan kapasitas penyimpanan dan pemrosesan data.
   
2. **Performa**: Ketika database tumbuh dalam ukuran, waktu respon query juga akan meningkat. Dengan menggunakan sharding, query hanya perlu mengakses shard tertentu, sehingga mempercepat proses pencarian data.

3. **Ketersediaan**: Jika satu shard mengalami kegagalan, shard lain tetap dapat melayani permintaan. Hal ini meningkatkan ketersediaan aplikasi karena kegagalan di satu bagian tidak menyebabkan keseluruhan sistem tidak berfungsi.

4. **Pengelolaan Data yang Lebih Mudah**: Sharding memungkinkan tim untuk mengelola data berdasarkan kriteria tertentu, misalnya berdasarkan wilayah geografis, sehingga pemisahan data dapat dilakukan secara lebih logis dan terstruktur.

## Jenis-Jenis Sharding

Sharding dapat dilakukan dengan berbagai metode, tergantung pada kebutuhan dan karakteristik data. Beberapa metode umum meliputi:

1. **Horizontal Sharding**: Dalam pendekatan ini, tabel dibagi secara horizontal. Setiap shard berisi baris data tertentu dari tabel tersebut, namun kolomnya tetap sama. Misalnya, jika terdapat tabel pelanggan, maka pelanggan dengan ID 1-1000 akan berada di shard pertama, dan pelanggan dengan ID 1001-2000 berada di shard kedua.

2. **Vertical Sharding**: Pendekatan ini membagi tabel secara vertikal, di mana setiap shard menyimpan subset kolom dari sebuah tabel. Ini berguna jika Anda memiliki kolom tertentu yang jarang digunakan, sehingga dapat diisolasi ke shard tersendiri.

3. **Range-based Sharding**: Data dibagi berdasarkan rentang nilai. Misalnya, membagi data berdasarkan tanggal atau ID yang berada dalam rentang tertentu.

4. **Hash-based Sharding**: Data dibagi berdasarkan hasil hash dari kolom tertentu (seperti ID). Ini memastikan distribusi data yang lebih merata antar shard.

## Tantangan dalam Sharding

Meskipun sharding menawarkan banyak keuntungan, ada juga tantangan yang harus dihadapi:

1. **Kompleksitas Manajemen**: Memecah database menjadi beberapa shard berarti meningkatkan kompleksitas dalam pengelolaan database. Perlu ada mekanisme yang efektif untuk melacak data di setiap shard dan memastikan data yang diakses konsisten.

2. **Join dan Query yang Kompleks**: Beberapa query yang melibatkan join antara tabel atau shard yang berbeda dapat menjadi sulit dan tidak efisien. Sharding mengharuskan Anda untuk mendesain query dengan lebih hati-hati.

3. **Pembagian Data yang Tidak Seimbang**: Jika pembagian shard tidak merata (data skew), maka beberapa shard bisa mendapatkan beban yang lebih berat daripada shard lain, menyebabkan ketidakseimbangan dalam performa.

4. **Re-sharding**: Ketika jumlah data bertambah, Anda mungkin perlu menambah shard baru. Proses ini bisa rumit karena Anda harus memindahkan data dari shard lama ke shard yang baru tanpa menyebabkan gangguan pada layanan.


# Horizontal Sharding

![Horizontal Partioning](/assets/img/posts/13/1.png){: .shadow .rounded-10 .bg-white }


Ini adalah strategi untuk melakukan _horizontal scaling_ pada basis data. Sharding berasal dari teknik _horizontal partitioning_, di mana baris-baris dalam satu tabel dipisahkan ke dalam beberapa tabel yang berbeda, yang disebut sebagai _partisi_.

## Apa Tujuan Sharding?

Tujuan utama dari sharding adalah untuk mengurangi waktu yang dibutuhkan untuk mengeksekusi _query_. Semakin sedikit jumlah _record_ yang harus diproses oleh _query_, semakin baik kinerja basis data. Dengan membagi data menjadi beberapa bagian, sharding membantu meningkatkan performa sistem dan mengatasi masalah skalabilitas.

## Logical vs Physical Sharding

![Logical vs Physical Sharding](/assets/img/posts/13/2.png){: .shadow .rounded-10 .bg-white }

Ketika memulai sharding, umumnya digunakan _logical shards_ atau partisi logis. Banyak basis data yang mendukung partisi secara bawaan (_out-of-the-box_). _Logical shards_ adalah partisi horizontal berdasarkan strategi tertentu dan tetap berada di satu instansi atau server basis data yang sama. Namun, ketika satu instansi tidak mampu menangani beban kerja yang besar, _physical sharding_ perlu diterapkan.

Pada _physical sharding_, setiap _shard_ ditempatkan pada node atau instansi server yang berbeda. Satu _shard_ fisik dapat berisi satu atau lebih _logical shards_.


### Contoh Penggunaan Sharding

Pertimbangkan sebuah platform e-commerce besar yang beroperasi secara global. 

- Platform ini harus menyimpan dan mengelola data dalam jumlah besar, seperti produk, pesanan pelanggan, dan inventaris di berbagai wilayah geografis. 

- Sharding membantu memecah data menjadi beberapa _shard_ fisik berdasarkan wilayah geografis, dan di dalam masing-masing _shard_ fisik, _logical sharding_ digunakan untuk mengelompokkan data yang terkait.

Sharding dapat membantu platform mencapai tujuannya. Sebagai contoh:

- Anda dapat menggunakan **physical sharding** untuk membagi data menjadi beberapa shard. Setiap shard menangani wilayah geografis yang berbeda, sehingga data dapat didistribusikan secara terpisah sesuai dengan lokasi. 

- Di dalam setiap physical shard, Anda dapat menerapkan **logical sharding** untuk mengelompokkan data yang terkait. Misalnya, Anda dapat mengelompokkan data pesanan berdasarkan kategori produk tertentu. 

- Dengan cara ini, performa _query_ dapat ditingkatkan karena setiap _query_ hanya bekerja pada bagian data yang lebih kecil, dan operasi tulis atau perbaruan dapat didistribusikan di beberapa server.

## Strategi Sharding

Ada beberapa strategi sharding yang dapat diadopsi tergantung pada kebutuhan.

### Key-Based Sharding

![Key-Based Sharding](/assets/img/posts/13/3.png){: .shadow .rounded-10 .bg-white }

Dalam strategi ini, data dibagi berdasarkan hasil dari fungsi _hash_ yang diterapkan pada satu atau lebih kolom dalam tabel. Biasanya, _hash_ diterapkan pada _primary key_, tetapi juga bisa menggunakan kombinasi beberapa kolom. Hasil dari fungsi _hash_ menentukan di _shard_ mana data akan disimpan.

Strategi _key-based sharding_ sangat berguna ketika data tidak terbagi secara alami dan Anda ingin mendistribusikan data secara merata di berbagai _shard_.

### Range-Based Sharding

![Range-Based Sharding](/assets/img/posts/13/4.png){: .shadow .rounded-10 .bg-white }

Pada _range-based sharding_, data dipecah berdasarkan rentang nilai tertentu dalam sebuah kolom. Misalnya, data produk dalam tabel bisa dipisahkan berdasarkan rentang harga. Sebagai contoh, _shard_ 1 berisi produk dengan harga Rp100.000-Rp500.000, sedangkan _shard_ 2 berisi produk dengan harga Rp500.001-Rp1.000.000

Keuntungan utama dari _range-based sharding_ adalah kemudahan implementasinya. Namun, ada beberapa kelemahan yang akan dibahas di bagian akhir artikel ini.

### Directory-Based Sharding

![Directory-Based Sharding](/assets/img/posts/13/5.png){: .shadow .rounded-10 .bg-white }

Dalam strategi ini, sharding dilakukan berdasarkan tabel _lookup_ atau direktori yang memetakan data ke _shard_ tertentu. Sebagai contoh, data dari lokasi tertentu disimpan dalam _shard_ yang sesuai dengan tabel _lookup_ yang memetakan data tersebut.

Keuntungan utama dari _directory-based sharding_ adalah fleksibilitas yang lebih tinggi dibandingkan strategi lainnya.

## Manfaat dan Kelemahan Sharding

### Manfaat Sharding:

- **Horizontal Scaling:** Sharding membantu dalam mencapai _horizontal scaling_ atau memperbesar kapasitas sistem dengan menambahkan lebih banyak server.
- **Performa Query Lebih Baik:** _Query_ dapat dijalankan lebih cepat karena bekerja pada subset data yang lebih kecil.
- **Reliabilitas Aplikasi:** Jika salah satu _shard_ mengalami kegagalan, aplikasi masih bisa berjalan dengan menggunakan _shard_ lainnya.

### Kelemahan Sharding:

- **Kompleksitas:** Sharding menambah kompleksitas aplikasi karena data tersebar di beberapa server.
- **Ketidakseimbangan Shard:** Seiring waktu, _shard_ bisa menjadi tidak seimbang, menyebabkan _hotspots_ pada basis data.
- **Penghapusan Join Antar Shard:** Dengan sharding, _join_ antar data di _shard_ yang berbeda menjadi sulit atau bahkan tidak mungkin dilakukan.

## Pertimbangan Sebelum Mengadopsi Sharding

### Kapan Harus Menggunakan Sharding?

Sharding sebaiknya bukanlah opsi pertama dalam menyelesaikan masalah skalabilitas basis data. Sebelum memilih sharding, Anda harus mempertimbangkan opsi lain seperti penggunaan indeks yang tepat, replikasi, dan partisi. Sharding sebaiknya dipertimbangkan hanya setelah opsi-opsi tersebut tidak lagi memadai.

### Merancang Fungsi Hash

Pada _key-based sharding_, keberhasilan strategi ini bergantung pada fungsi _hash_. Beberapa hal yang perlu diperhatikan:

- Fungsi _hash_ harus cepat dan efisien.
- Fungsi _hash_ harus mendistribusikan kunci secara merata.
- Fungsi _hash_ harus deterministik, yaitu selalu menghasilkan keluaran yang sama untuk masukan yang sama.

### Memilih Strategi Berdasarkan Jenis Permintaan

Jika _reads_ lebih penting, pilih strategi sharding yang mengutamakan performa _query_. Misalnya, _range-based sharding_ dapat menghasilkan eksekusi _query_ yang lebih cepat. Namun, jika _writes_ lebih penting, strategi _hash-based sharding_ yang mendistribusikan penulisan data secara merata dapat menjadi pilihan yang lebih baik.

Pendekatan lainnya adalah menggunakan _time-based sharding_, di mana data dipecah berdasarkan interval waktu seperti jam atau hari. Ini membantu mendistribusikan operasi tulis secara merata. Contoh penerapan strategi ini adalah Discord, yang menggunakan _time-based sharding_ untuk menangani triliunan pesan.

## Kapan Tidak Menggunakan Strategi Sharding Tertentu?

- **Key-based sharding**: Hindari jika sering menambahkan _shard_ baru, karena ini akan mengubah hasil dari fungsi _hash_ yang bergantung pada jumlah _shard_.
- **Range-based sharding**: Hindari jika data dalam tiap rentang bisa sangat tidak seimbang, karena ini bisa menyebabkan _hotspots_.
- **Directory-based sharding**: Hindari jika Anda ingin menghindari _single point of failure_ seperti tabel _lookup_, karena jika tabel ini gagal, seluruh logika sharding dapat terganggu.

Apakah Anda telah menggunakan sharding dalam aplikasi Anda?

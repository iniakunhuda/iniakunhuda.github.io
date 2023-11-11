---
layout: post
title: "Tutorial Flutter Riverpod: Studi kasus counter app"
author: huda
categories: [Coding, Flutter]
tags: [coding, mobile, flutter]
image: /assets/img/posts/2/banner.png
math: false
---


Pada artikel ini saya akan sharing tutorial membuat sebuah aplikasi Flutter dengan menggunakan _state management_ riverpod. Apa itu _state management_?

![](https://miro.medium.com/v2/resize:fit:1400/1*kC8xgTsDVSoZNt5pDm9-Dw.gif){: .shadow .rounded-10 .bg-white }
<em>Ilustrasi state management (docs.flutter.dev)</em>

_State management_ adalah konsep di dalam sebuah aplikasi untuk mengelola data yang dapat diakses di berbagai halaman seperti _view / widget_. Misalnya ketika login kamu butuh _username_ dan _password_ dari view _login_ untuk kemudian diproses. Begitu pula ketika ada halaman produk, ketika kamu menambahkan item (mengubah _state cart_) maka tampilan yang berubah hanya total pada _icon shopping cart_ dan list produk daftar belanja, tampilan yang lain tidak dirender ulang.

> Flutter merupakan declarative UI, dimana setiap ada perubahan _state_, maka view yang me-listen _state_ tersebut akan dirender ulang secara otomatis

Pada Flutter, terdapat 2 jenis tipe widget yang berbeda dalam mengelola _state,_ yaitu Stateless Widget dan Stateful Widget

-   **Stateless widget,** itu buat data statis. Data — data yang ada di dalam view kamu tidak berubah. Misalnya, _about us screen_, loading _screen_, dsb.
-   **Stateful widget,** itu buat data dinamis. Misalnya, view yang membutuhkan data dari API, halaman kalkulator, detail produk, list _shopping cart screen_, dsb.

Terdapat banyak sekali _state management_ yang digunakan dalam ekosistem Flutter ada Provider, Riverpod (Provider 2.0), Redux, Bloc, dan GetX. Tinggal pilih salah satu sesuai pilihan kita. Alasan saya memilih Riverpod adalah menyesuaikan dengan kebutuhan kantor, jadi saya belum coba state management lain. Artikel ini tidak berisi apa saja perbedaan dari masing-masing _state management_, hanya sesuai dengan pengalaman saya menggunakan Riverpod.

Pada artikel ini saya akan meng-cover fundamental dari riverpod sehingga kamu bisa memahami bagaimana riverpod bekerja.

## Riverpod

[https://riverpod.dev/](https://riverpod.dev/)

Nama Riverpod — anagram dari Provider — adalah versi 2.0 dari Provider. Berdasarkan website resminya, Riverpod mengupdate pengembangan dari Provider mulai dari:

-   Tidak ada lagi _ProviderNotFoundException_
-   Support multiple Provider dengan tipe yang sama
-   Memanggil provider dari mana aja
-   Awaiting asynchronous providers. Misal buat API

Cus langsung ngoding aja biar lebih paham~

## Instalasi Riverpod

Ketik CMD + SHIFT + P dan pilih “add dependencies”, kemudian tulis `flutter_riverpod` dan tekan Enter. Otomatis vscode akan menjalankan command _flutter pub get._

![](https://miro.medium.com/v2/resize:fit:1400/1*cwvY6zuu3FFf19qAdiFznw.png){: .shadow .rounded-10 .bg-white }

Pilih pubspect assist untuk mendownload package

![](https://miro.medium.com/v2/resize:fit:1400/1*mEChHVVUMCXJUcxM_qE8GA.png){: .shadow .rounded-10 .bg-white }

Ketik flutter\_riverpod dan tekan enter

Kamu juga bisa mengupdate file `pubspec.yaml`

```yaml
dependencies:  
    cupertino_icons: ^1.0.2  
    flutter:    
        sdk: flutter  
    flutter_riverpod: ^2.3.6
```

Tada! Kamu sudah berhasil menginstall riverpod prend.

## Membuat Layout

Kita akan membuat layout sederhana dengan label counter di tengah dan floating action button di bawah kanan untuk menambah counter.

![](https://miro.medium.com/v2/resize:fit:1400/1*SAFn2galM0PCg1D-MEV2KA.png){: .shadow .rounded-10 .bg-white }
<em>Layout aplikasi counter app</em>

Edit file **lib/main.dart** dengan kode berikut

Penjelasan kode:

-   `_ConsumerStatefulWidget_` dan `_ConsumerState_` adalah widget yang disupport oleh _flutter\_riverpod_ yang fungsinya sama dengan `StatefulWidget`
-   Jangan lupa untuk import library `flutter_riverpod`


<div class="alert alert-warning d-flex" role="alert">
    <a name="explain_query_key_value">&nbsp;</a>
    <i class="fas fa-lightbulb mt-2"></i>
    <div style="margin-left: 0.7em;">
        <p><strong>Tips</strong></p>
        <p>Karena sudah menginstall plugin snipped flutter, kamu tinggal nulis <em>stfulConsumer</em> dan tekan tab, maka otomatis akan membuat struktur <em>ConsumerStatefulWidget</em></p>
    </div>
</div>

![](https://miro.medium.com/v2/resize:fit:1400/1*RDcHIvUlJFpAh7D3T0BnMA.png){: .shadow .rounded-10 .bg-white }
<em>Snipped biar ga perlu menghafal syntax</em>

## Membuat Model

Ketika membuat model, kita akan memanfaatkan library tambahan untuk membantu memudahkan kita membuat class dengan syntax yang lebih pendek yaitu dengan _freezed_ dan _freezed\_annotation_. Pada gambar di bawah ini adalah contoh ketika menggunakan _freezed_ (sebelah kanan), struktur _class_ otomatis akan digenerate ke file .freezed.dart dan .g.dart

![](https://miro.medium.com/v2/resize:fit:1400/0*a21IDe20ZnJfd2Qm.jpg){: .shadow .rounded-10 .bg-white }
<em>Perbedaan tanpa freezed dan dengan freezed</em>


Saya akan membahas lebih detail penggunaannya di lain waktu. Untuk saat ini kamu bisa edit `pubspec.yaml` dengan kode berikut

```yaml
dependencies:  
    build_runner: ^2.4.5  
    cupertino_icons: ^1.0.2  
    flutter:    
        sdk: flutter  
    flutter_riverpod: ^2.3.6  
    freezed: ^2.3.5  
    freezed_annotation: ^2.2.0  
    json_annotation: ^4.8.1  
    json_serializable: ^6.7.0
```

Jalankan di terminal (Kalau di vscode sudah otomatis)

```bash
flutter pub get
```

Kemudian buat file di **lib/model/counter\_model.dart**

Penjelasan kode:

-   `part ‘counter_model.freezed.dart’` dan `part ‘counter_model.g.dart’` akan membuat file baru yang berisi hasil konversi `freezed class` menjadi format class Flutter
-   `_@Default(0)_` akan memberikan nilai default 0 ketika counter tidak diinisiasi sebuah value
-   `_int counter_` adalah format dari atribut class `CounterModel` yaitu {tipe\_data} dan {nama\_atribut}
-   `_CounterModel.fromJson_` akan membuat fungsi untuk mengkonversi data json menjadi class `CounterModel` berdasarkan atribut yang sudah diset

<div class="alert alert-warning d-flex" role="alert">
    <a name="explain_query_key_value">&nbsp;</a>
    <i class="fas fa-lightbulb mt-2"></i>
    <div style="margin-left: 0.7em;">
        <p><strong>Tips</strong></p>
        <p>Karena sudah menginstall plugin snipped flutter, kamu tinggal nulis <em>frc</em> dan tekan tab, maka otomatis akan membuat struktur <em>freezed class</em></p>
    </div>
</div>

## Membuat Provider

Setelah membuat model, selanjutnya adalah membuat provider di **lib/provider/counter\_provider.dart**

Penjelasan kode:

-   `StateNotifier` dan `StateNotifierProvider` untuk menangani state dengan data yang lebih kompleks, misalnya seperti CounterModel ataupun model lain yang punya banyak atribut
-   Atribut dari `CounterModel` seperti `counter` secara otomatis dapat diakses dalam class CounterNotifier
-   **Tiap perubahan** `state` **di dalam`CounterNotifier` **tidak secara otomatis merebuild UI, dibutuhkan listener**. Dimana dalam kasus ini adalah `StateNotifierProvider` yang disimpan dalam variabel counterProvider. Seperti pada gambar di bawah, ketika user mengklik tombol + yang memanggil fungsi increment(), secara otomatis state `counter` akan bertambah +1 dan UI akan direbuild ulang

![](https://miro.medium.com/v2/resize:fit:1400/1*2bgbgnL5VDHEXxfLvELcxQ.png){: .shadow .rounded-10 .bg-white }
<em>Flow ketika fungsi increment() dipanggil di UI</em>


## Memasang Riverpod di Layout

Selanjutnya, ubah file **lib/main.dart** menjadi seperti kode di bawah

Penjelasan kode:

-   `final counterRepo = ref.read(counterProvider.notifier)` untuk memanggil semua method yang sudah didefinisikan di CounterNotifier. Kenapa pakai **.read**? Karena kita hanya memanggil class tersebut sekali saja ketika komponen sudah berhasil diload
-   Berbeda dengan `final counterState = ref.watch(counterProvider)` yang akan melakukan _subscribe_ ke counterProvider. Mirip seperti kita _subscribe_ ke channel Youtube, ketika ada video baru, maka kita akan otomatis dapet notifikasinya juga.

![Flow counterRepo dan counterState](https://miro.medium.com/v2/resize:fit:1400/1*SHdkU0hsFpyOsdXIhU-q9g.png){: .shadow .rounded-10 .bg-white }
<em>Flow counterRepo dan counterState</em>

## Hasil Akhir

Berikut ini adalah hasil akhir penggunaan dari Riverpod dengan studi kasus counter app. Pada artikel berikutnya, saya akan berbagi bagaimana penggunaan Riverpod dengan studi kasus Todo List.

![](https://miro.medium.com/v2/resize:fit:1200/1*wm1WviJoiq8-0H6QAPUT4g.gif){: .shadow .rounded-10 }

Kamu bisa mengunduh seluruh kodenya disini prend.

<a href="https://github.com/iniakunhuda/tutorial_riverpod_counter_app">https://github.com/iniakunhuda/tutorial_riverpod_counter_app</a>

> **_🔥 Tantangan_**_Tambahkan tombol untuk mengurangi state_ `_counter_` _di bawah tombol plus dan panggil fungsi .decrement_()

![](https://miro.medium.com/v2/resize:fit:640/1*DRiB5351BhsOQ8Byct3S6A.gif){: .shadow .rounded-10 .bg-white }
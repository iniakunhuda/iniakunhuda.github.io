---
layout: post
title: Kolaborasi ambisius antar browser di project Interop
author: huda
categories: [Tech]
tags: [tech, review]
math: true
---

Project Interop adalah suatu inisiasi dari pengembang dari tiap browser (Chromium, Firefox, Safari, Edge) untuk membuat web lebih konsisten di semua browser. Tujuan dari project ini adalah untuk memperbaiki bug, meningkatkan performa, dan memperbaiki kompatibilitas di semua browser.

Project ini berjalan sejak tahun 2019 dan di tahun ini sudah memasuki tahun ke-6. Project ini diinisiasi oleh Google dan Microsoft, kemudian diikuti oleh Mozilla dan Apple. Mereka bekerja sama untuk membuat web lebih konsisten di semua browser.

Pada tahun 2019, awalnya Google dan Mozilla mulai ngejar masalah yang sering dihadapi sama para developer. Mereka bikin survei Penilaian Kebutuhan Developer MNN dan juga Laporan Kompatibilitas Browser yang detil banget. 

Nah, laporan ini kasih kita info lengkap buat atasi problem utama buat developer di platform web, dan akhirnya jadi ngebuat kerja sama dengan berbagai browser lainnya untuk membuat [Compat 2021](https://web.dev/blog/compat2021?hl=id). Fokus utama di tahun 2021 adalah untuk mengatasi kompabilitas di 5 fitur antara lain: CSS flexbox, CSS Grid, position: sticky, aspect-ratio, and CSS transforms.

Salah satu hasil dari [Compat 2021](https://web.dev/blog/compat2021?hl=id) ini adalah bikin pondasi yang kuat buat fitur-fitur keren kayak CSS Grid yang lagi naik terus penggunaannya (12%) dan juga flexbox CSS yang dipake sama 77% developer. Di samping itu, ada juga properti gap di flexbox yang bikin jadi lebih gampang buat developer saat ngeluarin metode tata letak baru.

Darimana mereka memprioritaskan ke-5 masalah tersebut?

![Acer Aspire 1](/assets/img/posts/11/focus.png){: .shadow .rounded-10 .bg-white }
<em>Dikutip dari laman https://web.dev/blog/compat2021</em>

Dikutip dari halaman [Compat 2021](https://web.dev/blog/compat2021?hl=id), mereka mengumpulkan prioritas fitur dari berbagai sumber mulai dari jumlah pengguna, bug dan penilaian pengguna di github, survey MDN, [web platform test](https://github.com/web-platform-tests/wpt#the-web-platform-tests-project), dan [Can I use](https://caniuse.com/). 

Awalnya project ini namanya Compat (Compability), lalu diubah beberapa tahun berikutnya menjadi Interop (Interoperability) karena mereka ingin fokus ke kolaborasi antar browser.


## Kenapa project ini penting?

Saat membuat sebuah web, kita sering menemukan problem perbedaan kompabilitas dari satu browser ke browser lainnya. Misalnya, ketika kita membuat web di Chrome, tiba-tiba di Firefox tampilannya berbeda. Atau ketika kita membuat web di Safari, tiba-tiba di Edge tampilannya berbeda. Ini tentu sangat merepotkan, karena kita harus memperbaiki tampilan web kita di semua browser.

Salah satu contoh fitur yang menghasilkan tampilan yang berbeda di beberapa browser sekitar tahun 2020-an adalah Flexbox. 

```css
.flexbox {
    display: flex;
    flex-direction: column;
    height: 500px;
    justify-content: flex-start;
    align-items: flex-start;
}

.flexbox > * {
    flex: 1;
    min-width: 0;
    min-height: 0;
}
```

```html
<div class="flexbox">
      <img src="cat1.jpg>
</div>
```



Fitur yang paling penting lagi adalah Aksesbilitas. 


## Histori dari tahun ke tahun


## Apa fokus kolaborasi di Interop 2024?


## Bagaimana kita bisa ikutan kontribusi?



---------

## Referensi

[^1]: [Interop 2024](https://web.dev/blog/interop-2024)
[^2]: [Interop 2022](https://web.dev/blog/interop-2022)
[^3]: [Compat 2021](https://web.dev/blog/compat2021)
[^4]: [Flexbox](https://blogs.igalia.com/svillar/2021/01/20/flexbox-cats-a-k-a-fixing-images-in-flexbox/)
[^5]: [Webkit Interop 2024](https://webkit.org/blog/14955/the-web-just-gets-better-with-interop/#interop-2023)
[^6]: [Can I Use: Flexbox](https://caniuse.com/?search=flexbox)

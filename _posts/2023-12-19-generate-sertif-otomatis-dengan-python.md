---
layout: post
title: "Generate 1000 Sertifikat Otomatis dalam 3 detik dengan Python"
author: huda
categories: [Coding, Python]
tags: [coding, python]
image: /assets/img/posts/5/banner.png
math: true
---
## Latar Belakang

Saya aktif di beberapa komunitas IT di Surabaya. Dan salah satu kendala yang saya hadapi ketika menjadi penanggung jawab untuk membuat sertifikat acara bagi peserta, panitia dan speaker. Di event terakhir, yaitu Devfest 2023, saya harus membuat sertifikat peserta sebanyak lebih dari 1000 sertifikat. Dannn itu ga mungkin saya lakukan secara manual.

Sebenarnya ada beberapa opsi untuk membuat sertifikat otomatis tanpa harus coding. Yaitu membuat menggunakan Canva. Tapi masalahnya adalah ketika membuat sertifikat di canva saya tidak bisa menyimpan file satu per satu dan menamainya sesuai nama peserta. Bayangin ngerename semua nama peserta secara manual harus habis berapa hari 😭

## Script Python

Apa saja yang perlu disiapkan:
- Python 3.8 yang sudah terinstall
- Install library PIL dan pandas
- Pengetahuan dasar mengenai python
- File CSV yang berisi data peserta
- Siapkan design sertifikat
  

```python
Name,Email
Miftahul Huda,iniakunhuda@gmail.com
Budi Doremi Putra,randompeserta@gmail.com
```
{: file='peserta.csv'}



```python
from PIL import Image, ImageFont, ImageDraw
import pandas as pd

def main():
    print("Initializing Script!")
    names = pd.read_csv('peserta.csv')
    for i,row in names.iterrows():
        name = str(row['Name'])
        name = name.title()
        word_length = len(name.split(" "))

        empty_img = Image.open("sertif.png").convert("RGB")


        if(word_length > 4):
            font_size = 70
            bottom = -50
        else:
            font_size = 80
            bottom = -50


        W,H = empty_img.size 
        font = ImageFont.truetype(r"OpenSans.ttf", font_size)
        (_, _, w, h) = font.getbbox(name)
        width = ((W-w)/2)
        height = ((H-h)/2) + bottom


        image_editable = ImageDraw.Draw(empty_img)
        image_editable.multiline_text((width,height), name, (35, 57, 75), font=font)
        empty_img.save("hasil/{}.pdf".format(name.replace(" ", "_")))
        print('Processed {} Rows'.format(i))
    print("Process Complete!")

if __name__ == "__main__":
    main()
```
{: file='generate-sertif.py'}


**File Design Sertifikat**

![Design Sertif](/assets/img/posts/5/sertif.png){: .shadow .rounded-10 .bg-white }


**Download Font OpenSans.ttf**

<a href="/assets/img/posts/5/OpenSans.ttf">Download Disini</a>


## Langkah-langkah
1. Siapkan file `sertif.png`, usahakan file ini berbentuk png dan dengan proporsi ukuran yang sama untuk tempat namanya.
2. Download font `OpenSans.ttf` dan simpan di 1 folder yang sama
3. Jalankan file `generate-sertif.py` dengan command di cmd `python generate-sertif.py`
4. Tunggu proses selesai
5. Cek folder `hasil`


![](/assets/img/posts/5/ss1.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan awal script python</em>


![](/assets/img/posts/5/ss2.png){: .shadow .rounded-10 .bg-white }
<em>Python yang telah dijalankan</em>


![](/assets/img/posts/5/ss3.png){: .shadow .rounded-10 .bg-white }
<em>Hasil sertifikat 1</em>


![](/assets/img/posts/5/ss4.png){: .shadow .rounded-10 .bg-white }
<em>Hasil sertifikat 2</em>
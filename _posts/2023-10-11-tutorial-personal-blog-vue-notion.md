---
layout: post
title: Membuat Personal Blog dengan VueJS, Tailwind CSS, dan Notion API
author: huda
categories: [Coding, Vue]
tags: [coding, web, vue]
image: /assets/img/posts/4/banner.png
math: false
---

Pada artikel kali ini, saya akan sharing bagaimana membuat personal blog menggunakan VueJS dan Tailwind CSS dengan memanfaatkan Notion API.


![](/assets/img/posts/4/full-1.png){: .shadow .rounded-10 .bg-white }
<em>List blog dari Notion API</em>


![](/assets/img/posts/4/full-2.png){: .shadow .rounded-10 .bg-white }
<em>Detail artikel dari Notion API</em>

## Inisiasi Project

<div class="alert alert-info d-flex" role="alert">
    <a name="explain_query_key_value">&nbsp;</a>
    <i class="fas fa-info-circle mt-2"></i>
    <div style="margin-left: 0.7em;">
        <p><strong>Requirement</strong></p>
        <p>Silahkan install terlebih dahulu nodejs dan npm di link berikut <a href="https://nodejs.org/en/download/" target="_blank">https://nodejs.org/en/download/</a></p>
    </div>
</div>

### Instalasi vue dengan vite

Jalankan di cmd untuk menginstall vue dengan vite

```bash
npm create vite@latest personal-blog-notion -- --template vue
```

Setelah terinstall, ketik di cmd

```bash
cd personal-blog-notion
npm install
npm run dev
```

Tunggu beberapa menit, proses instalasi akan selesai. Setelah selesai jalankan `npm run dev` dan buka di browser


```
  VITE v5.0.0  ready in 487 ms

  ➜  Local:   http://localhost:5173/
  ➜  Network: use --host to expose
  ➜  press h + enter to show help
```

![](/assets/img/posts/4/start-project.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan awal project vite+vue</em>


### Install tailwind

Install dependency di cmd dan tunggu untuk menginstall tailwindcss

```bash
npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
```

Setelah berhasil, generate file `tailwind.config.js` and `postcss.config.js`

```bash
npx tailwindcss init -p
```

Edit file `tailwind.config.js`

```js
module.exports = {
    purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
    darkMode: false, // or 'media' or 'class'
    theme: {
        extend: {},
    },
    variants: {
        extend: {},
    },
    plugins: [],
}
```
{: file='tailwind.config.js'}

Kemudian, edit file `style.css` dengan kode berikut. Kode berikut digunakan untuk menggunakan directive dari Tailwind dan akan dibuild secara otomatis ketika kita menjalankan `npm run dev`

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```
{: file='style.css'}

Stop `npm run dev` dan jalankan kembali di terminal. Jika tampilan berubah seperti ini, maka itu tandanya tailwind sudah berhasil kita install

![](/assets/img/posts/4/tailwind-starter.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan home dengan tailwind</em>

Kita juga bisa coba menambahkan heading untuk recheck ulang apakah tailwind sudah benar terinstall.

```vue
<template>
  <p class="text-3xl">Ini Heading</p>
  <div>
    <a href="https://vitejs.dev" target="_blank">
      <img src="/vite.svg" class="logo" alt="Vite logo" />
    </a>
    <a href="https://vuejs.org/" target="_blank">
      <img src="./assets/vue.svg" class="logo vue" alt="Vue logo" />
    </a>
  </div>
  <HelloWorld msg="Vite + Vue" />
</template>
```
{: file='src/App.vue'}


![](/assets/img/posts/4/tailwind-starter.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan home dengan tailwind</em>

Tulisan "Ini Heading" sudah berubah, sehingga tailwind sudah berhasil kita install


![](/assets/img/posts/4/tailwind-heading.png){: .shadow .rounded-10 .bg-white }
<em>Test tampilan dengan tailwind</em>


### Install vue-router

Selanjutnya, kita akan membuat router agar vue menjadi SPA (Single Page Application) atau user bisa berpindah dari satu halaman ke halaman lainnya tanpa reload ulang halaman secara keseluruhan.

Sebelum kita menginstall dependency, buat folder `pages` di dalam folder `src` dan tambahkan file `src/pages/Home.vue` dan `src/pages/blog/BlogDetail.vue` dan isi dengan kode di bawah ini.


```vue
<template lang="">
    <div>
        <h1 class="text-3xl">Homepage</h1>
    </div>
</template>
<script>
export default {
}
</script>
<style lang="">
</style>
```
{: file='src/pages/Home.vue'}


```vue
<template lang="">
    <div>
        <h1 class="text-3xl">Blog Detail {{ route.params.id }}</h1>
    </div>
</template>
<script>
export default {
};
</script>
<style lang=""></style>
```
{: file='src/pages/blog/BlogDetail.vue'}

Install dependency di terminal

```bash
npm install vue-router@next --save
```

Buat file baru di `src/router.js`

```js
import { createRouter, createWebHistory } from "vue-router"
import Home from "./pages/Home.vue";
import BlogDetail from "./pages/blog/BlogDetail.vue";

const routeInfos = [
    {
        path: "/",
        component: () => Home
    },
    {
        path: "/blog/:id",
        component: () => BlogDetail
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes: routeInfos
})

export default router;
```
{: file='src/router.js'}

Edit file `src/main.js` untuk menggunakan router

```js
import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from "./router"

createApp(App)
    .use(router)
    .mount('#app')
```
{: file='src/main.js'}

Lalu, edit isi file `src/App.vue` dengan kode berikut

```vue
<template>
    <h1>Welcome to my Personal Blog!</h1>
    <router-link to="/">Home</router-link> |
    <router-link to="/blog/123">Blog Detail</router-link>
    <router-view />
</template>
```
{: file='src/App.vue'}

Sekarang, coba buka di browser kembali. Jika tampilan berubah seperti ini, maka itu tandanya vue-router sudah berhasil kita install.


![](/assets/img/posts/4/router-1.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan home</em>


![](/assets/img/posts/4/router-2.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan blog detail dengan id = 123</em>


![](/assets/img/posts/4/router-3.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan blog detail dengan id = 45</em>

### Install vue icons dengan oh-vue-icons

Jalankan command berikut di cmd

```bash
npm install oh-vue-icons
```

Oh Vue Icons memiliki lebih dari 30rb icons yang bisa langsung dipakai di project kita. Oh Vue Icons tidak meload semua icons ketika website dibuild, hanya icon yang akan kita pakai saja dalam project kita. Hal ini membantu agar ukuran aplikasi tidak berat dari sisi user. Untuk dokumentasi lengkapnya di link berikut, <a href="https://oh-vue-icons.js.org/" target="_blank">https://oh-vue-icons.js.org/</a>

Setelah terinstall, edit file `vite.config.js` dengan kode berikut

```js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  optimizeDeps: {
    exclude: ["oh-vue-icons/icons"]
  }
})
```
{: file='vite.config.js'}


Edit juga file `main.js` dengan kode berikut untuk mendaftarkan list font-awesome icons dan material icons

```js
import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import router from "./router"

// added font-awesome & material icons
import { OhVueIcon, addIcons } from "oh-vue-icons";
import * as FaIcons from "oh-vue-icons/icons/fa";
import * as MdIcons from "oh-vue-icons/icons/md";
const Fa = Object.values({ ...FaIcons });
const Md = Object.values({ ...MdIcons });
addIcons(...Md);
addIcons(...Fa);

const app = createApp(App);
app.component("v-icon", OhVueIcon);
app.use(router);
app.mount("#app");
```
{: file='src/main.js'}

<div class="alert alert-warning d-flex" role="alert">
    <a name="explain_query_key_value">&nbsp;</a>
    <i class="fas fa-lightbulb mt-2"></i>
    <div style="margin-left: 0.7em;">
        <p><strong>Insight</strong></p>
        <p>Kode di atas adalah contoh kode bad practice karena akan membuat size bundle aplikasi menjadi besar dan user yang membuka page kita akan terasa lambat.</p>
        <p>Di real case, jangan load semua icon yang ada di library. Namun, pakai sesuai kebutuhan icon mana yang mau diload untuk mengurangi ukuran bundle dari aplikasi.</p>
    </div>
</div>

Icons, sudah berhasil diinstall. Untuk menggunakan icons, kita edit halaman `Home.vue` dengan kode berikut

```vue
<template lang="">
    <div>
        <v-icon name="md-home" fill="green" scale="2" />
        <h1 class="text-3xl">Homepage</h1>
    </div>
</template>
<script>
export default {};
</script>
<style lang=""></style>
```
{: file='src/pages/Home.vue'}


![](/assets/img/posts/4/vue-icon.png){: .shadow .rounded-10 .bg-white }
<em>Oh Vue Icons sudah berhasil diinstall</em>


Tada, kita sudah berhasil untuk menginstall semua dependency yang dibutuhkan, selanjutnya, kita akan fokus untuk membuat UI dengan Tailwind CSS menggunakan component based style.

## Membangun UI dengan Tailwind

Edit file `App.vue` dengan kode berikut

```vue
<template>
    <router-view />
</template>
```
{: file='src/pages/App.vue'}


### Tampilan Home

Ubah file `Home.vue` dengan kode berikut,

```vue
<template lang="">
    <div className="mx-[200px] pb-10">
        <div className="flex flex-col items-center mt-14 mb-24">
            <div className="w-[100px] h-[100px] rounded-full overflow-hidden">
                <img
                    src="https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                />
            </div>
            <div className="flex gap-2 text-[#333333] mt-4">
                <a href="https://instagram.com" target="_blank">
                    <v-icon name="fa-instagram" fill="black" scale="1.5" />
                </a>
                <a href="https://twitter.com" target="_blank">
                    <v-icon name="fa-twitter" fill="black" scale="1.5" />
                </a>
            </div>
            <div className="flex items-center gap-1.5 mt-2">
                <h1 className="text-4xl font-bold">Bu Prani</h1>
                <div className="w-4 h-4 bg-[#E99355] rounded-full mt-2"></div>
            </div>
        </div>
        <div className="flex flex-col gap-16">
            <div className="flex gap-14" v-for="i in 3" :key="i">
                <router-link to="/blog/123" className="w-[400px] h-[200px] ">
                    <img
                        src="https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                        alt=""
                        className="rounded-lg object-cover object-center w-full h-full"
                    />
                </router-link>
                <div className="">
                    <router-link to="/blog/123" className="text-xl font-medium">
                        Instagram head says Threads API is in the works
                    </router-link>
                    <div className="text-xs flex items-center gap-2 mt-4 mb-6">
                        <v-icon name="fa-calendar" />
                        <p>4/11/2023</p>
                    </div>
                    <p className="text-base mb-6">
                        Instagram head Adam Mosseri said today that a Threads
                        API is in the works. This will give chance to developers
                        to create different apps and experiences around Threads.
                        Mosseri was responding to jou…
                    </p>
                    <router-link
                        to="/blog/123"
                        className="flex items-center gap-2 text-xs font-semibold text-[#e99355]"
                    >
                        <p>Continue reading</p>
                                        <v-icon name="fa-chevron-right" scale="0.7" />
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {};
</script>
<style lang=""></style>
```
{: file='src/pages/Home.vue'}


![](/assets/img/posts/4/ui-awal-1.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan home dengan tailwind</em>


### Tampilan Blog Detail

Setelah itu, ubah file `BlogDetail.vue` dengan kode berikut,

```vue
<template lang="">
    <div>
        <div className="mx-[200px]">
            <div className="h-[520px]">
                <img
                    src="https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                    className="w-full h-full object-cover object-center"
                />
            </div>
            <div className="max-w-[673px] mx-auto">
                <div className="">
                    <h1
                        className="text-[#333] text-5xl font-medium text-center mt-4 mb-3"
                    >
                        Instagram head says Threads API is in the works
                    </h1>
                    <div className="flex gap-3 items-center justify-center">
                        <div
                            className="flex items-center gap-2 text-xs text-[#333]"
                        >
                            <v-icon name="fa-calendar" fill="black" />
                            <p>4/11/2023</p>
                        </div>
                        <div
                            className="flex items-center gap-2 text-xs text-[#333]"
                        >
                            <v-icon name="fa-user" fill="black" />
                            <p>Alicia Stones</p>
                        </div>
                    </div>
                </div>
                <div className="mt-16">
                    Content dari notion {/* <NotionRenderer /> */}
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {};
</script>
<style lang=""></style>
```
{: file='src/pages/blog/BlogDetail.vue'}


![](/assets/img/posts/4/ui-awal-2.png){: .shadow .rounded-10 .bg-white }
<em>Tampilan blog detail dengan tailwind</em>


### Ubah ke component-based

Di halaman Home, kita akan memisahkan tampilan dari Header dan juga BlogList menjadi file terpisah. Hal ini dilakukan karena kita mengikuti prinsip component based dimana komponen UI dipecah menjadi komponen sendiri.


![](/assets/img/posts/4/ui-awal-1-edited.png){: .shadow .rounded-10 .bg-white }
<em>UI dipecah menjadi komponen</em>

Edit file `vite.config.js` agar dapat menggunakan alias `@` di komponen

```js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': '/src',
    },
  },
  optimizeDeps: {
    exclude: ["oh-vue-icons/icons"]
  }
})
```

Buat file baru di folder `components` :
- `Header.vue`
- `BlogList.vue`

Edit file `Header.vue`

```vue
<template lang="">
    <div className="flex flex-col items-center mt-14 mb-24">
        <div className="w-[100px] h-[100px] rounded-full overflow-hidden">
            <img
                src="https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
            />
        </div>
        <div className="flex gap-2 text-[#333333] mt-4">
            <a href="https://instagram.com" target="_blank">
                <v-icon name="fa-instagram" fill="black" scale="1.5" />
            </a>
            <a href="https://twitter.com" target="_blank">
                <v-icon name="fa-twitter" fill="black" scale="1.5" />
            </a>
        </div>
        <div className="flex items-center gap-1.5 mt-2">
            <h1 className="text-4xl font-bold">Bu Prani</h1>
            <div className="w-4 h-4 bg-[#E99355] rounded-full mt-2"></div>
        </div>
    </div>
</template>
<script>
export default {
    name: "Header"
};
</script>
<style lang=""></style>
```
{: file='src/components/Header.vue'}


Edit file `BlogList.vue`

```vue
<template lang="">
    <div className="flex gap-14">
        <router-link to="/blog/123" className="w-[400px] h-[200px] ">
            <img
                src="https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                alt=""
                className="rounded-lg object-cover object-center w-full h-full"
            />
        </router-link>
        <div className="">
            <router-link to="/blog/123" className="text-xl font-medium">
                Instagram head says Threads API is in the works
            </router-link>
            <div className="text-xs flex items-center gap-2 mt-4 mb-6">
                <v-icon name="fa-calendar" />
                <p>4/11/2023</p>
            </div>
            <p className="text-base mb-6">
                Instagram head Adam Mosseri said today that a Threads API is in
                the works. This will give chance to developers to create
                different apps and experiences around Threads. Mosseri was
                responding to jou…
            </p>
            <router-link
                to="/blog/123"
                className="flex items-center gap-2 text-xs font-semibold text-[#e99355]"
            >
                <p>Continue reading</p>
                <v-icon name="fa-chevron-right" scale="0.7" />
            </router-link>
        </div>
    </div>
</template>
<script>
export default {
    name: "BlogList",
};
</script>
<style lang=""></style>
```
{: file='src/components/BlogList.vue'}


Sekarang, edit file `Home.vue` untuk memanggil komponen yang telah dibuat.

```vue
<template lang="">
    <div className="mx-[200px] pb-10">
        <Header />
        <div className="flex flex-col gap-16">
            <div v-for="i in 3" :key="i">
                <BlogList />
            </div>
        </div>
    </div>
</template>
<script setup>
import Header from "@/components/Header.vue";
import BlogList from "@/components/BlogList.vue";
</script>
<style lang=""></style>
```
{: file='src/pages/Home.vue'}

Reload ulang halaman website


### Edit BlogList agar dinamis

Edit file `BlogList.vue` agar dapat menerima props

```vue
<template lang="">
    <div className="flex gap-14">
        <router-link to="/blog/123" className="w-[400px] h-[200px] ">
            <img
                :src="image"
                alt=""
                className="rounded-lg object-cover object-center w-full h-full"
            />
        </router-link>
        <div className="">
            <router-link to="/blog/123" className="text-xl font-medium">
                {{ title }}
            </router-link>
            <div className="text-xs flex items-center gap-2 mt-4 mb-6">
                <v-icon name="fa-calendar" />
                <p>{{ date }}</p>
            </div>
            <p className="text-base mb-6">
                {{ description }}
            </p>
            <router-link
                to="/blog/123"
                className="flex items-center gap-2 text-xs font-semibold text-[#e99355]"
            >
                <p>Continue reading</p>
                <v-icon name="fa-chevron-right" scale="0.7" />
            </router-link>
        </div>
    </div>
</template>
<script>
export default {
    name: "BlogList",
    props: {
        id: {
            type: String,
        },
        title: {
            type: String,
        },
        date: {
            type: String,
        },
        description: {
            type: String,
            default:
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, error. Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, error. Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, error.",
        },
        image: {
            type: String,
            default:
                "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        },
    },
};
</script>
<style lang=""></style>
```
{: file='src/components/BlogList.vue'}


Kemudian, edit file `Home.vue` untuk menyesuaikan dengan data yang diberikan

```vue
<template lang="">
    <div className="mx-[200px] pb-10">
        <Header />
        <div className="flex flex-col gap-16">
            <div v-for="i in 3" :key="i">
                <BlogList
                    :id="i.toString()"
                    :title="`Blog ${i}`"
                    :date="`4/11/2023`"
                />
            </div>
        </div>
    </div>
</template>
<script setup>
import Header from "@/components/Header.vue";
import BlogList from "@/components/BlogList.vue";
</script>
<style lang=""></style>
```
{: file='src/pages/Home.vue'}



![](/assets/img/posts/4/ui-dinamis.png){: .shadow .rounded-10 .bg-white }
<em>Komponen BlogList sudah dinamis</em>


## API dari Notion

Buat akun terlebih dahulu di notion.so. Setelah terdaftar, buka halaman <a href="https://notehuda.notion.site/notehuda/1d30a536b01f4145a60127c2ebe829aa?v=bfa7df3f9e874a8d9193fe5ed1f970b2">notion blog</a> berikut dan klik tombol **Duplicate**


![](/assets/img/posts/4/notion-1.png){: .shadow .rounded-10 .bg-white }
<em>Halaman notion blog</em>

### Setup router


Edit file `router.js` untuk menambahkan field name dan params slug di blog detail

```js
import { createRouter, createWebHistory } from "vue-router"
import Home from "./pages/Home.vue";
import BlogDetail from "./pages/blog/BlogDetail.vue";

const routeInfos = [
    {
        name: 'home',
        path: "/",
        component: () => Home
    },
    {
        name: 'blogDetail',
        path: "/blog/:slug",
        component: () => BlogDetail
    }
]

const router = createRouter({
    history: createWebHistory(),
    routes: routeInfos
})

export default router;
```
{: file='src/router.js'}


### Buat Blog Service


Buat folder & file baru di `src/services/blog.service.js`

```js
export const getBlogList = async () => {
    return await fetch(
        "https://notion-api.splitbee.io/v1/table/{id_notion}",
    )
        .then((res) => res.json())
        .then((result) => result);
};

export const getBlogDetail = async (id) => {
    return await fetch(`https://notion-api.splitbee.io/v1/page/${id}`)
        .then((res) => res.json())
        .then((result) => result);
};
```
{: file='src/services/blog.service.js'}

Ganti `{id_notion}` dengan ID notion pada url. Misalnya urlnya _notehuda.notion.site/notehuda/1d30a536b01f4145a60127c2ebe829aa?v=bfa7df3f9e874a8d9193fe5ed1f970b2_ maka ID nya adalah 1d30a536b01f4145a60127c2ebe829aa

Sehingga fungsi `getBlogList` tersebut akan berisi kode seperti berikut

```js
export const getBlogList = async () => {
    return await fetch(
        "https://notion-api.splitbee.io/v1/table/1d30a536b01f4145a60127c2ebe829aa",
    )
        .then((res) => res.json())
        .then((result) => result);
};
```
{: file='src/services/blog.service.js'}


### Install vue-notion

Install vue-notion via cmd. Vue-notion ini akan berfungsi untuk merender result dari API notion ke dalam HTML.

```bash
npm install vue-notion@3.0.0-beta.1
```

### Edit home

Edit file `Home.vue` untuk menampilkan list artikel dari notion ke dalam component `BlogList`

```vue
<template lang="">
    <div className="mx-[200px] pb-10">
        <Header />
        <div v-if="isBlogEmpty">Loading...</div>
        <div className="flex flex-col gap-16" v-else>
            <div v-for="blog in blogList" :key="blog.id">
                <BlogList
                    :id="blog.id"
                    :slug="blog.slug"
                    :title="blog.title"
                    :date="blog.created_date"
                    :description="blog.description"
                    :image="blog.cover[0].url"
                />
            </div>
        </div>
    </div>
</template>
<script setup>
import Header from "@/components/Header.vue";
import BlogList from "@/components/BlogList.vue";

import { ref, onMounted, computed } from "vue";
import { getBlogList } from "@/services/blog.service.js";

const blogList = ref([]);
onMounted(async () => {
    try {
        const result = await getBlogList();
        blogList.value = result;
    } catch (error) {
        console.error("Error fetching blog list:", error);
    }
});

// added function check blogList is not empty
const isBlogEmpty = computed(() => {
    return blogList.value.length == 0;
});
</script>
<style lang=""></style>
```
{: file='src/pages/Home.vue'}


### Edit BlogList

Edit file `BlogList.vue` untuk menampilkan data pada tiap artikel pada blog

```vue
<template lang="">
    <div className="flex gap-14">
        <div @click="goToBlogDetail" className="w-[400px] h-[200px] ">
            <img
                :src="image"
                alt=""
                className="rounded-lg object-cover object-center w-full h-full"
            />
        </div>
        <div className="">
            <div @click="goToBlogDetail" className="text-xl font-medium">
                {{ title }}
            </div>
            <div className="text-xs flex items-center gap-2 mt-4 mb-6">
                <v-icon name="fa-calendar" />
                <p>{{ date }}</p>
            </div>
            <p className="text-base mb-6">
                {{ description }}
            </p>
            <div
                @click="goToBlogDetail"
                className="flex items-center gap-2 text-xs font-semibold text-[#e99355]"
            >
                <p>Continue reading</p>
                <v-icon name="fa-chevron-right" scale="0.7" />
            </div>
        </div>
    </div>
</template>
<script>
import { useRouter } from "vue-router";
export default {
    name: "BlogList",
    props: {
        id: {
            type: String,
        },
        slug: {
            type: String,
        },
        title: {
            type: String,
        },
        date: {
            type: String,
        },
        description: {
            type: String,
            default:
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, error. Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, error. Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur, error.",
        },
        image: {
            type: String,
            default:
                "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
        },
    },
    setup(props) {
        const router = useRouter(); // Initialize the router (push, etc)
        const goToBlogDetail = () => {
            router.push({
                name: "blogDetail",
                params: { slug: props.slug },
            });
        };
        return {
            goToBlogDetail,
        };
    },
};
</script>
<style lang=""></style>
```
{: file='src/components/BlogList.vue'}


### Edit BlogDetail

Edit file `BlogDetail.vue` untuk menampilkan detail artikel dari blog

```vue
<template lang="">
    <div>
        <div v-if="!blogDetail && !article">Loading...</div>
        <div className="mx-[200px]" v-else>
            <div className="h-[520px]">
                <img
                    :src="blogDetail.cover[0].url"
                    className="w-full h-full object-cover object-center"
                />
            </div>
            <div className="max-w-[673px] mx-auto">
                <div className="">
                    <h1
                        className="text-[#333] text-5xl font-medium text-center mt-4 mb-3"
                    >
                        {{ blogDetail.title }}
                    </h1>
                    <div className="flex gap-3 items-center justify-center">
                        <div
                            className="flex items-center gap-2 text-xs text-[#333]"
                        >
                            <v-icon name="fa-calendar" fill="black" />
                            <p>{{ blogDetail.created_date }}</p>
                        </div>
                        <div
                            className="flex items-center gap-2 text-xs text-[#333]"
                        >
                            <v-icon name="fa-user" fill="black" />
                            <p>Bu Prani</p>
                        </div>
                    </div>
                </div>
                <div className="mt-16">
                    <NotionRenderer :blockMap="article" fullPage />
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
import { ref, onMounted, computed } from "vue";
import { useRoute } from "vue-router";
import { NotionRenderer, getPageBlocks } from "vue-notion";
import { getBlogList, getBlogDetail } from "@/services/blog.service.js";

const route = useRoute();
const slug = ref(route.params.slug).value;

const blogDetail = ref();
const article = ref();

onMounted(async () => {
    try {
        const resultAll = await getBlogList();
        blogDetail.value = resultAll.filter((blog) => blog.slug == slug)[0];

        const result = await getBlogDetail(blogDetail.value.id);
        article.value = result;
    } catch (error) {
        console.error("Error fetching blog detail:", error);
    }
});
</script>
<style>
</style>
```
{: file='src/pages/blog/BlogDetail.vue'}

![](/assets/img/posts/4/notion-2.png){: .shadow .rounded-10 .bg-white }
<em>Halaman detail artikel</em>

Tadaaa, artikel berhasil muncul 🎉 

Namun, artikel masih berantakan karena belum ada cssnya.


### Tambahkan internal css

Buat file baru di folder `src/pages/blog/blog.style.css` dan copy code css dari gist berikut

<a href="https://gist.github.com/iniakunhuda/5a82306c1ab86fd8c37996abc83c8afc" target="_blank">https://gist.github.com/iniakunhuda/5a82306c1ab86fd8c37996abc83c8afc</a>

Kemudian, setelah file `blog.style.css` terbuat, edit bagian bawah file `BlogDetail.vue` dengan kode berikut,

```vue
<style>
@import "@/pages/blog/blog.style.css";
</style>
```
{: file='src/pages/blog/BlogDetail.vue'}


![](/assets/img/posts/4/notion-3.png){: .shadow .rounded-10 .bg-white }
<em>Halaman detail artikel</em>

Tadaaa, artikel sudahh muncul dan rapi 🎉 

Sekian tutorial kali ini, next time kita akan deploy blog ini ke Netlify.
# Laravel Docker Deployer

Laravel Docker Deployer pada dasarnya adalah sebuah *file* docker-compose yang mengotomatisasi pembangunan *server* dalam lingkungan virtual secara mudah yang berbasis pada stack PHP, MySQL and NGINX (LEMP) yang sudah teroptimasi untuk lingkungan *production*.

## Fitur

- Clone dari git *hosting* atau *copy-paste* aplikasi secara otomatis.
- Mendukung multi basis data.
- Mendukung banyak versi PHP, daftar lengkap dapat dilihat [di sini](https://hub.docker.com/repository/docker/sensasidelight/php-laravel/tags).

Ingin menyarankan fitur? [klik di sini](https://github.com/sensasi-delight/laravel-docker-deployer/issues/new).

## Penggunaan

> Pastikan Docker telah ter-install pada perangkat yang ingin di-deploy. Jika belum, anda dapat mengunjungi link ini untuk instalasi Docker.

> Pastikan struktur folder aplikasi Laravel anda sesuai dengan [struktur folder standar Laravel](https://laravel.com/docs/structure).

1. *Clone* atau *download file-file* yang terdapat pada *repository* ini.
2. Buat file baru bernama `.env` berdasarkan file `env.example` yang terdapat pada *file-file* yang sudah di-*download* tadi.
3. Buka aplikasi Terminal dan arahkan `working directory` pada folder yang berisi *file-file* yang sudah di-*download* tadi.
4. Jalankan perintah `docker-compose up -d` kemudian tunggu hingga semua docker container berjalan.
5. Selesai 🎉 aplikasi anda telah ter-*deploy* dan dapat diakses pada *browser* melalui alamat URL: `localhost`.

> Video demonstrasi: coming soon

## Daftar Variabel .env

Seperti yang dapat terlihat, pada *repository* ini terdapat *file* `.env.example` sebagai pemandu anda untuk membuat *file* `.env`.
*File* `.env` tersebut digunakan oleh Laravel Docker Deployer dan aplikasi Laravel anda.
Daftar variabel yang digunakan oleh Laravel Docker Deployer dapat dilihat pada tabel di bawah ini:

| Variabel           | Nilai *Default* | Deskripsi                                                                                                                                                                                                                                                                                                                                                                                 |
|--------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PHP_VERSION        |         | Wajib. semua versi yang tersedia dapat dilihat pada: https://hub.docker.com/r/sensasidelight/php-laravel/tags ⚠️ Pastikan untuk versi PHP kompatibel dengan versi Laravel anda.                                                                                                                                                                                                                                                                                |
| MYSQL_VERSION      |         | Wajib. semua versi yang tersedia dapat dilihat pada: https://hub.docker.com/_/mysql/tags                                                                                                                                                                                                                                                                                                                                           |
| NGINX_VERSION      |         | Wajib. semua versi yang tersedia dapat dilihat pada: https://hub.docker.com/_/nginx/tags                                                                                                                                                                                                                                                                                                                                          |
| APP_SRC_GIT        |         | Wajib jika ingin men-deploy aplikasi dari git *hosting*. ⚠️ mohon untuk tidak mengaktifkan variabel `APP_SRC_LOCAL` ketika mengaktifkan variabel ini. contoh: `https://github.com/laravel/laravel`, atau `../path/to/your/awesome/project/.git` |
| APP_SRC_GIT_BRANCH |         | Opsional.                                                                                                                                                                                                                                                                                                                                                                                   |
| APP_SRC_LOCAL      |         | Wajib jika ingin men-deploy aplikasi laravel anda dari direktori lokal. ⚠️ mohon untuk tidak mengaktifkan variabel `APP_SRC_GIT` jika ingin mengaktifkan variabel ini.  contoh: `../path/to/your/awesome/project`.                                                                                                                                                                                            |
| DB_ROOT_PASSWORD   |         | Wajib.                                                                                                                                                                                                                                                                                                                                                                                  |
| PORT               | 80      | Opsional. port yg di-expose pada *host* docker.                                                                                                                                                                                                                                                                                                                                                       |
| SEED_DB            | false   | Opsional. ⚠️ Seeding hanya untuk demo dan testing. Lingkungan *production* seharusnya tidak melakukan seed pada basis data. Namun, jika anda bersikeras, pastikan *package* yang dibutuhkan untuk *seeding* (misal `fakerphp/faker`) telah tercantum pada atribut `required` pada `composer.json` dan bukan pada atribut `require-dev`.                                                                                                                                                 |
| DB_DATABASE*       | forge   | Opsional. Jika aplikasi anda menggunakan lebih dari satu basis data, silahkan tambahkan variabel baru dengan format `*_DB_DATABASE_*` pada *file* `.env`. contoh: `SECOND_DB_DATABASE=forge_2`, atau `DB_DATABASE_LOG=forge_log`                                                                                                                                                                                           |
| DB_HOST*           | mysql   | Wajib. ⚠️ mohon untuk tidak merubah nilai.                                                                                                                                                                                                                                                                                                                                                   |
| DB_USERNAME*       |         | Wajib. ⚠️ mohon jangan mengisi nilai `root` pada variabel ini.                                                                                                                                                                                                                                                                                                                              |
| DB_PASSWORD*       |         | Wajib.                                                                                                                                                                                                                                                                                                                                                                                  |

*: digunakan juga oleh Laravel

## Cara Kontribusi

1. Lakuan *fork* pada *repository* ini.
2. Buatlah *branch* baru untuk memasukkan kontribusi anda.
3. Lakukan *commit* perubahan anda dengan perintah `git commit -m 'Add some AmazingFeature'`.
4. Lakukan *push* dengan perintah: `git push origin AmazingFeature`.
5. Lakukan *Pull Request* pada *repository* ini.

## Lisensi

Kode di dalam repository ini dirilis di bawah lisensi MIT.

## Kontak

📧 Surat elektronik: [zainadam.id@gmail.com](mailto:zainadam.id+gh+readme@gmail.com?subject=[GitHub]%20Laravel%20Docker%20Deployer)

🐦 Twitter: [@SENSASI_delight](https://twitter.com/SENSASI_delight)

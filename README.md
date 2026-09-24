# Katalog Paket Layanan IT (Tiered Pricing Card)

Proyek aplikasi Flutter mobile yang mengimplementasikan **Tiered Pricing Card**, navigasi antar screen (**Stack Navigation `Navigator.push`**), dan pengelolaan state interaktif (**Event & State** pada `StatefulWidget`).

---

## 📌 Pemenuhan Spesifikasi & Requirement Tugas

| Kategori | Spesifikasi Tugas | Implementasi Proyek |
|---|---|---|
| **Screen 1 (Beranda)** | Wajib `StatelessWidget`, menampilkan daftar 3 cards dalam `ListView`, tiap item menggunakan `ListTile` atau tombol yang bisa diklik. | Menggunakan `BerandaScreen` (`StatelessWidget`) dengan `ListView.builder` berisi 3 data paket (`Paket Dasar`, `Paket Profesional`, `Paket Enterprise`). Setiap card memiliki `ListTile`, title yang bisa diklik, dan tombol CTA. |
| **Navigasi** | Perpindahan dari Screen 1 ke Screen 2 wajib menggunakan teknik Stack Navigation (`Navigator.push`). | Diimplementasikan menggunakan `Navigator.push(context, MaterialPageRoute(builder: (context) => DetailKatalogScreen(paket: paket)))`. Terpicu saat title ataupun tombol CTA diklik. |
| **Screen 2 (Detail)** | Wajib menggunakan tata letak vertikal dengan `Column`. Dibuat sebagai `StatefulWidget` untuk menyelesaikan tantangan tambahan. | Menggunakan `DetailKatalogScreen` (`StatefulWidget`) dengan layout utama vertikal `Column`. |
| **Elemen Visual Screen 2** | • Memiliki Icon back yang difungsikan kembali ke Screen 1.<br>• Memiliki Text untuk menampilkan nama katalog, harga, dll.<br>• Memiliki Container dengan latar warna pastel dan padding sebagai tempat deskripsi. | • Icon back bawaan di `AppBar` serta tombol navigasi back eksplisit (`GestureDetector` + Icon `arrow_back_rounded` di awal `Column`).<br>• Teks nama paket, harga/bulan, dan rincian fitur.<br>• `Container` berlatar belakang **warna pastel** dengan padding 16px untuk deskripsi layanan. |
| **Struktur Aplikasi** | Aplikasi wajib memiliki `AppBar` agar tombol "Kembali" bawaan otomatis tersedia. | Menggunakan `Scaffold` dengan `AppBar` pada kedua screen. |
| **Event & State** | Mempelajari dan mengimplementasikan konsep event & state. | Menggunakan `setState` untuk 3 interaksi:<br>1. **Toggle Favorit**: Ikon love di AppBar yang berubah warna/status saat diklik.<br>2. **Kalkulator Durasi**: Mengubah durasi bulan (+/-) yang secara reaktif menghitung total biaya estimasi.<br>3. **Pilih Paket**: Tombol konfirmasi yang mengubah status pemesanan secara dinamis. |

---

## 🚀 Panduan Setup & Menjalankan Project

### 1. Prasyarat Sistem
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.x atau lebih baru)
* Dart SDK (terpaket bersama Flutter)
* Android Studio / VS Code dengan ekstensi Flutter & Dart
* Emulator Android, Device Fisik, atau Chrome Browser

### 2. Langkah Setup Project
1. Clone repository ini:
   ```bash
   git clone <URL_REPOSITORY_ANDA>
   cd tiered_pricing_card
   ```
2. Pasang dependensi Flutter:
   ```bash
   flutter pub get
   ```

### 3. Menjalankan Aplikasi
* Jalankan di perangkat Android / Emulator:
  ```bash
  flutter run
  ```
* Atau jalankan di Chrome (Web):
  ```bash
  flutter run -d chrome
  ```

### 4. Menjalankan Pengujian (Testing) & Analisis Kode
* Verifikasi linting dan analisis kode:
  ```bash
  flutter analyze
  ```
* Menjalankan unit & widget test:
  ```bash
  flutter test
  ```

---

## 🗂️ Struktur Direktori

```text
lib/
├── main.dart                      # Entry point aplikasi & konfigurasi tema
├── models/
│   └── paket_model.dart           # Model data paket IT & dummy data 3 cards
└── screens/
    ├── beranda_screen.dart        # Screen 1: Beranda (StatelessWidget, ListView 3 cards)
    └── detail_katalog_screen.dart # Screen 2: Detail (StatefulWidget, Column, Event & State)
test/
└── widget_test.dart               # Pengujian fungsionalitas UI & Navigasi
```

---

## ⚙️ Catatan Tambahan (Backend & Database)
Proyek Flutter ini beroperasi secara mandiri (*standalone mobile client*) dengan data model lokal `paket_model.dart`. Jika di kemudian hari dihubungkan dengan API backend dan database MySQL:
1. Pastikan server lokal backend (Node.js/Express, Laravel, dsb.) aktif di `http://localhost:PORT`.
2. Impor berkas database `.sql` melalui phpMyAdmin atau MySQL CLI:
   ```bash
   mysql -u root -p nama_database < database.sql
   ```
3. Sesuaikan URL endpoint API pada service HTTP di Flutter.

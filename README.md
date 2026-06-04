# Library App

Aplikasi manajemen perpustakaan berbasis Flutter yang menerapkan Clean Architecture, Repository Pattern, dan BLoC State Management.

Aplikasi ini digunakan untuk mengelola data buku, penulis, penerbit, jenis buku, peminjaman, dan denda melalui REST API.

---

# Teknologi

* Flutter
* Dart
* flutter_bloc
* Dio
* GetIt (Dependency Injection)
* REST API
* Shared Preferences

---

# Arsitektur Aplikasi

Project menggunakan pendekatan Feature First + Clean Architecture.

```text
Presentation Layer
       │
       ▼
      BLoC
       │
       ▼
 Repository
       │
       ▼
 Data Source
       │
       ▼
   REST API
```

Setiap fitur memiliki struktur yang terpisah sehingga mudah dikembangkan dan dipelihara.

---

# Struktur Folder

```text
lib/
│
├── core/
│   ├── network/
│   │   ├── api_endpoint.dart
│   │   ├── dio_client.dart
│   │   └── dio_interceptor.dart
│   │
│   ├── state/
│   │   └── result_state.dart
│   │
│   └── utils/
│       ├── constant.dart
│       ├── helper.dart
│       └── shared_preference_helper.dart
│
├── features/
│
│   ├── auth/
│   ├── book/
│   ├── penuliss_buku/
│   ├── penerbit_buku/
│   ├── jenbu/
│   ├── peminjaman/
│   └── denda/
│
├── pages/
│   ├── splash_pages.dart
│   └── home_page.dart
│
├── dependency_injection.dart
│
└── main.dart
```

---

# Struktur Feature

Setiap feature menggunakan pola yang sama:

```text
feature/
│
├── data/
│   ├── datasource/
│   ├── models/
│   └── repository/
│
├── domain/
│   └── repository contract
│
└── presentation/
    ├── bloc/
    └── pages/
```

---

# State Management

Project menggunakan flutter_bloc.

## Flow State

```text
UI
 │
 ▼
Event
 │
 ▼
Bloc
 │
 ▼
Repository
 │
 ▼
Datasource
 │
 ▼
REST API
 │
 ▼
State
 │
 ▼
UI Update
```

---

# Dependency Injection

Dependency Injection dikelola menggunakan GetIt.

Seluruh dependency seperti:

* Dio Client
* Repository
* Data Source
* Bloc

didaftarkan pada:

```text
lib/dependency_injection.dart
```

Tujuannya:

* Loose Coupling
* Mudah Testing
* Mudah Maintenance

---

# Network Layer

Komunikasi API dilakukan menggunakan Dio.

Komponen utama:

```text
core/network/
```

### dio_client.dart

Konfigurasi Dio.

### dio_interceptor.dart

Menangani:

* Logging Request
* Logging Response
* Error Response

### api_endpoint.dart

Menyimpan seluruh endpoint API aplikasi.

---

# Modul Aplikasi

## 1. Authentication

Lokasi:

```text
features/auth
```

Fitur:

* Login User
* Penyimpanan Session
* Validasi Login

Komponen:

```text
AuthBloc
AuthRepository
AuthDataSource
```

Halaman:

```text
LoginPage
```

---

## 2. Buku

Lokasi:

```text
features/book
```

Fitur:

* Menampilkan daftar buku
* Menampilkan detail buku
* Informasi stok buku
* Informasi penulis
* Informasi penerbit
* Informasi kategori

Halaman:

```text
BukuPage
DetailBookPage
```

API yang digunakan:

```text
GET Buku
GET Detail Buku
```

Catatan:

Modul buku saat ini masih bersifat Read Only.

Belum tersedia:

* Create Buku
* Update Buku
* Delete Buku

---

## 3. Penulis Buku

Lokasi:

```text
features/penuliss_buku
```

Fitur:

* List Penulis
* Detail Penulis
* Tambah Penulis
* Edit Penulis
* Hapus Penulis

Komponen:

```text
PenulisBloc
PenulisRepository
PenulisDatasource
```

Dialog:

```text
AddPenulisDialog
EditPenulisDialog
DetailPenulisDialog
```

---

## 4. Penerbit Buku

Lokasi:

```text
features/penerbit_buku
```

Fitur:

* List Penerbit
* Detail Penerbit
* Tambah Penerbit
* Edit Penerbit
* Hapus Penerbit

Komponen:

```text
PenerbitBloc
PenerbitRepository
PenerbitDatasource
```

Dialog:

```text
AddPenerbitDialog
EditPenerbitDialog
DetailPenerbitDialog
```

---

## 5. Jenis Buku

Lokasi:

```text
features/jenbu
```

Fitur:

* List Jenis Buku
* Detail Jenis Buku
* Tambah Jenis Buku
* Edit Jenis Buku
* Hapus Jenis Buku

Komponen:

```text
JenbuBloc
JenisRepository
JenbuDatasource
```

Halaman:

```text
JenisBukuPage
```

---

## 6. Peminjaman Buku

Lokasi:

```text
features/peminjaman
```

Fitur:

* Menampilkan daftar peminjaman
* Detail peminjaman
* Tambah peminjaman
* Edit peminjaman

Komponen:

```text
PeminjamanBloc
PeminjamanRepository
PeminjamanDataSource
```

Dialog:

```text
AddPeminjamanDialog
EditPeminjamanDialog
DetailPeminjamanDialog
```

Model Request:

```text
CreatePeminjamanReq
UpdatePeminjamanReq
```

---

## 7. Denda

Lokasi:

```text
features/denda
```

Fitur:

* Menampilkan daftar denda
* Detail denda
* Tambah denda
* Edit denda
* Hapus denda

Komponen:

```text
DendaBloc
DendaRepository
DendaDatasource
```

Komponen UI:

```text
DendaCard
DendaFormBottomSheet
DendaDeleteDialog
DendaDetailDialog
```

---

# Alur Request API

Contoh ketika user menambahkan Penulis:

```text
User Klik Simpan
        │
        ▼
CreatePenulis Event
        │
        ▼
PenulisBloc
        │
        ▼
PenulisRepository
        │
        ▼
PenulisDatasource
        │
        ▼
POST API
        │
        ▼
Success / Error
        │
        ▼
State Update
        │
        ▼
UI Refresh
```

---

# Error Handling

Error ditangani pada Data Source menggunakan DioException.

Contoh:

```dart
try {
  final response = await dio.get(url);
  return response;
} on DioException catch (e) {
  throw Exception(e.message);
}
```

Error kemudian diteruskan ke Bloc untuk menghasilkan state error yang akan ditampilkan pada UI.

---

# Desain Halaman

## Splash Screen

Halaman awal aplikasi.

Fungsi:

* Inisialisasi aplikasi
* Pengecekan session login
* Redirect halaman

---

## Login Page

Fungsi:

* Input username
* Input password
* Login ke sistem

---

## Home Page

Menu utama aplikasi.

Navigasi menuju:

* Buku
* Penulis
* Penerbit
* Jenis Buku
* Peminjaman
* Denda

---

# Keunggulan Arsitektur

* Clean Architecture
* Feature Based Structure
* Repository Pattern
* Dependency Injection
* Scalable
* Reusable
* Easy Testing
* Separation of Concerns
* Maintainable Codebase

---

# Developer Notes

Project ini menggunakan pendekatan modular berdasarkan fitur sehingga setiap modul dapat dikembangkan secara independen tanpa mempengaruhi modul lainnya. Seluruh komunikasi data dilakukan melalui Repository dan Data Source untuk menjaga konsistensi arsitektur aplikasi.

# master_plan

362358302106_FITRI AYU WULAN SARI

PRAKTIKUM 1

1. master_plan\image\master_plan.png
Penjelasan: Membuat todolist sesuai langkah pada praktikum

2. - Untuk Menyederhanakan Proses Impor
   - Meningkatkan Skalabilitas
   - Meningkatkan Kebersihan dan konsisten kode
   - Mendukung Konvensi dan Praktik terbaik

3. Variabel plan diperlukan untuk menyimpan dan mengelola data model Plan, yang akan ditampilkan dan dimodifikasi di antarmuka pengguna. Sebagai bagian dari StatefulWidget, variabel ini menghubungkan data dengan UI, memungkinkan perubahan seperti menambah atau menghapus tugas.

Deklarasi const digunakan jika data awal plan bersifat tetap dan tidak diubah, memberikan keamanan, efisiensi memori, dan performa lebih baik. Namun, jika data perlu dimodifikasi (seperti menambah tugas), kata kunci const harus dihapus agar objek bisa diubah.

4. master_plan\image\master_plan.png
Penjelasan: membuat todolist

5.  - Scroll listener: Untuk memantau dan mengambil aksi berdasarkan posisi gulir.
    - Dispose: Untuk membersihkan sumber daya yang tidak lagi diperlukan agar aplikasi tetap efisien dan bebas kebocoran memori.


PRAKTIKUM 2 InheritedWidget

1. master_plan\image\master_plan1.png
Tujuan pembuatan aplikasi: Untuk memanagement waktu sehari-hari

2. InheritedWidget adalah cara Flutter untuk berbagi data ke widget di bawahnya dalam pohon widget tanpa meneruskan data secara manual. Pada langkah ini, PlanProvider menggunakan InheritedNotifier, yang merupakan versi InheritedWidget dengan tambahan kemampuan mendeteksi perubahan data.

Mengapa Menggunakan InheritedNotifier?
Efisiensi:
Hanya widget yang membutuhkan data yang diperbarui, sehingga performa lebih baik.

Mudah Mengelola Perubahan Data:
ValueNotifier<Plan> otomatis memberi tahu widget saat data berubah.

Sederhana:
Tidak perlu pustaka tambahan, cukup dengan Flutter bawaan.

3. completedCount: Menghitung jumlah tugas yang selesai dengan memfilter daftar tugas (tasks) berdasarkan status complete.
completenessMessage: Memberikan pesan ringkasan kemajuan, misalnya: "3 out of 5 tasks".
Mengapa perlu?

Menyediakan informasi kemajuan tugas secara langsung dari model.
Membantu pengguna memahami progres secara cepat.
Memisahkan logika data dari UI, membuat kode lebih bersih dan mudah dikelola.

4. master_plan\image\master_plan1.png
completedCount: Menghitung jumlah tugas yang selesai dengan memfilter daftar tugas (tasks) berdasarkan status complete.
completenessMessage: Memberikan pesan ringkasan kemajuan, misalnya: "3 out of 5 tasks".

PRAKTIKUM 3
1. master_plan\image\gif.gif
Tujuan pembuatan aplikasi: Untuk memanagement waktu sehari-hari

2. Gambar tersebut menunjukkan diagram navigasi antar halaman (screen navigation) dalam pengembangan aplikasi menggunakan Flutter/Material Design. Mari saya jelaskan maksudnya:

Sisi Kiri (Halaman Awal):
- Dimulai dengan MaterialApp sebagai root aplikasi
- Menggunakan PlanProvider untuk manajemen state
- Memiliki PlanCreatorScreen yang berisi:
  - Column sebagai layout utama
  - TextField untuk input
  - Expanded dengan ListView di dalamnya

Sisi Kanan (Halaman Tujuan):
- Juga dimulai dengan MaterialApp
- Menggunakan PlanScreen sebagai halaman utama
- Memiliki Scaffold sebagai struktur dasar
- Column yang berisi:
  - Expanded dengan ListView
  - SafeArea dengan Text di dalamnya

Navigator Push:
- Tanda panah di tengah menunjukkan navigasi menggunakan Navigator.push()
- Ini menandakan perpindahan dari halaman pembuatan plan (kiri) ke halaman detail plan (kanan)

2. Diagram ini menggambarkan arsitektur navigasi aplikasi dimana pengguna dapat membuat sebuah plan di halaman pertama, kemudian berpindah ke halaman kedua untuk melihat detail atau hasil dari plan tersebut. Struktur ini umum digunakan dalam pengembangan aplikasi Flutter untuk mengelola navigasi antar halaman dengan efektif.

3. master_plan\image\gif.gif

Langkah 1: Edit PlanProvider Perhatikan kode berikut, edit class PlanProvider sehingga dapat menangani List Plan. class PlanProvider extends InheritedNotifier<ValueNotifier<List<Plan>>> {
pasted
AD
jawaban nomor 3

Berdasarkan Langkah 14 pada praktikum, saya akan menjelaskan aplikasi yang dibuat:

Aplikasi ini adalah sebuah "Master Plans" atau aplikasi pengelola rencana/tugas dengan fitur sebagai berikut:

Tampilan Awal (PlanCreatorScreen):
Memiliki AppBar dengan judul "Master Plans [Nama]"
TextField untuk menambahkan rencana baru
Area tampilan daftar rencana
Fitur-fitur Utama:
Dapat menambahkan rencana baru melalui TextField
Jika belum ada rencana, menampilkan ikon note dan pesan "Anda belum memiliki rencana apapun"
Menampilkan daftar rencana dalam bentuk ListView
Setiap item rencana menampilkan:
Nama rencana (title)
Pesan kelengkapan rencana (subtitle)
Dapat mengklik rencana untuk melihat detail dan mengelola tasks
Navigasi:
Ketika mengklik sebuah rencana, aplikasi akan berpindah ke PlanScreen
PlanScreen menampilkan detail rencana dan memungkinkan penambahan/pengelolaan tasks
State Management:
Menggunakan PlanProvider untuk mengelola state
Dapat memperbarui dan menyimpan daftar rencana
State dipertahankan antar screen menggunakan InheritedNotifier

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
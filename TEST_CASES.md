# TMDb - Mark as Favorite Feature
## Test Cases Documentation

**Project:** TMDb QA Technical Test — SimpliDOTS Internship  
**Feature:** Mark as Favorite  
**Tester:** Dhiyaa Ulhaq 
**Date:** 2026
**Version:** 1.0.0

---

## Table of Contents
1. [US1 - Ubah Bahasa](#us1---ubah-bahasa)
2. [US2 - Mark as Favorite](#us2---mark-as-favorite)
3. [US3 - View Favorite Movie List](#us3---view-favorite-movie-list)
4. [US4 - Sorting Favorite Movies](#us4---sorting-favorite-movies)
5. [US5 - Remove Movie from Favorite](#us5---remove-movie-from-favorite)
6. [Exploratory Test Cases](#exploratory-test-cases)

---

## US1 - Ubah Bahasa

**User Story:** Sebagai user, saya ingin dapat mengubah bahasa aplikasi agar saya dapat menggunakan aplikasi sesuai dengan preferensi bahasa saya.

| ID | Type | Title | Precondition | Steps | Expected Result | Status |
|----|------|-------|--------------|-------|-----------------|--------|
| US1-01 | Positive | Ganti ke Bahasa Indonesia | User sudah login | 1. Buka https://www.themoviedb.org 2. Klik ikon globe / Language selector di footer atau settings 3. Pilih "Indonesia" | UI berubah ke Bahasa Indonesia secara langsung tanpa logout. Tidak ada redirect ke halaman lain. | ✅ Pass |
| US1-02 | Positive | Ganti ke English | User sudah login, bahasa saat ini ID | 1. Pilih Language selector 2. Pilih "English" | UI berubah ke English. Data favorit tetap tersedia dan tidak hilang. | ✅ Pass |
| US1-03 | Positive | Favorit tersedia setelah ganti bahasa | User sudah login, sudah ada favorit | 1. Tandai beberapa movie sebagai favorit 2. Ganti bahasa ke Indonesia 3. Buka halaman Favorites | Daftar favorit tetap tampil lengkap, jumlah movie sama. | ✅ Pass |
| US1-04 | Positive | Ganti bahasa saat berada di halaman detail | User sudah login | 1. Buka detail sebuah movie 2. Ganti bahasa ke Indonesia | Halaman detail tetap tampil di movie yang sama, UI berubah ke ID. | ✅ Pass |
| US1-05 | Positive | Perubahan bahasa berlaku tanpa logout | User sudah login | 1. Ganti bahasa 2. Periksa status login | User masih dalam kondisi logged in setelah perubahan bahasa. | ✅ Pass |
| US1-06 | Negative | Ganti bahasa saat session expired | User sudah login tapi session habis | 1. Tunggu atau expire session 2. Coba ganti bahasa | Sistem menampilkan prompt login atau redirect ke halaman login. | ⏭️ Skipped |
| US1-07 | Edge | Ganti bahasa berulang kali cepat | User sudah login | 1. Ganti bahasa ke ID 2. Langsung ganti ke EN 3. Ganti ke ID lagi (3x cepat) | Tidak ada error, UI mengikuti bahasa terakhir yang dipilih. | ✅ Pass |


---

## US2 - Mark as Favorite

**User Story:** Sebagai user yang telah login, saya ingin dapat menandai movie sebagai favorite.

| ID | Type | Title | Precondition | Steps | Expected Result | Status |
|----|------|-------|--------------|-------|-----------------|--------|
| US2-01 | Positive | Mark dari Movie Listing Page (login) | User sudah login | 1. Buka https://www.themoviedb.org/movie 2. Hover pada poster movie 3. Klik ikon heart/star untuk mark favorite | Ikon berubah jadi filled/aktif. Movie muncul di halaman Favorites. | ✅ Pass |
| US2-02 | Positive | Mark dari Movie Detail Page | User sudah login | 1. Buka detail movie (contoh: /movie/550) 2. Klik tombol "Mark as Favorite" (ikon heart di samping poster) | Ikon berubah aktif, tooltip/notif muncul. Movie ada di Favorites list. | ✅ Pass |
| US2-03 | Positive | Mark lebih dari satu movie | User sudah login | 1. Mark movie pertama dari listing 2. Mark movie kedua dari detail 3. Buka halaman Favorites | Kedua movie tampil di Favorites, tidak ada yang hilang. | ✅ Pass |
| US2-04 | Positive | Indikator favorit tampil konsisten | User sudah login, movie sudah di-favorit | 1. Buka movie listing 2. Perhatikan ikon movie yang sudah difavorit 3. Buka detail movie tersebut | Ikon favorit aktif/filled tampil di KEDUA halaman (listing & detail). | ✅ Pass |
| US2-05 | Negative | Mark tanpa login | User belum login (guest) | 1. Buka movie listing tanpa login 2. Hover pada poster movie 3. Klik ikon favorite | Sistem menampilkan prompt login atau redirect ke halaman login. Movie TIDAK ditambahkan ke favorit. | ✅ Pass |
| US2-06 | Negative | Mark movie yang sudah difavorit (toggle off) | User sudah login, movie sudah difavorit | 1. Buka movie yang sudah difavorit 2. Klik ikon favorite lagi | Movie DIHAPUS dari favorites list. Tidak ada duplikat. | ✅ Pass |
| US2-07 | Negative | Mark movie dari search result tanpa login | User belum login | 1. Cari movie via search bar 2. Klik ikon favorit di hasil pencarian | Sistem menampilkan prompt login. Tidak ada favorite yang tersimpan. | ✅ Pass |
| US2-08 | Edge | Mark 5+ movie secara berurutan cepat | User sudah login | 1. Mark 5 movie berbeda secara berurutan 2. Buka Favorites page | Semua 5 movie tampil di Favorites. Urutan sesuai yang terbaru difavorit. | ✅ Pass |
| US2-09 | Edge | Mark movie yang sama dari dua entry point berbeda | User sudah login | 1. Mark movie A dari listing 2. Buka detail movie A 3. Cek status ikon di detail | Ikon di detail page JUGA menunjukkan status aktif (sudah favorit). Tidak ada duplikat di list. | ✅ Pass |

Notes: 
- US2-02 : tidak ada tooltip/notif muncul after added movie to favorite - can be ux improvement 

---

## US3 - View Favorite Movie List

**User Story:** Sebagai user, saya ingin dapat melihat daftar favorite movie saya.

| ID | Type | Title | Precondition | Steps | Expected Result | Status |
|----|------|-------|--------------|-------|-----------------|--------|
| US3-01 | Positive | Akses halaman Favorite Movie List | User login, ada favorit | 1. Klik profil/avatar 2. Pilih "Favorites" 3. Klik "Movies" | Halaman menampilkan daftar movie yang sudah difavorit. | ✅ Pass |
| US3-02 | Positive | Informasi movie konsisten dengan listing | User login, ada favorit | 1. Catat judul, poster, rating movie di listing page 2. Mark sebagai favorit 3. Buka Favorites page, bandingkan info | Judul, poster, dan rating di Favorites SAMA dengan di listing page. | ✅ Pass |
| US3-03 | Positive | Urutan terbaru tampil duluan | User login, mark beberapa movie | 1. Mark Movie A, lalu Movie B, lalu Movie C 2. Buka Favorites page | Movie C tampil di urutan paling atas (terbaru). | ✅ Pass |
| US3-04 | Positive | Navigasi ke detail dari Favorites | User login, ada favorit | 1. Buka Favorites page 2. Klik salah satu movie | Sistem redirect ke halaman detail movie tersebut. | ✅ Pass |
| US3-05 | Negative | Lihat Favorites list tanpa ada favorit | User baru login, belum pernah mark | 1. Login dengan akun baru 2. Buka Favorites page | Sistem menampilkan empty state ("No movies in favorites" atau pesan serupa). Tidak ada error. | ✅ Pass |
| US3-06 | Negative | Akses Favorites tanpa login | User belum login | 1. User sudah login 2.User copy akses URL /account/.../favorites 3. User logout 4. User kemudian paste akses url yang sudah di copy  | Sistem melarang akses login dan menampilkan pesan petunjuk untuk login | ✅ Pass |
| US3-07 | Edge | Lihat Favorites setelah ganti bahasa | User login, ada favorit | 1. Tandai beberapa movie 2. Ganti bahasa ke Indonesia 3. Buka Favorites | Daftar favorit tetap tampil. Informasi movie konsisten (mungkin ada terjemahan judul). | ✅ Pass |

Notes : 
- US3-07 : dari hasil manual execution sistem menampilkan pesan bahwa this page is private but theres no guide message for user to login after it, can add the guide message or redirect the user to the login page for ux improvement 
---

## US4 - Sorting Favorite Movies

**User Story:** Sebagai user, saya ingin dapat mengurutkan daftar favorite movie saya.

| ID | Type | Title | Precondition | Steps | Expected Result | Status |
|----|------|-------|--------------|-------|-----------------|--------|
| US4-01 | Positive | Sort berdasarkan Popularity | User login, ada 3+ favorit | 1. Buka Favorites page 2. Pilih sort "Popularity" | Daftar diurutkan berdasarkan popularity score (descending). | ✅ Pass |
| US4-02 | Positive | Sort berdasarkan Release Date | User login, ada 3+ favorit | 1. Buka Favorites page 2. Pilih sort "Release Date" | Daftar diurutkan dari release date terbaru ke terlama. | ❌ Fail |
| US4-03 | Positive | Sort preference tersimpan setelah refresh | User login, sudah pilih sort | 1. Pilih sort "Popularity" 2. Refresh halaman | Sort masih "Popularity", urutan tidak berubah. | ❌ Fail|
| US4-04 | Positive | Sort preference persist setelah re-login | User sudah pilih sort | 1. Pilih sort "Release Date" 2. Logout 3. Login kembali 4. Buka Favorites | Sort masih "Release Date" (preferensi tersimpan per user). | ❌ Fail |
| US4-05 | Negative | Sort pada list kosong | User login, belum ada favorit | 1. Buka Favorites page (kosong) 2. Coba gunakan dropdown sort | Tidak ada error. Tetap menampilkan empty state. | ✅ Pass |
| US4-06 | Edge | Sort setelah menambah movie baru | User login, sudah sort by Popularity | 1. Set sort ke Popularity 2. Tambah movie baru ke favorit 3. Buka Favorites | Movie baru muncul di posisi sesuai popularity-nya (bukan di paling atas). | ❌ Fail |
| US4-07 | Edge | Ganti sort dari Popularity ke Release Date | User login, ada favorit | 1. Pilih sort Popularity 2. Ganti ke Release Date | Urutan berubah sesuai release date. Tidak ada error atau loading masalah. | ✅ Pass |

Notes : 
- US4-02 : as a user i confuse for the rule on sorting 'Release date' i dont think the list sorted properly, peraturan sorting harusnya lebih user friendly untuk dimengerti, by improving the detail information on movie detail page, setiap informasi release date, popularity, hal hal yang dijadikan fitur sorting harusnya menjadi informasi yang mudah dibaca user di movie detail page. so user can know if their favorite movie/film lists is sorted properly and they can find the data efficiently 
- US4-03 : not sorted properly, need more uat about this 
---

## US5 - Remove Movie from Favorite

**User Story:** Sebagai user, saya ingin dapat menghapus movie dari daftar favorite.

| ID | Type | Title | Precondition | Steps | Expected Result | Status |
|----|------|-------|--------------|-------|-----------------|--------|
| US5-01 | Positive | Remove dari Favorites List page | User login, ada favorit | 1. Buka Favorites page 2. Klik ikon remove/heart pada movie | Movie LANGSUNG hilang dari list tanpa perlu refresh. | ❌ Fail |
| US5-02 | Positive | Remove dari Movie Listing page | User login, movie sudah difavorit | 1. Buka movie listing 2. Klik ikon favorit (aktif) pada movie | Ikon berubah jadi inactive. Movie hilang dari Favorites list. | ✅ Pass |
| US5-03 | Positive | Remove dari Movie Detail page | User login, movie sudah difavorit | 1. Buka detail movie yang difavorit 2. Klik tombol "Mark as Favorite" (toggle off) | Ikon berubah inactive di detail. Movie hilang dari Favorites list. | ✅ Pass |
| US5-04 | Positive | Status berubah di semua halaman setelah remove | User login, movie difavorit | 1. Remove movie dari Favorites page 2. Buka movie listing 3. Buka detail movie tersebut | Ikon favorit TIDAK AKTIF di listing page DAN di detail page. | ⚠️ Blocked |
| US5-05 | Positive | Re-add movie setelah di-remove | User login | 1. Remove movie A 2. Mark lagi movie A 3. Buka Favorites | Movie A kembali muncul di Favorites. | ✅ Pass |
| US5-06 | Negative | Remove tanpa login | User belum login | 1. Akses halaman favorites langsung 2. Coba remove | Sistem redirect ke login atau tampilkan pesan error. Tidak ada perubahan data. | ✅ Pass |
| US5-07 | Edge | Remove movie terakhir | User login, hanya 1 movie di favorit | 1. Buka Favorites 2. Remove satu-satunya movie | Favorites list menjadi kosong. Sistem menampilkan empty state. Tidak ada error. | ✅ Pass |
| US5-08 | Edge | Remove, refresh, cek konsistensi | User login | 1. Remove movie A dari listing 2. Refresh halaman 3. Buka Favorites page | Movie A tidak muncul lagi di Favorites setelah refresh. | ✅ Pass |

Notes: 
- US5-01 : the remove favorite film/movie tidak langsung hilang setelah di remove, harus refresh page terlebih dahulu
- US5-04: ⚠️ Blocked — Test case ini bergantung pada hasil US5-01. Karena remove dari Favorites page tidak langsung memperbarui UI (bug), maka tidak mungkin memverifikasi apakah status ikon di listing page dan detail page ikut berubah secara akurat dalam satu sesi tanpa bias dari bug tersebut. Test ini harus dijalankan ulang setelah US5-01 diperbaiki.
---

## Exploratory Test Cases

| ID | Type | Title | Steps | Expected Result | Status |
|----|------|-------|-------|-----------------|--------|
| EXP-01 | Exploratory | Akses Favorites dari URL langsung | Akses /account/{username}/favorites/movies | Halaman Favorites tampil (jika login). | ✅ Pass |
| EXP-02 | Exploratory | Mark movie via keyboard shortcut | Tekan "f" saat berada di halaman detail (jika ada shortcut) | Jika ada shortcut, movie langsung difavorit. |⏭️ Skipped |
| EXP-03 | Exploratory | Favorite list pagination | Favorit banyak (lebih dari 20 movie) | Sistem menampilkan pagination. Navigasi antar halaman berfungsi. | ⏭️ Skipped |
| EXP-04 | Exploratory | Jumlah favorit tampil di profile | Buka halaman profil setelah mark beberapa movie | Jumlah favorit tampil di profil dan sesuai dengan jumlah di Favorites page. | ⏭️ Skipped |
| EXP-05 | Exploratory | Favorites tersedia di mobile viewport | Buka TMDb di mobile browser, mark dan cek Favorites | Semua fungsi bekerja di mobile. Ikon mudah ditekan. | ❌ Fail |

Notes:
- semua test exploratory test cases yang di skipped dilakukan karena tidak adanya fungsi/fitur tersebut, hal2 ini dapat dijadikan bahan pertimbangan UX improvement untuk pengembangan selanjutnya 
- EXP-05 : website tidak responsive di mobile version. 

## Test Result Summary

| User Story | Total TC | Pass | Fail | Blocked | Not Run |
|------------|----------|------|------|---------|---------|
| US1 - Ubah Bahasa | 7 | 6 | 0 | 0 | 1 |
| US2 - Mark as Favorite | 9 | 7 | 0 | 0 | 2 |
| US3 - View Favorite List | 7 | 7 | 0 | 0 | 0 |
| US4 - Sorting | 7 | 2 | 4 | 0 | 1 |
| US5 - Remove Favorite | 8 | 6 | 1 | 1 | 0 |
| Exploratory | 5 | 1 | 1 | 0 | 3 |
| **TOTAL** | **43** | **29** | **6** | **1** | **7** |

### Conclusion

Berdasarkan hasil pengujian, fungsi-fungsi inti seperti penggantian bahasa, penandaan favorit, dan penayangan daftar favorit berjalan sesuai harapan.

Namun, terdapat beberapa masalah yang teridentifikasi:

- Fungsi penyortiran tidak konsisten dan tidak dapat diandalkan (tingkat kegagalan tinggi).
- Status antarmuka pengguna (UI) tidak diperbarui dengan benar pada beberapa tindakan (misalnya, menghapus favorit memerlukan penyegaran manual).
- Ditemukan beberapa celah pengalaman pengguna (UX), termasuk kurangnya umpan balik, logika penyortiran yang tidak jelas, dan panduan yang hilang untuk halaman yang dibatasi.
- Aplikasi tidak responsif pada perangkat seluler.

Secara keseluruhan, meskipun fitur utama berfungsi, perbaikan diperlukan pada keandalan penyortiran, penanganan status antarmuka pengguna (UI), dan pengalaman pengguna untuk memastikan interaksi yang lebih lancar.

---

## Validation Approach (Automation Testing - Cypress)

### Automation Test Results (Run Date: 2026-04-19)

| Test Suite | Test Name | Status | Duration |
|------------|-----------|--------|----------|
| TMDb - Basic Page Access Tests | TC-01 - Can access TMDb homepage | PASS | 6s |
| TMDb - Basic Page Access Tests | TC-02 - Can access movie listing page | PASS | 4s |
| TMDb - Basic Page Access Tests | TC-03 - Can access movie detail page | PASS | 4s |
| TMDb - Basic Page Access Tests | TC-04 - Can access login page | PASS | 3s |
| TMDb - Basic Page Access Tests | TC-05 - Unauthenticated access to account | PASS | 4s |

**Summary**: 5/5 tests passing (100% pass rate)


## Catatan Terkait Automation Testing

Dalam pengerjaan automation testing pada website TMDb, terdapat beberapa penyesuaian dan keterbatasan yang perlu saya sampaikan.

Saya juga menyadari bahwa dalam proses ini masih terdapat ruang untuk pengembangan lebih lanjut dari sisi kemampuan automation testing saya.

### 1. Perbaikan yang Dilakukan
Pada awal pengerjaan, fungsi login mengalami kendala dan tidak dapat berjalan dengan baik.  
Saya telah melakukan perbaikan sehingga saat ini proses login sudah dapat digunakan dan basic test scenarios dapat dijalankan dengan sukses.

### 2. Keterbatasan Pengujian
Perlu diperhatikan bahwa TMDb merupakan website publik (third-party) dan bukan environment khusus untuk testing. Hal ini menyebabkan beberapa tantangan, antara lain:
- Struktur DOM bersifat dinamis dan dapat berubah sewaktu-waktu
- Alur autentikasi melibatkan modal, pop-up, atau banner yang tidak selalu konsisten
- Beberapa elemen sulit diidentifikasi secara stabil hanya menggunakan CSS selector

Kondisi tersebut berdampak pada kestabilan automation test, terutama dalam menentukan locator yang reliable.

### 3. Pertimbangan untuk Pengembangan Test Lebih Lanjut
Jika dilakukan pengembangan lebih lanjut terhadap automation test, terdapat beberapa hal yang perlu diperhatikan:
- Dibutuhkan selector yang lebih stabil (misalnya menggunakan atribut khusus seperti `data-testid`, jika tersedia)
- Perlu penanganan wait/timeout yang lebih kompleks untuk mengakomodasi elemen dinamis
- Dalam beberapa kasus, akan lebih optimal jika menggunakan API resmi TMDb yang terautentikasi
- Beberapa skenario lebih efektif dan efisien jika tetap dilakukan melalui manual exploratory testing

Dengan mempertimbangkan hal-hal tersebut, pendekatan yang digunakan saat ini berfokus pada kestabilan test untuk skenario utama (critical path), sambil tetap terus saya kembangkan ke depannya.

---

## Gherkin Format vs Automation Coverage

Terdapat file `features/tmdb_favorite.feature` yang berisi skenario dalam format Gherkin (BDD). File ini adalah **dokumentasi** yang menjelaskan test scenarios dalam bahasa yang mudah dipahami oleh stakeholder/non-programmer.

### ⚠️ Penting: Perbedaan Coverage

| Komponen | Coverage |
|----------|----------|
| **TEST_CASES.md** | 43 test cases (manual + automated) ✅ Lengkap |
| **Gherkin feature file** | ~27 skenario (dokumentasi saja) |
| **Cypress automation** | 5 basic page access tests |

**Jelaskan:** File Gherkin mendeskripsikan apa yang *seharusnya* diuji, tetapi file Cypress belum mengimplementasikan mayoritas dari skenario tersebut. Mengapa:

1. **Limitasi third-party website** - TMDb bukan environment testing khusus, sehingga:
   - Struktur DOM dinamis dan bisa berubah sewaktu-waktu
   - CSS selector yang digunakan tidak stabil
   - Tidak ada `data-testid` attribute untuk locator yang reliable

2. **API authentication** - Tanpa TMDb API key, sulit melakukan prepopulasi data sebelum test (misalnya clear favorites sebelum test baru)

3. **Focus pada stability** - pendekatan saat ini fokus pada basic page access tests yang stabil untuk demonstrate automation capability, bukan full coverage


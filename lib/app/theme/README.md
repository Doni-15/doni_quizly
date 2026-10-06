# Tema Aplikasi Kuis (Terang + Gelap)

Tema untuk tugas **Aplikasi Kuis Pilihan Ganda** (UTS Pemrograman Mobile). Tema terang adalah tampilan utama, tema gelap tersedia sebagai **bonus dual-theme**. Dikembangkan dari tema gelap bertema anime sebelumnya (`Anime*` menjadi `Quiz*`), dengan identitas biru yang sama.

Salin folder `theme/` ke `lib/` proyekmu.

## Cara pakai

**1. Font kustom** (kriteria 5). Taruh file font di `assets/fonts/` lalu daftarkan di `pubspec.yaml`. Jika file font tidak ada, Flutter diam-diam memakai font bawaan, jadi pastikan tampilannya benar-benar berubah.

```yaml
flutter:
  uses-material-design: true
  fonts:
    - family: PlusJakartaSans
      fonts:
        - asset: assets/fonts/PlusJakartaSans-Regular.ttf
        - asset: assets/fonts/PlusJakartaSans-Medium.ttf
          weight: 500
        - asset: assets/fonts/PlusJakartaSans-Bold.ttf
          weight: 700
        - asset: assets/fonts/PlusJakartaSans-ExtraBold.ttf
          weight: 800
```

**2. Pasang di `MaterialApp`:**

```dart
final themeController = QuizThemeController();

ListenableBuilder(
  listenable: themeController,
  builder: (context, _) => MaterialApp(
    theme: QuizTheme.light,
    darkTheme: QuizTheme.dark,
    themeMode: themeController.mode,
    builder: QuizResponsive.appBuilder,
    scrollBehavior: const QuizScrollBehavior(),
    home: const NameScreen(),
  ),
)
```

**3. Di widget:**

```dart
final c = context.quizColors;            // warna sesuai tema aktif
final text = Theme.of(context).textTheme; // ukuran teks sudah dinamis

Container(
  padding: EdgeInsets.all(context.sp(0.04)),      // 4% sisi terpendek layar
  decoration: BoxDecoration(color: c.surface),
  child: Text('Soal 3 dari 10', style: text.bodySmall?.copyWith(color: c.textMuted)),
)
```

**Pilihan jawaban** (A/B/C/D) cukup minta warna sesuai status:

```dart
final o = context.quizColors.optionColors(
  isCorrect ? QuizOptionState.correct
  : isWrong ? QuizOptionState.wrong
  : isSelected ? QuizOptionState.selected
  : QuizOptionState.idle,
);
// o.background, o.border, o.foreground, o.badgeBackground, o.badgeForeground
```

**Skor akhir:** `c.gradeColor(benar / total)` memberi hijau (≥ 80%), oranye (≥ 50%), atau merah. Kartu skor memakai `QuizGradients.score(c)` dengan teks `c.onPrimary`.

## Kaitan dengan kriteria tugas

| Kriteria | Dukungan tema |
| --- | --- |
| 5. Font kustom | `QuizTypography.fontFamily = 'PlusJakartaSans'` terpasang di seluruh `TextTheme` |
| 6. Ukuran dinamis | `context.wp/hp/sp`, `QuizResponsive.horizontalPadding`, teks diskalakan otomatis oleh `appBuilder` (berdasarkan sisi terpendek layar, jadi aman saat rotasi) |
| 7. State tidak hilang | `QuizThemeController` adalah `ChangeNotifier` di luar widget; pola yang sama dipakai untuk state kuis |
| Bonus 1. Dual-theme | `QuizTheme.light` / `QuizTheme.dark` + `QuizColors` sebagai `ThemeExtension` (warna berganti halus lewat `lerp`) |
| Bonus 2. Adaptive | `QuizResponsive.pick`, breakpoint 600/900, `QuizCenteredBody` membatasi lebar konten 720 |
| Penalti overflow | Ukuran di util berasal dari persentase layar; skala teks dibatasi 0.9x - 1.3x. Radius dan padding tombol di tema adalah token dasar; ukuran layout tetap pakai `wp/hp/sp` |

## Palet warna

Semua pasangan teks/latar sudah dicek lolos WCAG AA (kontras ≥ 4,5:1; garis batas ≥ 3:1).

| Nama | Dipakai untuk | Terang | Gelap |
| --- | --- | --- | --- |
| `background` | Latar halaman | `#F4F8FC` | `#0B1120` |
| `surface` | Kartu, panel, input, dialog | `#FFFFFF` | `#131D2E` |
| `surfaceRaised` | Permukaan yang lebih menonjol | `#EAF1F9` | `#1C2940` |
| `border` | Garis batas input dan pilihan jawaban | `#7C8DA5` | `#64748B` |
| `divider` | Garis pemisah | `#DCE5F0` | `#2D3B52` |
| `primary` | Aksi utama, tautan, indikator aktif | `#0369A1` | `#38BDF8` |
| `onPrimary` | Teks/ikon di atas primary | `#FFFFFF` | `#082F49` |
| `primaryContainer` | Latar pilihan terpilih dan penanda | `#D7EEFC` | `#123B55` |
| `onPrimaryContainer` | Teks/ikon di atas primaryContainer | `#0C4A6E` | `#BAE6FD` |
| `secondary` | Aksen pendukung | `#4F46E5` | `#A5B4FC` |
| `onSecondary` | Teks/ikon di atas secondary | `#FFFFFF` | `#1E1B4B` |
| `secondaryContainer` | Latar aksen pendukung | `#E0E7FF` | `#2E315E` |
| `onSecondaryContainer` | Teks/ikon di atas secondaryContainer | `#312E81` | `#E0E7FF` |
| `textPrimary` | Teks utama, termasuk teks pertanyaan | `#0F172A` | `#F1F5F9` |
| `textSecondary` | Teks pendukung | `#334155` | `#B8C5D6` |
| `textMuted` | Metadata, misalnya 'Soal 3 dari 10' | `#5B6B80` | `#94A3B8` |
| `success` | Jawaban benar | `#15803D` | `#4ADE80` |
| `onSuccess` | Teks/ikon di atas success | `#FFFFFF` | `#052E16` |
| `successContainer` | Latar jawaban benar | `#DCFCE7` | `#123524` |
| `onSuccessContainer` | Teks di atas successContainer | `#14532D` | `#BBF7D0` |
| `warning` | Peringatan, misalnya nama belum diisi | `#C2410C` | `#FB923C` |
| `warningContainer` | Latar peringatan | `#FFEDD5` | `#3F2512` |
| `onWarningContainer` | Teks di atas warningContainer | `#7C2D12` | `#FFD7B5` |
| `error` | Jawaban salah | `#BE123C` | `#FB7185` |
| `onError` | Teks/ikon di atas error | `#FFFFFF` | `#4C0519` |
| `errorContainer` | Latar jawaban salah | `#FFE4E8` | `#4C1725` |
| `onErrorContainer` | Teks di atas errorContainer | `#881337` | `#FFD9DF` |
| `info` | Informasi | `#0369A1` | `#7DD3FC` |
| `infoContainer` | Latar informasi | `#E0F2FE` | `#12364B` |
| `gold` | Piala, bintang, skor sempurna | `#A16207` | `#FACC15` |
| `onGold` | Teks/ikon di atas gold | `#FFFFFF` | `#422006` |
| `goldContainer` | Latar penghargaan | `#FEF9C3` | `#3A3010` |
| `onGoldContainer` | Teks di atas goldContainer | `#713F12` | `#FEF08A` |
| `shadow` | Bayangan kartu | `#1A0F172A` | `#66000000` |
| `imageScrim` | Lapisan gelap di atas gambar | `#990F172A` | `#E6000000` |
| `onImageScrim` | Teks di atas lapisan gambar | `#FFFFFF` | `#FFFFFF` |

## Tipografi

| Gaya | Ukuran dasar / tinggi baris / bobot | Contoh penggunaan |
| --- | --- | --- |
| `displayLarge` | 48 / 1,15 / 800 | Judul pembuka sangat besar |
| `displayMedium` | 40 / 1,20 / 800 | Judul pembuka |
| `displaySmall` | 36 / 1,20 / 800 | Judul besar |
| `headlineLarge` | 32 / 1,25 / 800 | Angka skor akhir |
| `headlineMedium` | 28 / 1,25 / 700 | Judul hasil |
| `headlineSmall` | 24 / 1,30 / 700 | Judul halaman |
| `titleLarge` | 20 / 1,35 / 700 | Teks pertanyaan |
| `titleMedium` | 16 / 1,40 / 700 | Judul kartu |
| `titleSmall` | 14 / 1,40 / 700 | Judul kecil |
| `bodyLarge` | 16 / 1,55 / 500 | Teks pilihan jawaban |
| `bodyMedium` | 14 / 1,50 / 400 | Deskripsi |
| `bodySmall` | 12 / 1,50 / 400 | "Soal 3 dari 10" |
| `labelLarge` | 14 / 1,40 / 700 | Tulisan tombol |
| `labelMedium` | 12 / 1,40 / 700 | Label kategori |
| `labelSmall` | 11 / 1,40 / 700 | Label kecil |

Ukuran di atas adalah ukuran dasar untuk layar 390 px; di layar lain nilainya dikali 0,9 - 1,3 oleh `QuizResponsive.appBuilder`.

## Aturan pakai

- Jangan menulis `Color(0xFF...)`, `fontSize:` atau `SizedBox(width: 200)` langsung di widget. Ambil dari `context.quizColors`, `Theme.of(context).textTheme`, dan `context.wp/hp/sp`.
- Benar/salah jangan hanya dibedakan lewat warna; sertakan ikon (`Icons.check_circle` / `Icons.cancel`) dan teks.
- Bungkus `body` setiap halaman dengan `QuizCenteredBody` dan `SingleChildScrollView` agar tidak overflow saat landscape atau layar kecil.
- Butuh Flutter 3.27 atau lebih baru (memakai `CardThemeData`, `DialogThemeData`, `Color.withValues`).

import 'package:quizly/models/quiz_question.dart';

const List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    id: 'q_1',
    questionText:
        'Teknik kriptografi klasik yang mengubah huruf dengan menggeser posisinya dalam alfabet disebut...',
    options: [
      QuizOption(id: 'q1_a', text: 'Vigenere Cipher', isCorrect: false),
      QuizOption(id: 'q1_b', text: 'Caesar Cipher', isCorrect: true),
      QuizOption(id: 'q1_c', text: 'Playfair Cipher', isCorrect: false),
      QuizOption(id: 'q1_d', text: 'RSA', isCorrect: false),
    ],
    explanation:
        'Caesar Cipher adalah teknik substitusi sederhana yang menggeser huruf pada alfabet dengan jumlah pergeseran tertentu.',
  ),

  QuizQuestion(
    id: 'q_2',
    questionText:
        'Jenis enkripsi yang menggunakan kunci yang sama untuk proses enkripsi dan dekripsi adalah...',
    options: [
      QuizOption(id: 'q2_a', text: 'Enkripsi Asimetris', isCorrect: false),
      QuizOption(id: 'q2_b', text: 'Fungsi Hash', isCorrect: false),
      QuizOption(id: 'q2_c', text: 'Enkripsi Simetris', isCorrect: true),
      QuizOption(id: 'q2_d', text: 'Steganografi', isCorrect: false),
    ],
    explanation:
        'Enkripsi Simetris (seperti AES) menggunakan satu kunci rahasia yang sama untuk mengenkripsi dan mendekripsi data.',
  ),

  QuizQuestion(
    id: 'q_3',
    questionText:
        'Manakah dari algoritma berikut yang merupakan contoh algoritma Enkripsi Asimetris?',
    options: [
      QuizOption(id: 'q3_a', text: 'AES', isCorrect: false),
      QuizOption(id: 'q3_b', text: 'DES', isCorrect: false),
      QuizOption(id: 'q3_c', text: 'MD5', isCorrect: false),
      QuizOption(id: 'q3_d', text: 'RSA', isCorrect: true),
    ],
    explanation:
        'RSA (Rivest-Shamir-Adleman) adalah algoritma enkripsi asimetris populer yang menggunakan sepasang public key dan private key.',
  ),

  QuizQuestion(
    id: 'q_4',
    questionText: 'Apa karakteristik utama dari Fungsi Hash dalam kriptografi?',
    options: [
      QuizOption(
        id: 'q4_a',
        text: 'Dapat didekripsi dengan public key',
        isCorrect: false,
      ),
      QuizOption(
        id: 'q4_b',
        text: 'Dapat dikembalikan ke pesan semula',
        isCorrect: false,
      ),
      QuizOption(
        id: 'q4_c',
        text: 'Bersifat satu arah (one-way)',
        isCorrect: true,
      ),
      QuizOption(
        id: 'q4_d',
        text: 'Membutuhkan dua kunci yang berbeda',
        isCorrect: false,
      ),
    ],
    explanation:
        'Fungsi hash bersifat satu arah (irreversible), artinya data yang sudah di-hash sangat sulit bahkan mustahil dikembalikan ke bentuk aslinya.',
  ),

  QuizQuestion(
    id: 'q_5',
    questionText:
        'Proses menyembunyikan pesan rahasia di dalam pesan atau file lain yang tampak normal disebut...',
    options: [
      QuizOption(id: 'q5_a', text: 'Steganografi', isCorrect: true),
      QuizOption(id: 'q5_b', text: 'Kriptanalisis', isCorrect: false),
      QuizOption(id: 'q5_c', text: 'Dekripsi', isCorrect: false),
      QuizOption(id: 'q5_d', text: 'Hashing', isCorrect: false),
    ],
    explanation:
        'Steganografi menyembunyikan eksistensi pesan itu sendiri (misalnya menyisipkan teks rahasia ke dalam piksel gambar).',
  ),

  QuizQuestion(
    id: 'q_6',
    questionText:
        'Digital Signature (Tanda Tangan Digital) utamanya digunakan untuk memastikan...',
    options: [
      QuizOption(id: 'q6_a', text: 'Kecepatan pengiriman', isCorrect: false),
      QuizOption(
        id: 'q6_b',
        text: 'Autentikasi dan Non-repudiation',
        isCorrect: true,
      ),
      QuizOption(id: 'q6_c', text: 'Kerahasiaan mutlak', isCorrect: false),
      QuizOption(id: 'q6_d', text: 'Kompresi file', isCorrect: false),
    ],
    explanation:
        'Digital signature membuktikan keaslian pengirim (Autentikasi) dan mencegah pengirim menyangkal pesannya (Non-repudiation).',
  ),

  QuizQuestion(
    id: 'q_7',
    questionText:
        'Serangan kriptografi dengan cara mencoba semua kemungkinan kombinasi kunci hingga menemukan yang benar disebut...',
    options: [
      QuizOption(id: 'q7_a', text: 'Man-in-the-Middle', isCorrect: false),
      QuizOption(id: 'q7_b', text: 'Phishing', isCorrect: false),
      QuizOption(id: 'q7_c', text: 'Brute Force Attack', isCorrect: true),
      QuizOption(id: 'q7_d', text: 'SQL Injection', isCorrect: false),
    ],
    explanation:
        'Brute Force Attack mencoba setiap kombinasi karakter satu per satu sampai berhasil menemukan kunci yang tepat untuk membuka sandi.',
  ),

  QuizQuestion(
    id: 'q_8',
    questionText:
        'Apa kepanjangan dari AES, standar enkripsi simetris yang banyak digunakan saat ini?',
    options: [
      QuizOption(
        id: 'q8_a',
        text: 'Advanced Encryption Standard',
        isCorrect: true,
      ),
      QuizOption(
        id: 'q8_b',
        text: 'Asymmetric Encoding System',
        isCorrect: false,
      ),
      QuizOption(
        id: 'q8_c',
        text: 'Automated Encryption Security',
        isCorrect: false,
      ),
      QuizOption(
        id: 'q8_d',
        text: 'Algorithm for Electronic Security',
        isCorrect: false,
      ),
    ],
    explanation:
        'AES (Advanced Encryption Standard) ditetapkan oleh NIST pada tahun 2001 untuk menggantikan standar lama (DES).',
  ),

  QuizQuestion(
    id: 'q_9',
    questionText:
        'Dalam Public Key Infrastructure (PKI), pihak ketiga yang dipercaya untuk menerbitkan Sertifikat Digital disebut...',
    options: [
      QuizOption(id: 'q9_a', text: 'Hacker', isCorrect: false),
      QuizOption(
        id: 'q9_b',
        text: 'Certificate Authority (CA)',
        isCorrect: true,
      ),
      QuizOption(
        id: 'q9_c',
        text: 'Internet Service Provider',
        isCorrect: false,
      ),
      QuizOption(id: 'q9_d', text: 'Key Generator', isCorrect: false),
    ],
    explanation:
        'Certificate Authority (CA) bertugas memverifikasi identitas dan menerbitkan sertifikat digital yang mengikat entitas dengan public key-nya.',
  ),

  QuizQuestion(
    id: 'q_10',
    questionText:
        'Jika Alice ingin mengirim pesan rahasia kepada Bob menggunakan Enkripsi Asimetris, kunci milik siapa yang harus digunakan Alice untuk mengenkripsi?',
    options: [
      QuizOption(id: 'q10_a', text: 'Private Key Alice', isCorrect: false),
      QuizOption(id: 'q10_b', text: 'Public Key Alice', isCorrect: false),
      QuizOption(id: 'q10_c', text: 'Private Key Bob', isCorrect: false),
      QuizOption(id: 'q10_d', text: 'Public Key Bob', isCorrect: true),
    ],
    explanation:
        'Alice harus menggunakan Public Key milik Bob. Dengan begitu, hanya Bob (pemegang Private Key pasangannya) yang bisa membukanya.',
  ),
];

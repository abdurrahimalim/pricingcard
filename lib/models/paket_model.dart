import 'package:flutter/material.dart';

class PaketModel {
  final IconData icon;
  final String nama;
  final String harga;
  final int hargaAngka;
  final String deskripsi;
  final List<String> fitur;
  final Color warnaPastel;
  final String? badge;

  const PaketModel({
    required this.icon,
    required this.nama,
    required this.harga,
    required this.hargaAngka,
    required this.deskripsi,
    required this.fitur,
    required this.warnaPastel,
    this.badge,
  });
}

// Data 3 paket — sesuai requirement menampilkan 3 cards
const List<PaketModel> daftarPaket = [
  PaketModel(
    icon: Icons.laptop_chromebook,
    nama: 'Paket Dasar',
    harga: 'Rp 2.500.000',
    hargaAngka: 2500000,
    deskripsi:
        'Cocok untuk kebutuhan pemula seperti company profile sederhana '
        'atau landing page statis tanpa backend yang rumit. Cepat dan efisien.',
    fitur: ['Desain UI Standar', 'Static Website 3 Halaman', 'Free Hosting 1 Tahun', 'Dukungan Teknis 1 Minggu'],
    warnaPastel: Color(0xFFE8F4FD), // Pastel soft cyan/blue
    badge: 'Starter',
  ),
  PaketModel(
    icon: Icons.laptop_mac,
    nama: 'Paket Profesional',
    harga: 'Rp 5.000.000',
    hargaAngka: 5000000,
    deskripsi:
        'Solusi IT profesional terlengkap untuk bisnis Anda yang sedang berkembang. '
        'Mencakup desain kustom, integrasi database, dan tampilan responsif di semua perangkat.',
    fitur: [
      'Desain UI/UX Eksklusif',
      'Integrasi Database & API',
      'Tampilan Responsif Mobile & Desktop',
      'Optimasi SEO & Kecepatan',
      'Support & Pemeliharaan 1 Bulan',
    ],
    warnaPastel: Color(0xFFFFF3E0), // Pastel soft orange/amber
    badge: 'Paling Populer',
  ),
  PaketModel(
    icon: Icons.dns,
    nama: 'Paket Enterprise',
    harga: 'Rp 12.000.000',
    hargaAngka: 12000000,
    deskripsi:
        'Kapasitas skala besar dengan keamanan tingkat tinggi, arsitektur microservices kustom, '
        'dan dukungan prioritas 24/7 untuk memastikan sistem bisnis Anda selalu prima.',
    fitur: [
      'Arsitektur Backend Kustom',
      'Keamanan Tingkat Lanjut & SSL',
      'Integrasi Multi-Payment Gateway',
      'Analitik & Dashboard Admin',
      'Priority Dedicated Support 3 Bulan',
    ],
    warnaPastel: Color(0xFFEDE7F6), // Pastel soft purple/lavender
    badge: 'Enterprise',
  ),
];
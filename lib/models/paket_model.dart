import 'package:flutter/material.dart';

class PaketModel {
  final IconData icon;
  final String nama;
  final String harga;
  final String deskripsi;
  final List<String> fitur;

  const PaketModel({
    required this.icon,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.fitur,
  });
}

// Data 3 paket — cukup didefinisikan sekali, dipakai ulang di ListView
const List<PaketModel> daftarPaket = [
  PaketModel(
    icon: Icons.laptop_chromebook,
    nama: 'Paket Dasar',
    harga: 'Rp 2.500.000',
    deskripsi:
    'Cocok untuk kebutuhan dasar seperti company profile sederhana '
        'atau landing page tanpa fitur backend yang kompleks.',
    fitur: ['Desain UI Standar', 'Static Website', 'Support 1 Minggu'],
  ),
  PaketModel(
    icon: Icons.laptop_mac,
    nama: 'Paket Profesional',
    harga: 'Rp 5.000.000',
    deskripsi:
    'Solusi IT profesional untuk bisnis Anda, mencakup desain custom, '
        'integrasi database, dan tampilan yang responsif di semua perangkat.',
    fitur: [
      'Desain UI/UX Khusus',
      'Setup Database',
      'Responsive Design',
      'Support & Maintenance',
    ],
  ),
  PaketModel(
    icon: Icons.dns,
    nama: 'Paket Enterprise',
    harga: 'Rp 12.000.000',
    deskripsi:
    'Untuk kebutuhan skala besar: arsitektur backend custom, integrasi '
        'API pihak ketiga, dan dukungan prioritas selama 3 bulan penuh.',
    fitur: [
      'Arsitektur Custom',
      'Integrasi API',
      'Keamanan Tingkat Lanjut',
      'Priority Support 3 Bulan',
    ],
  ),
];
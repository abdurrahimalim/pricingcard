import 'package:flutter/material.dart';
import '../models/paket_model.dart';

/// SCREEN 2 — DETAIL KATALOG
/// - Wajib menggunakan tata letak vertikal dengan Column (Requirement c)
/// - Wajib berupa StatefulWidget untuk menyelesaikan tantangan tambahan (Requirement c)
/// - Elemen visual:
///   * Icon back untuk kembali ke Screen 1 (Requirement d & e)
///   * Text nama katalog, harga, dll (Requirement d)
///   * Container berlatar warna pastel + padding tempat deskripsi singkat (Requirement d)
/// - AppBar agar tombol "Kembali" otomatis tersedia (Requirement e & Ekspektasi c)
/// - Implementasi Konsep Event & State (Requirement f & Ekspektasi d)
class DetailKatalogScreen extends StatefulWidget {
  final PaketModel paket;

  const DetailKatalogScreen({super.key, required this.paket});

  @override
  State<DetailKatalogScreen> createState() => _DetailKatalogScreenState();
}

class _DetailKatalogScreenState extends State<DetailKatalogScreen> {
  // ==========================================
  // STATE MANAGEMENT (Konsep Event & State)
  // ==========================================

  // State 1: Status favorit/bookmark paket
  bool _isFavorit = false;

  // State 2: Durasi langganan (bulan) yang memicu pembaruan total harga reaktif
  int _durasiBulan = 1;

  // State 3: Status pemesanan paket
  bool _isDipilih = false;

  // Format angka ke format rupiah string sederhana
  String _formatRupiah(int nominal) {
    String str = nominal.toString();
    String hasil = '';
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      count++;
      hasil = str[i] + hasil;
      if (count % 3 == 0 && i > 0) {
        hasil = '.$hasil';
      }
    }
    return 'Rp $hasil';
  }

  // EVENT 1: Toggle bookmark favorit
  void _toggleFavorit() {
    setState(() {
      _isFavorit = !_isFavorit;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorit
              ? '${widget.paket.nama} ditambahkan ke Favorit!'
              : '${widget.paket.nama} dihapus dari Favorit.',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // EVENT 2: Mengubah durasi bulan
  void _ubahDurasi(int delta) {
    setState(() {
      final nilaiBaru = _durasiBulan + delta;
      if (nilaiBaru >= 1 && nilaiBaru <= 12) {
        _durasiBulan = nilaiBaru;
      }
    });
  }

  // EVENT 3: Memilih atau membatalkan paket
  void _togglePilihPaket() {
    setState(() {
      _isDipilih = !_isDipilih;
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _isDipilih ? Colors.green.shade700 : Colors.redAccent,
        content: Text(
          _isDipilih
              ? 'Berhasil memilih ${widget.paket.nama} selama $_durasiBulan bulan!'
              : 'Pemilihan ${widget.paket.nama} dibatalkan.',
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final paket = widget.paket;
    final totalBiaya = paket.hargaAngka * _durasiBulan;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      // Requirement e: AppBar agar tombol "Kembali" bawaan otomatis tersedia
      appBar: AppBar(
        title: Text(
          paket.nama,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Icon back otomatis ada di AppBar, kita juga sediakan action favorit (Event & State)
        actions: [
          IconButton(
            tooltip: _isFavorit ? 'Hapus Favorit' : 'Tambah Favorit',
            icon: Icon(
              _isFavorit ? Icons.favorite : Icons.favorite_border,
              color: _isFavorit ? Colors.red : null,
            ),
            // Memicu Event Toggle Favorit
            onPressed: _toggleFavorit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        // Requirement c: Tata letak vertikal wajib menggunakan Column
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon back tambahan yang difungsikan kembali ke Screen 1 (sesuai spesifikasi & sample dosen)
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_rounded, color: Colors.blue.shade700),
                  const SizedBox(width: 8),
                  Text(
                    'Kembali',
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Banner Icon & Kategori
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: paket.warnaPastel,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.12),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(paket.icon, size: 48, color: Colors.blue.shade700),
              ),
            ),
            const SizedBox(height: 16),

            // Text Nama Katalog (Requirement d)
            Center(
              child: Text(
                paket.nama,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
            const SizedBox(height: 6),

            // Text Harga Paket (Requirement d)
            Center(
              child: Text(
                '${paket.harga} / bulan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // STATUS CARD JIKA PAKET SUDAH DIPILIH (Implementasi State)
            if (_isDipilih)
              Container(
                margin: const EdgeInsets.only(bottom: 18),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Status: Paket ini sedang dipilih ($_durasiBulan bulan).',
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Deskripsi Section
            const Text(
              'Deskripsi Layanan',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF334155),
              ),
            ),
            const SizedBox(height: 8),

            // Requirement d: Container latar warna pastel & padding untuk deskripsi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: paket.warnaPastel,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.05),
                ),
              ),
              child: Text(
                paket.deskripsi,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: Color(0xFF334155),
                ),
              ),
            ),
            const SizedBox(height: 22),

            // Daftar Fitur
            const Text(
              'Fitur Utama:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF334155),
              ),
            ),
            const SizedBox(height: 10),
            ...paket.fitur.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green.shade600,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        f,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // TANTANGAN TAMBAHAN: Interactive State (Pilih Durasi Bulan)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kalkulator Durasi Langganan (State Demo):',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Durasi Layanan:',
                          style: TextStyle(fontSize: 14),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              color: Colors.blue.shade700,
                              onPressed: _durasiBulan > 1 ? () => _ubahDurasi(-1) : null,
                            ),
                            Text(
                              '$_durasiBulan Bulan',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              color: Colors.blue.shade700,
                              onPressed: _durasiBulan < 12 ? () => _ubahDurasi(1) : null,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Estimasi Biaya:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _formatRupiah(totalBiaya),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Interaktif State: Pilih / Batalkan Paket
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDipilih ? Colors.green.shade600 : Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                icon: Icon(_isDipilih ? Icons.check : Icons.shopping_cart_outlined),
                label: Text(
                  _isDipilih ? 'Paket Terpilih (Klik untuk Batalkan)' : 'Pilih Paket Ini Sekarang',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                onPressed: _togglePilihPaket,
              ),
            ),
            const SizedBox(height: 12),

            // Requirement d: Memiliki sebuah Icon back yang difungsikan sebagai kembali ke Screen 1
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Beranda'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
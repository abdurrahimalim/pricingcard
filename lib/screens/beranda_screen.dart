import 'package:flutter/material.dart';
import '../models/paket_model.dart';
import 'detail_katalog_screen.dart';

/// SCREEN 1 — BERANDA
/// - Wajib menggunakan StatelessWidget (sesuai Requirement a)
/// - Menampilkan 3 cards dalam ListView
/// - Menggunakan ListTile dan tombol CTA (Call to Action) yang bisa diklik
/// - Navigasi ke Screen 2 menggunakan Stack Navigation Navigator.push (sesuai Requirement b & Ekspektasi b)
class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  /// Fungsi navigasi ke Screen Detail Katalog menggunakan metode Navigator.push
  void _bukaDetail(BuildContext context, PaketModel paket) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailKatalogScreen(paket: paket),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Katalog Paket IT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      // ListView berisi 3 cards
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: daftarPaket.length,
        itemBuilder: (context, index) {
          final paket = daftarPaket[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 18),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Item menggunakan ListTile
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: paket.warnaPastel,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(paket.icon, size: 32, color: Colors.blue.shade700),
                    ),
                    // Title yang dapat diklik untuk navigasi (Ekspektasi b)
                    title: InkWell(
                      onTap: () => _bukaDetail(context, paket),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              paket.nama,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          if (paket.badge != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade200,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                paket.badge!,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber.shade900,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        paket.harga,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                    // ListTile onTap juga mendukung navigasi
                    onTap: () => _bukaDetail(context, paket),
                  ),

                  const SizedBox(height: 8),

                  // Deskripsi singkat
                  Text(
                    paket.deskripsi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Tombol CTA (Call to Action) yang bisa diklik untuk navigasi
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 1,
                      ),
                      icon: const Icon(Icons.visibility_outlined, size: 18),
                      label: const Text(
                        'Lihat Detail & Pesan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // Ketika CTA diklik, pindah ke Screen 2 via Navigator.push
                      onPressed: () => _bukaDetail(context, paket),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
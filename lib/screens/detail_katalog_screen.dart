import 'package:flutter/material.dart';
import '../models/paket_model.dart';

// SCREEN 2 — DETAIL KATALOG (StatefulWidget, wajib sesuai requirement)
// Layout vertikal pakai Column. AppBar otomatis memberi tombol back
// begitu screen ini dibuka lewat Navigator.push, jadi tidak perlu
// bikin tombol back manual terpisah.
class DetailKatalogScreen extends StatefulWidget {
  final PaketModel paket;

  const DetailKatalogScreen({super.key, required this.paket});

  @override
  State<DetailKatalogScreen> createState() => _DetailKatalogScreenState();
}

class _DetailKatalogScreenState extends State<DetailKatalogScreen> {
  @override
  Widget build(BuildContext context) {
    final paket = widget.paket;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(paket.nama),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(paket.icon, size: 80, color: Colors.blue),
            ),
            const SizedBox(height: 16),

            // Text nama
            Text(
              paket.nama,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // Text harga
            Text(
              paket.harga,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            // Container pastel + padding untuk deskripsi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                paket.deskripsi,
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Fitur yang didapat:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            ...paket.fitur.map(
                  (f) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Text(f),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali ke Katalog'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
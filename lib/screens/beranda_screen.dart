import 'package:flutter/material.dart';
import '../models/paket_model.dart';
import 'detail_katalog_screen.dart';

// SCREEN 1 — BERANDA (StatelessWidget, wajib sesuai requirement)
// ListView berisi 3 card, tiap card pakai ListTile agar bisa diklik.
class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Katalog Paket IT'),
      ),
      // ListView.builder dipakai (bukan Column manual) supaya scalable
      // kalau nanti jumlah paket bertambah dari 3.
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: daftarPaket.length,
        itemBuilder: (context, index) {
          final paket = daftarPaket[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Icon(paket.icon, size: 40, color: Colors.blue),
              title: Text(
                paket.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(paket.harga),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),

              // ---- INTI NAVIGASI ----
              // Navigator.push mendorong DetailKatalogScreen ke atas
              // stack, sambil membawa objek `paket` yang diklik.
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailKatalogScreen(paket: paket),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
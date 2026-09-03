import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Paket Layanan IT'),
        ),
        body: Center(
          child: PricingCard(),
        ),
      ),
    );
  }
}

class PricingCard extends StatelessWidget {
  const PricingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 700,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),

      // STACK
      child: Stack(
        clipBehavior: Clip.none,
        children: [

          // ISI UTAMA KARTU
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // HEADER PAKET
              Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.laptop_mac,
                      size: 60,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'Paket Profesional',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Solusi IT profesional untuk bisnis Anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // HARGA & DURASI
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: const [
                  Text(
                    'Rp 5.000.000',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(width: 5),

                  Text(
                    '/ proyek',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // DAFTAR FITUR
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [

                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text('Desain UI/UX Khusus'),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text('Setup Database'),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text('Responsive Design'),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text('Support & Maintenance'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // TOMBOL
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Paket dipilih');
                  },
                  child: const Text('Pilih Paket'),
                ),
              ),
            ],
          ),

          // BADGE REKOMENDASI
          Positioned(
            top: -10,
            right: -10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Rekomendasi',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiered_pricing_card/main.dart';

void main() {
  testWidgets('Screen Beranda menampilkan 3 cards dan dapat navigasi ke Detail Katalog',
      (WidgetTester tester) async {
    // Jalankan aplikasi dengan ukuran layar yang cukup
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MyApp());

    // Verifikasi judul AppBar Beranda
    expect(find.text('Katalog Paket IT'), findsOneWidget);

    // Verifikasi 3 nama paket muncul di Beranda
    expect(find.text('Paket Dasar'), findsOneWidget);
    expect(find.text('Paket Profesional'), findsOneWidget);
    expect(find.text('Paket Enterprise'), findsOneWidget);

    // Klik tombol CTA pada paket pertama untuk navigasi (Navigator.push)
    final tombolCta = find.widgetWithText(ElevatedButton, 'Lihat Detail & Pesan').first;
    await tester.tap(tombolCta);
    await tester.pumpAndSettle();

    // Verifikasi sudah berada di Screen 2 (Detail Katalog)
    expect(find.text('Paket Dasar'), findsWidgets); // di AppBar & Judul
    expect(find.text('Deskripsi Layanan'), findsOneWidget);
    expect(find.text('Kembali ke Beranda'), findsOneWidget);

    // Verifikasi kalkulator durasi & interaksi state
    expect(find.text('1 Bulan'), findsOneWidget);
    final tombolTambah = find.byIcon(Icons.add_circle_outline);
    await tester.ensureVisible(tombolTambah);
    await tester.tap(tombolTambah);
    await tester.pump();
    expect(find.text('2 Bulan'), findsOneWidget);

    // Verifikasi tombol favorit (Event & State)
    final tombolFavorit = find.byIcon(Icons.favorite_border);
    await tester.tap(tombolFavorit);
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Verifikasi tombol back dapat kembali ke Screen 1
    final tombolKembali = find.widgetWithText(OutlinedButton, 'Kembali ke Beranda');
    await tester.ensureVisible(tombolKembali);
    await tester.tap(tombolKembali);
    await tester.pumpAndSettle();

    // Verifikasi kembali di Screen Beranda
    expect(find.text('Katalog Paket IT'), findsOneWidget);
  });
}

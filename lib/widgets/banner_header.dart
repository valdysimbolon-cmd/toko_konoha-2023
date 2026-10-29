import 'package:flutter/material.dart';

/// Banner + search + sapaan. Memakai Stack + Positioned (padanan Relative Layout).
class BannerHeader extends StatelessWidget {
  final ValueChanged<String>? onSearch;
  const BannerHeader({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          // Gambar banner di kanan atas (kalau file belum ada, tampil emoji)
          Positioned(
            right: 8,
            top: 16,
            child: Image.asset(
              'assets/images/banner.png',
              height: 120,
              errorBuilder: (context, error, stack) => const Text(
                '🥬🍅\n🍎🥕',
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          // Kolom search di kiri atas
          Positioned(
            left: 12,
            top: 12,
            width: 200,
            child: SizedBox(
              height: 38,
              child: TextField(
                onChanged: onSearch,
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  hintText: 'Cari produk segar di sini...',
                  prefixIcon: const Icon(Icons.search, size: 18),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          // Sapaan di kiri bawah
          const Positioned(
            left: 16,
            bottom: 24,
            child: Text('Selamat Datang\nMau belanja apa?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
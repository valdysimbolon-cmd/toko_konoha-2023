import 'package:flutter/material.dart';
import '../data/models.dart';

/// Bottom navigation: Beranda, Belanja (opsional), Akun.
/// Navigasi memakai Navigator (padanan Intent di Android).
class AppBottomNav extends StatelessWidget {
  final bool showBelanja;
  const AppBottomNav({super.key, this.showBelanja = true});

  Widget _item(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 28),
          Text(label, style: const TextStyle(fontSize: 10)),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item(Icons.home, 'Beranda', () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
            }),
            if (showBelanja)
              InkWell(
                onTap: () => Navigator.pushNamed(context, '/cart'),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                        color: kOrange, shape: BoxShape.circle),
                    child: const Icon(Icons.shopping_basket,
                        color: Colors.white),
                  ),
                  const Text('Belanja', style: TextStyle(fontSize: 10)),
                ]),
              ),
            _item(Icons.account_circle, 'Akun',
                () => Navigator.pushNamed(context, '/account')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  // GANTI dengan data Anda
  static const nama = 'Valdy S.P. Simbolon';
  static const nim = '42325021';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('😊', style: TextStyle(fontSize: 120)),
            SizedBox(height: 16),
            Text(nama),
            Text(nim),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(showBelanja: false),
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

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
            Text('Terimakasih\nsudah membeli',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(showBelanja: false),
    );
  }
}

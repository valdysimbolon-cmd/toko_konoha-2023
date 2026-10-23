import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/account_page.dart';

void main() => runApp(const TokoKonohaApp());

class TokoKonohaApp extends StatelessWidget {
  const TokoKonohaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Konoha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6AA84F)),
      ),
      initialRoute: '/',
      // Route = padanan "Activity" pada Android
      routes: {
        '/': (_) => const HomePage(),
        '/cart': (_) => const CartPage(),
        '/account': (_) => const AccountPage(),
      },
    );
  }
}

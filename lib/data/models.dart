import 'package:flutter/material.dart';

const kGreen = Color(0xFF6AA84F);
const kOrange = Color(0xFFFF9800);

String rp(int v) {
  final s = v.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
  return 'Rp.$s';
}

class Category {
  final String name; // contoh: Sayur
  final String title; // contoh: Kategori Sayuran
  final String emoji;
  const Category(this.name, this.title, this.emoji);
}

class Product {
  final String name, unit, category, emoji;
  final int price;
  const Product(this.name, this.unit, this.price, this.category, this.emoji);
}

const categories = [
  Category('Sayur', 'Kategori Sayuran', '🥬'),
  Category('Buah', 'Kategori Buah Buahan', '🍎'),
  Category('Bumbu', 'Kategori Bumbu Dapur', '🧂'),
  Category('Daging', 'Kategori Daging', '🥩'),
  Category('Telur', 'Kategori Telur', '🥚'),
];

const products = [
  Product('Kangkung', '250 gram', 2900, 'Sayur', '🥬'),
  Product('Bayam', '1 kg', 10000, 'Sayur', '🌿'),
  Product('Jeruk', '1 kg', 30000, 'Buah', '🍊'),
  Product('Buah Naga', '1 kg', 70000, 'Buah', '🐉'),
  Product('Apel', '1 kg', 40000, 'Buah', '🍎'),
  Product('Bawang Merah', '250 gram', 12000, 'Bumbu', '🧅'),
  Product('Cabai Merah', '250 gram', 15000, 'Bumbu', '🌶️'),
  Product('Daging Sapi', '1 kg', 89000, 'Daging', '🥩'),
  Product('Daging Ayam', '1 kg', 38000, 'Daging', '🍗'),
  Product('Telur Ayam', '1 kg', 28000, 'Telur', '🥚'),
  Product('Telur Bebek', '1 kg', 32000, 'Telur', '🥚'),
];

// Dagangan terlaris di beranda
const bestSellers = [
  'Kangkung', 'Daging Sapi', 'Jeruk', 'Telur Ayam', 'Bayam', 'Apel'
];

class CartItem {
  final Product product;
  bool selected = true;
  CartItem(this.product);
}

class Cart extends ChangeNotifier {
  final List<CartItem> items = [];

  void add(Product p) {
    // default jumlah 1 per item -> tidak ditambah dobel
    if (!items.any((i) => i.product.name == p.name)) {
      items.add(CartItem(p));
    }
    notifyListeners();
  }

  bool get allSelected => items.isNotEmpty && items.every((i) => i.selected);

  void toggleAll(bool v) {
    for (final i in items) {
      i.selected = v;
    }
    notifyListeners();
  }

  void toggle(CartItem i, bool v) {
    i.selected = v;
    notifyListeners();
  }

  void removeSelected() {
    items.removeWhere((i) => i.selected);
    notifyListeners();
  }

  int get total =>
      items.where((i) => i.selected).fold(0, (s, i) => s + i.product.price);
}

final cart = Cart();

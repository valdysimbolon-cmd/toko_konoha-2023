import 'package:flutter/material.dart';
import '../data/models.dart';

/// "Fragment" = bagian UI reusable yang dipakai di Beranda & Detail Kategori.
/// Berisi lazy list horizontal (ListView.builder) berisi CardView produk.
class ProductListFragment extends StatelessWidget {
  final List<Product> items;
  const ProductListFragment({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: items.length,
        itemBuilder: (context, i) => ProductCard(product: items[i]),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        // CardView
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(product.emoji,
                      style: const TextStyle(fontSize: 40))),
              const Spacer(),
              Text(product.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12)),
              Text(product.unit, style: const TextStyle(fontSize: 11)),
              Text(rp(product.price), style: const TextStyle(fontSize: 11)),
              const SizedBox(height: 4),
              SizedBox(
                width: double.infinity,
                height: 26,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kGreen,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero),
                  onPressed: () {
                    cart.add(product);
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: const Text('BELI', style: TextStyle(fontSize: 10)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

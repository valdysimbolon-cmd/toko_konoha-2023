import 'package:flutter/material.dart';
import '../data/models.dart';
import '../widgets/bottom_nav.dart';
import 'thanks_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Keranjang Belanja', style: TextStyle(fontSize: 14)),
      ),
      body: ListenableBuilder(
        listenable: cart,
        builder: (context, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Checkbox(
                      value: cart.allSelected,
                      activeColor: kGreen,
                      onChanged: (v) => cart.toggleAll(v ?? false),
                    ),
                    const Text('Pilih Semua', style: TextStyle(fontSize: 12)),
                    const Spacer(),
                    TextButton(
                      onPressed: cart.removeSelected,
                      child: const Text('Hapus',
                          style: TextStyle(color: kGreen)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: cart.items.isEmpty
                    ? const Center(child: Text('Keranjang masih kosong'))
                    : ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (context, i) {
                          final item = cart.items[i];
                          return ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: item.selected,
                                  activeColor: kGreen,
                                  onChanged: (v) =>
                                      cart.toggle(item, v ?? false),
                                ),
                                Text(item.product.emoji,
                                    style: const TextStyle(fontSize: 32)),
                              ],
                            ),
                            title: Text(item.product.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(
                                '${item.product.unit}\n${rp(item.product.price)}'),
                            isThreeLine: true,
                          );
                        },
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Total: ${rp(cart.total)}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kGreen,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        if (cart.total == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Pilih produk dulu')),
                          );
                          return;
                        }
                        cart.removeSelected();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ThanksPage()),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const AppBottomNav(showBelanja: false),
    );
  }
}

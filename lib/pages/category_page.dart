import 'package:flutter/material.dart';
import '../data/models.dart';
import '../widgets/banner_header.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/product_list.dart';

class CategoryPage extends StatelessWidget {
  final Category category; // data dikirim lewat constructor (putExtra)
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final list = products.where((p) => p.category == category.name).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const BannerHeader(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: kGreen),
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(category.emoji,
                      style: const TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 24),
                Text(category.title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
              ]),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: kGreen,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 12),
                child: ProductListFragment(items: list),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(showBelanja: true),
    );
  }
}

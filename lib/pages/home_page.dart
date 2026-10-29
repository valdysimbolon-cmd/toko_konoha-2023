import 'package:flutter/material.dart';
import '../data/models.dart';
import '../widgets/banner_header.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/product_list.dart';
import 'category_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final list = products
        .where((p) => bestSellers.contains(p.name))
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Scaffold = Slot Based Layout (body, bottomNavigationBar)
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BannerHeader(onSearch: (v) => setState(() => query = v)),
            // Bagian kategori (Linear Layout: Row)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map((c) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CategoryPage(category: c)),
                  ),
                  child: Column(children: [
                    Container(
                      width: 52,
                      height: 52,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        border: Border.all(color: kGreen),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                          Image.asset(
                              c.image,
                              width: 36,
                              errorBuilder: (ctx, e, s) =>
                                  Text(c.emoji, style: const TextStyle(fontSize: 28)),
                            ),
                    ),
                    const SizedBox(height: 2),
                    Text(c.name, style: const TextStyle(fontSize: 10)),
                  ]),
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Dagangan Terlaris',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
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

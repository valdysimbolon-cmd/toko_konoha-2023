import 'package:flutter_test/flutter_test.dart';
import 'package:toko_konoha/main.dart';

void main() {
  testWidgets('Beranda tampil', (WidgetTester tester) async {
    await tester.pumpWidget(const TokoKonohaApp());

    expect(find.text('Dagangan Terlaris'), findsOneWidget);
    expect(find.text('Beranda'), findsOneWidget);
  });
}
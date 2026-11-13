import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taverna/screens/store_screen.dart';
import 'package:taverna/widgets/item_card.dart';

Future<void> pumpStore(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: StoreScreen()));
}

void main() {
  testWidgets('renders one ItemCard per store item', (tester) async {
    await pumpStore(tester);

    expect(find.byType(ItemCard), findsNWidgets(4));
  });

  testWidgets('renders the correct icon, name and price for each item',
      (tester) async {
    await pumpStore(tester);

    final cards = tester.widgetList<ItemCard>(find.byType(ItemCard)).toList();
    final expected = [
      ('🍺', 'Cerveja', 10),
      ('🍷', 'Vinho', 20),
      ('🥃', 'Whisky', 30),
      ('🍸', 'Coquetel', 40),
    ];

    expect(cards.length, equals(expected.length));
    for (var i = 0; i < expected.length; i++) {
      expect(cards[i].name, equals(expected[i].$2));
      expect(cards[i].price, equals(expected[i].$3));
    }
  });

  testWidgets('tapping an ItemCard opens the dismissible dialog',
      (tester) async {
    await pumpStore(tester);

    await tester.tap(find.byType(ItemCard).first);
    await tester.pumpAndSettle();

    expect(find.text('Dismissible Dialog'), findsOneWidget);
  });
}

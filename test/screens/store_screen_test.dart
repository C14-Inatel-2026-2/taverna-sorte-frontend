import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:taverna/screens/store_screen.dart';
import 'package:taverna/widgets/item_card.dart';

const fakeItems = [
  {'id': 1, 'name': 'Cerveja', 'price': 10, 'multiplier': 1, 'description': 'Uma cerveja gelada'},
  {'id': 2, 'name': 'Vinho', 'price': 20, 'multiplier': 2, 'description': 'Um vinho tinto'},
  {'id': 3, 'name': 'Whisky', 'price': 30, 'multiplier': 3, 'description': 'Um whisky envelhecido'},
  {'id': 4, 'name': 'Coquetel', 'price': 40, 'multiplier': 4, 'description': 'Um coquetel colorido'},
];

Future<void> pumpStore(
  WidgetTester tester, {
  int statusCode = 200,
  Object body = fakeItems,
}) async {
  final mockClient = MockClient((request) async {
    return http.Response(jsonEncode(body), statusCode);
  });

  await http.runWithClient(
    () => tester.pumpWidget(const MaterialApp(home: StoreScreen())),
    () => mockClient,
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('renders one ItemCard per store item', (tester) async {
    await pumpStore(tester);

    expect(find.byType(ItemCard), findsNWidgets(4));
  });

  testWidgets('renders the correct name and price for each item',
      (tester) async {
    await pumpStore(tester);

    final cards = tester.widgetList<ItemCard>(find.byType(ItemCard)).toList();

    expect(cards.length, equals(fakeItems.length));
    for (var i = 0; i < fakeItems.length; i++) {
      expect(cards[i].name, equals(fakeItems[i]['name']));
      expect(cards[i].price, equals(fakeItems[i]['price']));
    }
  });

  testWidgets('tapping an ItemCard opens the item popup', (tester) async {
    await pumpStore(tester);

    await tester.tap(find.byType(ItemCard).first);
    await tester.pumpAndSettle();

    expect(find.text('Uma cerveja gelada'), findsOneWidget);
    expect(find.text('Preço: 10 moedas'), findsOneWidget);
    expect(find.text('Fechar'), findsOneWidget);
  });
}

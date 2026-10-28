import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taverna/widgets/item_card.dart';

class  MockCallback extends Mock {
  void call();
}
void main() {

  testWidgets('Verify that the parameters are being passed correctly to the ItemCard', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ItemCard(name: '🤠', icon: 'Qualque coisa', price: 666, onPressed: () {})
        ),
      ),
    );

    expect(find.text('🤠'), findsOneWidget);
    expect(find.text('Qualque coisa'), findsOneWidget);
    expect(find.text('🪙 666'), findsOneWidget);
  });

  testWidgets('Verify that the ItemCard calls onPressed only once when clicked', (tester) async {
      var chamadas = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ItemCard(name: '🤠', icon: 'Qualque coisa', price: 666, onPressed: () {chamadas++;})
          ),
        ),
      );

      await tester.tap(find.text('Qualque coisa'));

      expect(chamadas, 1);
    },
  );

  testWidgets('Verify that the ItemCard does not call onPressed when not pressed', (tester) async {
    var chamadas = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ItemCard(name: '🤠', icon: 'Qualque coisa', price: 666, onPressed: () {chamadas++;})
        ),
      ),
    );

    expect(chamadas, 0);
  });
}


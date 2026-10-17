import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taverna/widgets/item_card.dart';

class  MockCallback extends Mock {
  void call();
}
void main() {

  testWidgets('Verifica se os parametros estão sendo passados corretamente para o ItemCard', (tester) async {
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
  testWidgets(
    'Verifica se o botão ItemCard chama o onPressed apenas uma vez quando chamado',
    (tester) async {
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
  testWidgets('Verifica se o botão ItemCard não ativa o onPressed sem ser acionado', (tester) async {
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


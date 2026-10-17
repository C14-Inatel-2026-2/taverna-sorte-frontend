import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taverna/widgets/app_button.dart';

class MockCallback extends Mock {
  void call();
}
void main() {

  testWidgets('Verifica se o nome esta aparecendo corretamente no AppButton', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton('Qualquer coisa', onPressed: () {})
        ),
      ),
    );

    expect(find.text('Qualquer coisa'), findsOneWidget);
  });
  testWidgets(
      'AppButton chama onPressed apenas uma vez quando clicado',
      (tester) async {
        var chamadas = 0;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppButton(
                'Qualquer coisa',
                onPressed: () {
                  chamadas++;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Qualquer coisa'));

        expect(chamadas, 1);
      },
    );
  testWidgets('Verifica se o botão AppButton não ativa o onPressed sem ser acionado', (tester) async {
    var chamadas = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton('Qualquer coisa', onPressed: () {chamadas++;})
        ),
      ),
    );

    expect(chamadas, 0);
  });
}
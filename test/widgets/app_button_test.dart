import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taverna/widgets/app_button.dart';

class MockCallback extends Mock {
  void call();
}
void main() {

  testWidgets('Verify that the text is displayed correctly in the AppButton', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton('Qualquer coisa', onPressed: () {})
        ),
      ),
    );

    expect(find.text('Qualquer coisa'), findsOneWidget);
  });
 
  testWidgets('Verify that the AppButton calls onPressed only once when clicked', (tester) async {
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
  
  testWidgets('Verify that the AppButton does not call onPressed when not pressed', (tester) async {
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
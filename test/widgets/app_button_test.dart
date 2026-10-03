import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:taverna/widgets/app_button.dart';

class MockCallback extends Mock {
  void call();
}
void main() {

  test('Verifica se o botão AppButton chama o onPressed apenas uma vez quando chamado', () {
    final onPressed = MockCallback();
    AppButton('Qualque coisa', onPressed: onPressed.call);

    verify(onPressed()).called(1);
  });
  test('Verifica se o botão AppButton não ativa o onPressed sem ser acionado', () {
    final onPressed = MockCallback();
    AppButton('Qualque coisa', onPressed: onPressed.call);

    verifyNever(onPressed());
  });
}
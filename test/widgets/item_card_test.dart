import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:taverna/widgets/item_card.dart';

class  MockCallback extends Mock {
  void call();
}
void main() {
  test('Verifica se o botão ItemCard chama o onPressed apenas uma vez quando chamado', () {
    final onPressed = MockCallback();
    ItemCard(name: 'Qualque coisa', icon: 'Qualque coisa', price: 666, onPressed: onPressed.call);

    verify(onPressed()).called(1);
  });
  test('Verifica se o botão ItemCard não ativa o onPressed sem ser acionado', () {
    final onPressed = MockCallback();
    ItemCard(name: 'Qualque coisa', icon: 'Qualque coisa', price: 666, onPressed: onPressed.call);

    verifyNever(onPressed());
  });
}


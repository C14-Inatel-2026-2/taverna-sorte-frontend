import 'package:test/test.dart';
import 'package:taverna/widgets/coin_display.dart';

void main() {
  test('CoinDisplay mostra o valor esperado', () {
    final coinDisplay = CoinDisplay(100);
    expect(coinDisplay.value, equals(100));
  });
}
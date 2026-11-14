import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:taverna/repositories/item_repository.dart';

import '../helpers/fake_api_client.dart';

ItemRepository repositoryWith({http.Response? response, Object? error}) {
  return ItemRepository(
    client: FakeApiClient(response: response, error: error),
  );
}

void main() {
  group('ItemRepository exceptions', () {
    test('throws Exception with the status code when status is not 200', () {
      final repository = repositoryWith(response: http.Response('', 404));

      expect(
        repository.getItems(),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Código de status: 404'),
          ),
        ),
      );
    });

    test('throws FormatException when body is not valid JSON', () {
      final repository = repositoryWith(response: http.Response('isso não é json', 200));

      expect(repository.getItems(), throwsA(isA<FormatException>()));
    });

    test('rethrows the error when the client fails', () {
      final repository = repositoryWith(
        error: http.ClientException('Sem conexão'),
      );

      expect(repository.getItems(), throwsA(isA<http.ClientException>()));
    });
  });
}

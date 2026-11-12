import 'package:taverna/core/api_client.dart';

abstract class IItemRepository {
  Future<List<Map<String, dynamic>>> getItems();
}

class ItemRepository implements IItemRepository {
  final IApiClient client;

  ItemRepository({required this.client});

  @override
  Future<List<Map<String, dynamic>>> getItems() async {
    await client.get(
      url: 'https://taverna-sorte-backend.onrender.com/shop/items',
    );

    throw UnimplementedError();
  }
}

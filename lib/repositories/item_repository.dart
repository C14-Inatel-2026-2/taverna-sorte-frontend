import 'dart:convert';

import 'package:taverna/core/api_client.dart';
import 'package:taverna/models/item_model.dart';

abstract class IItemRepository {
  Future<List<ItemModel>> getItems();
}

class ItemRepository implements IItemRepository {
  final IApiClient client;

  ItemRepository({required this.client});

  @override
  Future<List<ItemModel>> getItems() async {
    final response =await client.get(
      url: 'https://taverna-sorte-backend.onrender.com/shop/items',
    );

    if (response.statusCode == 200){
      final List<ItemModel> items = [];

      final body = jsonDecode(response.body);

      body.map((unity) {
        final ItemModel item = ItemModel.fromMap(unity);
        items.add(item);
      }).toList();

      return items;
    } else {
      throw Exception('Falha em carregar os itens da loja. Código de status: ${response.statusCode}');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:taverna/core/api_client.dart';
import 'package:taverna/models/item_model.dart';
import 'package:taverna/repositories/item_repository.dart';
import 'package:taverna/screens/stores/items_store.dart';
import 'package:taverna/widgets/item_card.dart';
import 'package:taverna/widgets/item_popup.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {

  final ItemStore itemStore = ItemStore(repository: ItemRepository(client: ApiClient()));

  @override
  void initState() {
    super.initState();
    itemStore.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja'),
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([itemStore.isLoading, itemStore.state, itemStore.error]),
        builder: (context, child) {
          if (itemStore.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          if (itemStore.error.value.isNotEmpty){
            return Center(child: Text('Erro: ${itemStore.error.value}'));
          }
          if (itemStore.state.value.isEmpty) {
            return Center(child: Text('Nenhum item disponível'));
          }

          return ListView(
            children: [
              SizedBox(height: 80),
              ...itemCards(itemStore.state.value)
            ]
          );
        }
      )
    );
  }
    List<ItemCard> itemCards(List<ItemModel> items) {
    return items.map((item) {
      return ItemCard(
        name: item.name,
        price: item.price,
        onPressed: () {
          Navigator.of(context).push(ItemPopup<void>(title: item.name, description: item.description, price: item.price));
        },
      );
    }).toList();
  }
}



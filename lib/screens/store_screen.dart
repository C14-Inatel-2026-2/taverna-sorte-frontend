import 'package:flutter/material.dart';
import 'package:taverna/widgets/item_card.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 80),
        ...itemCards(
          [
            {'icon': '🍺', 'name': 'Cerveja', 'price': 10},
            {'icon': '🍷', 'name': 'Vinho', 'price': 20},
            {'icon': '🥃', 'name': 'Whisky', 'price': 30},
            {'icon': '🍸', 'name': 'Coquetel', 'price': 40},
          ]
        )
      ]
    );
  }
}


List<ItemCard> itemCards(List<Map<String, dynamic>> items) {
  return items.map((item) {
    return ItemCard(
      icon: item['icon'],
      name: item['name'],
      price: item['price'],
      onPressed: () {},
    );
  }).toList();
}



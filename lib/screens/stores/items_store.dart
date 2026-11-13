import 'package:flutter/material.dart';
import 'package:taverna/models/item_model.dart';
import 'package:taverna/repositories/item_repository.dart';

class ItemStore {
  final IItemRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<ItemModel>> state = ValueNotifier<List<ItemModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  ItemStore({required this.repository});

  Future getItems() async {
    isLoading.value = true;

    try {
      final result = await repository.getItems();
      state.value = result; 

    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
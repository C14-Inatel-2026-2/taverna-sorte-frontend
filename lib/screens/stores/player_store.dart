import 'package:flutter/material.dart';
import 'package:taverna/models/player_model.dart';
import 'package:taverna/repositories/player_repository.dart';

class PlayerStore {
  final IPlayerRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<PlayerModel?> state = ValueNotifier<PlayerModel?>(null);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  PlayerStore({required this.repository});

  Future getPlayer() async {
    isLoading.value = true;

    try {
      final result = await repository.getPlayer();
      state.value = result;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}

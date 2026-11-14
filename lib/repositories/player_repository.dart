import 'dart:convert';

import 'package:taverna/core/api_client.dart';
import 'package:taverna/models/player_model.dart';

abstract class IPlayerRepository {
  Future<PlayerModel> getPlayer();
}

class PlayerRepository implements IPlayerRepository {
  final IApiClient apiClient;

  PlayerRepository({required this.apiClient});

  @override
  Future<PlayerModel> getPlayer() async {
    final response = await apiClient.get(
      url: 'https://taverna-sorte-backend.onrender.com/players/1',
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return PlayerModel.fromMap(body);
    } else {
      throw Exception('Falha em carregar os dados do jogador. Código de status: ${response.statusCode}');
    }
  }
}

import 'package:taverna/core/api_client.dart';
import 'package:taverna/repositories/player_repository.dart';
import 'package:taverna/screens/stores/player_store.dart';

final PlayerStore playerStore = PlayerStore(
  repository: PlayerRepository(apiClient: ApiClient()),
);

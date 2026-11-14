class PlayerModel {
  final int playerId;
  final String username;
  final int balance;
  final Map<String, dynamic> inventory;

  PlayerModel({
    required this.playerId,
    required this.username,
    required this.balance,
    required this.inventory,
  });

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      playerId: map['id'],
      username: map['username'],
      balance: map['balance'],
      inventory: Map<String, dynamic>.from(map['inventory'] ?? {}),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taverna/app/app_stores.dart';
import 'package:taverna/models/player_model.dart';

class TavernAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TavernAppbar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        ValueListenableBuilder<PlayerModel?>(
          valueListenable: playerStore.state,
          builder: (context, player, child) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  player == null ? '🪙 ...' : '🪙 ${player.balance}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

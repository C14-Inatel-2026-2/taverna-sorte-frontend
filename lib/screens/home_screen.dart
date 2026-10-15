import 'package:flutter/material.dart';
import 'package:taverna/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onGamePressed;
  final VoidCallback? onStorePressed;

  const HomeScreen(this.onGamePressed, this.onStorePressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Taverna\nda\nSorte',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 80),
        AppButton(
          'Jogar',
          onPressed: onGamePressed,
        ),
        AppButton(
          'Loja',
          onPressed: onStorePressed,
        ),
      ]
    );
  }
}
import 'package:flutter/material.dart';
import 'package:taverna/widgets/app_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppButton(
          'Jogar',
          onPressed: null,
        ),
        AppButton(
          'Loja',
          onPressed: null,
        ),
      ]
    );
  }
}
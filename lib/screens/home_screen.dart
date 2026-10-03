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
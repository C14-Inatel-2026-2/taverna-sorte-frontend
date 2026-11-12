import 'package:flutter/material.dart';
import 'package:taverna/app/routes/routes.dart';
import 'package:taverna/widgets/app_button.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taverna da Sorte'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Tela não encontrada',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          AppButton(
            'Voltar para Home',
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.home,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:taverna/app/routes/routes.dart';
import 'package:taverna/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {


  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taverna da Sorte'),
      ),
      body: Column(
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
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.game);
            },
          ),
          AppButton(
            'Loja',
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.store);
            },
          ),
        ]
      ),
    );
  }
}
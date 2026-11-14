import 'package:flutter/material.dart';
import 'package:taverna/widgets/tavern_appbar.dart';
import 'package:taverna/app/routes/routes.dart';
import 'package:taverna/widgets/app_button.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TavernAppbar(title: 'Jogos'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppButton(
            'Jogar Dados',
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.dice);
            },
          ),
          AppButton(
            'Girar Roleta',
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.roulette);
            },
          ),
          AppButton(
            'Abrir Baú Encantado',
            onPressed: (){
              Navigator.of(context).pushNamed(Routes.chest);
            },
          ),
        ]
      ),
    );
  }
}
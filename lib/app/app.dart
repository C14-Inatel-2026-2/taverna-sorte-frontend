import 'package:flutter/material.dart';
import 'package:taverna/screens/home_screen.dart';
import 'package:taverna/screens/store_screen.dart';

enum AppRoutes {
  home,
  game,
  store,
}

class TavernaSorte extends StatefulWidget {
  TavernaSorte({super.key});
  AppRoutes actualRoute = AppRoutes.store;


  @override
  State<TavernaSorte> createState() => _TavernaSorteState();
}

class _TavernaSorteState extends State<TavernaSorte> {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taverna da Sorte',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              Text('🪙 100'),
            ],
          ),
        ), 

        body: Center(child: switch(widget.actualRoute) {
          AppRoutes.home => const HomeScreen(),
          AppRoutes.game => const Text('Game'),
          AppRoutes.store => const StoreScreen(),
        }),
      )
    );
  }
}

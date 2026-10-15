import 'package:flutter/material.dart';
import 'package:taverna/screens/home_screen.dart';
import 'package:taverna/screens/store_screen.dart';

enum AppRoutes {
  home,
  game,
  store,
}

class TavernaSorte extends StatefulWidget {
  const TavernaSorte({super.key});


  @override
  State<TavernaSorte> createState() => _TavernaSorteState();
}

class _TavernaSorteState extends State<TavernaSorte> {
 AppRoutes actualRoute = AppRoutes.home;

 @override
  Widget build(BuildContext context) {

    void changeRoute(AppRoutes newRoute) {
      print("Changing route to: $newRoute");
      setState(() {
        actualRoute = newRoute;
      });
    }

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

        body: Center(child: switch(actualRoute) {
          AppRoutes.home => HomeScreen(() => changeRoute(AppRoutes.game),() => changeRoute(AppRoutes.store)),
          AppRoutes.game => const Text('Game'),
          AppRoutes.store => const StoreScreen(),
        }),
      )
    );
  }
}

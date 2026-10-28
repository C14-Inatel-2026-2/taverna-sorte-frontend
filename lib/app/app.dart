import 'package:flutter/material.dart';
import 'package:taverna/app/routes/routes.dart';

class TavernaSorte extends StatefulWidget {
  const TavernaSorte({super.key});


  @override
  State<TavernaSorte> createState() => _TavernaSorteState();
}

class _TavernaSorteState extends State<TavernaSorte> {

 @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: Routes.home,
      routes: router,
      
      title: 'Taverna da Sorte',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

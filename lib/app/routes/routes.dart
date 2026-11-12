import 'package:flutter/material.dart';
import 'package:taverna/screens/games_screen.dart';
import 'package:taverna/screens/home_screen.dart';
import 'package:taverna/screens/store_screen.dart';

class Routes {
  static const String home = '/';
  static const String game = '/game';
  static const String store = '/store';
  static const String dice = '/game/dice';
  static const String roulette = '/game/roulette';
  static const String chest = '/game/chest';
}

final Map<String, WidgetBuilder> router = {
  Routes.home: (context) => HomeScreen(),
  Routes.game: (context) => GamesScreen(),
  Routes.store: (context) => StoreScreen(),
  Routes.dice: (context) => Text('Tela de Dados'),
  Routes.roulette: (context) => Text('Tela de Roleta'),
  Routes.chest: (context) => Text('Tela de Baú'),
};
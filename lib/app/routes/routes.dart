import 'package:flutter/material.dart';
import 'package:taverna/screens/home_screen.dart';
import 'package:taverna/screens/store_screen.dart';

class Routes {
  static const String home = '/';
  static const String game = '/game';
  static const String store = '/store';
}

final Map<String, WidgetBuilder> router = {
  Routes.home: (context) => HomeScreen(),
  Routes.game: (context) => Text('Game'),
  Routes.store: (context) => StoreScreen(),
};
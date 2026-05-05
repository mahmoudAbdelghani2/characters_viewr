import 'package:bloc_test/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouts {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CharactersScreen());
    }
    return null;
  }
}

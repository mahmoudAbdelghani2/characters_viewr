import 'package:bloc_test/consts/strings.dart';
import 'package:bloc_test/presentation/screens/characters_details_screen.dart';
import 'package:bloc_test/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRouts {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
    }
    return null;
  }
}

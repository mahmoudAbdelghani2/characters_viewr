import 'package:bloc_test/consts/strings.dart';
import 'package:bloc_test/cubit/characters_cubit.dart';
import 'package:bloc_test/data/repo/characters_repo.dart';
import 'package:bloc_test/data/services/characters_services.dart';
import 'package:bloc_test/presentation/screens/characters_details_screen.dart';
import 'package:bloc_test/presentation/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouts {
  late CharactersCubit charactersCubit;
  late CharactersRepo charactersRepo;
  AppRouts() {
    charactersRepo = CharactersRepo(charactersServices: CharactersServices());
    charactersCubit = CharactersCubit(charactersRepo: charactersRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                CharactersCubit(charactersRepo: charactersRepo),
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CharactersCubit(charactersRepo: charactersRepo),
            child: CharactersDetailsScreen(),
          ),
        );
    }
    return null;
  }
}

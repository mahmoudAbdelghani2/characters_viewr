import 'package:bloc_test/data/models/characters_model.dart';
import 'package:bloc_test/data/services/characters_services.dart';

class CharactersRepo {
  final CharactersServices charactersServices;

  CharactersRepo({required this.charactersServices});

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charactersServices.getAllCharacters();

    return characters
        .map((character) => CharacterModel.fromJson(character))
        .toList();
  }
}

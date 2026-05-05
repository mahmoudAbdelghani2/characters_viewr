import 'package:bloc/bloc.dart';
import 'package:bloc_test/data/models/characters_model.dart';
import 'package:bloc_test/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<CharacterModel> characters;
  CharactersCubit({required this.charactersRepo, required this.characters})
    : super(CharactersInitial());

  List<CharacterModel> fetchData() {
    charactersRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });

    return characters;
  }
}

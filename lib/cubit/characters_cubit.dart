import 'package:bloc/bloc.dart';
import 'package:bloc_test/data/models/characters_model.dart';
import 'package:bloc_test/data/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  // late List<CharacterModel> characters;
  CharactersCubit({required this.charactersRepo}) : super(CharactersInitial());
  void fetchData() async {
    await charactersRepo.getAllCharacters().then((characters) {
      // this.characters = characters;
      emit(CharactersLoaded(characters: characters));
    });

    // return characters;
  }
}

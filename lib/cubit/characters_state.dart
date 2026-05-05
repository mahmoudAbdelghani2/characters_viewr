part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersError extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characters;

  CharactersLoaded({required this.characters});
}

import 'package:bloc_test/consts/app_color.dart';
import 'package:bloc_test/cubit/characters_cubit.dart';
import 'package:bloc_test/data/models/characters_model.dart';
import 'package:bloc_test/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharacterModel> allCharacters;

  @override
  void initState() {
    super.initState();
    //allCharacters = BlocProvider.of<CharactersCubit>(context).fetchData();
    BlocProvider.of<CharactersCubit>(context).fetchData();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidget();
        } else if (state is CharactersError) {
          //ToDo (implement if state is CharactersError)
          return Center();
        } else {
          return showLoadingIndecator();
        }
      },
    );
  }

  Widget showLoadingIndecator() {
    return Center(child: CircularProgressIndicator(color: MyColors.myYellow));
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(children: [buildCharacterList()]),
      ),
    );
  }

  Widget buildCharacterList() {
    return GridView.builder(
      itemCount: allCharacters.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CharacterWidget(character: allCharacters[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text("Characters", style: TextStyle(color: MyColors.myGrey)),
      ),
      body: buildBlocWidget(),
    );
  }
}

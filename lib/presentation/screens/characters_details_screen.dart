import 'package:bloc_test/consts/app_color.dart';
import 'package:bloc_test/data/models/characters_model.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final CharacterModel characterModel;
  const CharactersDetailsScreen({super.key, required this.characterModel});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          characterModel.name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: characterModel.id,
          child: Image.network(characterModel.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      thickness: 2,
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('Species : ', characterModel.species),
                    buildDivider(300),
                    characterInfo('Status : ', characterModel.status),
                    buildDivider(300),
                    characterInfo('Created : ', characterModel.created),
                    buildDivider(300),
                    characterInfo('Gender : ', characterModel.gender),
                    buildDivider(310),
                    characterInfo(
                      'Location Name : ',
                      characterModel.locationName,
                    ),
                    buildDivider(240),
                    characterInfo('Origin Name : ', characterModel.originName),
                    buildDivider(300),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 500),
            ]),
          ),
        ],
      ),
    );
  }
}

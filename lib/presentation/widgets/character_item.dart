import 'package:bloc_test/consts/app_color.dart';
import 'package:bloc_test/data/models/characters_model.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final CharacterModel character;
  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          color: Colors.black54,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.bottomCenter,
          child: Text(
            "{$character.name}",
            style: TextStyle(
              height: 1.6,
              fontSize: 15,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: MyColors.myGrey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  height: double.infinity,
                  width: double.infinity,
                  placeholder: "assets/lottie/loading.gif",
                  image: character.image,
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/images/placeholderImage.jpg"),
        ),
      ),
    );
  }
}

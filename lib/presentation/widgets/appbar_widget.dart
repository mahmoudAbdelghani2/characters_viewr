import 'package:bloc_test/consts/app_color.dart';
import 'package:flutter/material.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget Function() buildSearchTextFeild;
  final bool isSearching;
  final VoidCallback onSearchToggle;
  final VoidCallback onBack;
  final VoidCallback onClear;

  const MyAppBarWidget({
    super.key,
    required this.isSearching,
    required this.buildSearchTextFeild,
    required this.onSearchToggle,
    required this.onBack,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return AppBar(
        backgroundColor: MyColors.myYellow,
        title: buildSearchTextFeild(),
        centerTitle: true,
        leading: IconButton(
          onPressed: onBack,
          icon: Icon(Icons.arrow_back, color: MyColors.myGrey, size: 30),
        ),
        actions: [
          IconButton(
            onPressed: onClear,
            icon: Icon(Icons.clear, color: MyColors.myGrey, size: 30),
          ),
        ],
      );
    } else {
      return AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text(
          "Characters",
          style: TextStyle(
            color: MyColors.myGrey,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onSearchToggle,
            icon: Icon(Icons.search, color: MyColors.myGrey, size: 30),
          ),
        ],
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}



  // PreferredSizeWidget? buildAppBarWidget({
  //   required bool isSearching,
  //   required List<CharacterModel> filteredCharacters,
  //   required List<CharacterModel> allCharacters,
  //   required TextEditingController searchController,
  //   required Function buildSearchTextFeild,
  // }) {
  //   if (isSearching) {
  //     return AppBar(
  //       backgroundColor: MyColors.myYellow,
  //       title: buildSearchTextFeild(),
  //       centerTitle: true,
  //       leading: IconButton(
  //         onPressed: () {
  //           isSearching = false;
  //           filteredCharacters = allCharacters;
  //           setState(() {});
  //         },
  //         icon: Icon(
  //           Icons.arrow_back,
  //           color: MyColors.myGrey,
  //           fontWeight: FontWeight.bold,
  //           size: 30,
  //         ),
  //       ),
  //       actions: [
  //         IconButton(
  //           onPressed: () {
  //             _searchController.clear();
  //             setState(() {});
  //           },
  //           icon: Icon(
  //             Icons.clear,
  //             color: MyColors.myGrey,
  //             fontWeight: FontWeight.bold,
  //             size: 30,
  //           ),
  //         ),
  //       ],
  //     );
  //   } else {
  //     return AppBar(
  //       backgroundColor: MyColors.myYellow,
  //       title: Text(
  //         "Characters",
  //         style: TextStyle(
  //           color: MyColors.myGrey,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 30,
  //         ),
  //       ),
  //       centerTitle: true,
  //       actions: [
  //         IconButton(
  //           onPressed: () {
  //             isSearching = true;
  //             setState(() {});
  //           },
  //           icon: Icon(
  //             Icons.search,
  //             color: MyColors.myGrey,
  //             fontWeight: FontWeight.bold,
  //             size: 30,
  //           ),
  //         ),
  //       ],
  //     );
  //   }
  // }
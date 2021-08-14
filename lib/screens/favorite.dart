import 'package:buku_meonk/screens/View.dart';
import 'package:flutter/cupertino.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;
import 'package:buku_meonk/main.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    return Scaffold(
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black87 : Colors.amber[50],
      appBar: AppBarDesign(
        titleAppBar: "Favorite",
      ),
      drawer: DrawerDesign(),
      floatingActionButton: SpeedDialDesign(
        listItem: favoriteBookList,
        isDialOpen: isDialOpen,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 650 || global.isGridModeEnabled) {
            return FavoriteGrid();
          }
          return FavoriteScreenMobile(
            isDialOpen: isDialOpen,
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class FavoriteScreenMobile extends StatelessWidget {
  FavoriteScreenMobile({required this.isDialOpen});
  var isDialOpen;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async {
            if (isDialOpen.value) {
              isDialOpen.value = false;
              return false;
            }
            return true;
          },
          child: ListViewMain(
            list: favoriteBookList,
          )),
    );
  }
}

class FavoriteGrid extends StatefulWidget {
  @override
  FavoriteGridState createState() => FavoriteGridState();
}

class FavoriteGridState extends State<FavoriteGrid> {
  @override
  Widget build(BuildContext context) {
    return GridViewMain(list: favoriteBookList);
  }
}

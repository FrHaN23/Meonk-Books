import 'package:buku_meonk/screens/View.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/model/books.dart';

// ignore: must_be_immutable
class MainMenu extends StatefulWidget {
  MainMenu({required this.isDialOpen});
  var isDialOpen;
  @override
  MainMenuState createState() => MainMenuState(isDialOpen: isDialOpen);
}

class MainMenuState extends State<MainMenu> {
  MainMenuState({required this.isDialOpen});
  var isDialOpen;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            if (isDialOpen.value) {
              isDialOpen.value = false;
              return false;
            }
            return true;
          },
          child: ListViewMain(
            list: booksList,
          ),
        ),
      ),
    );
  }
}

class MainMenuGrid extends StatefulWidget {
  @override
  MainMenuGridState createState() => MainMenuGridState();
}

class MainMenuGridState extends State<MainMenuGrid> {
  @override
  Widget build(BuildContext context) {
    return GridViewMain(list: booksList);
  }
}

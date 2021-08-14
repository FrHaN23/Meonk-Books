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
  // final ScrollController _scrollController = ScrollController();
  MainMenuState({required this.isDialOpen});
  var isDialOpen;
  @override
  // void initState() {
  //   _scrollController.addListener(scrolled);
  //   super.initState();
  // }

  // void scrolled() {
  //   if (_scrollController.hasClients) {
  //     if (_scrollController.position.userScrollDirection ==
  //         ScrollDirection.reverse) {
  //
  //     } else if (_scrollController.position.userScrollDirection ==
  //         ScrollDirection.forward) {
  //
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // double _width = MediaQuery.of(context).size.width;
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

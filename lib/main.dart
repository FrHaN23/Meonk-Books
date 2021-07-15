import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:buku_meonk/menu.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:buku_meonk/favorite.dart';
import 'package:buku_meonk/global.dart' as global;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meonk Books',
      routes: {'/favorite': (context) => FavoriteScreen()},
      theme: ThemeData(),
      home: Main(),
    );
  }
}

// ignore: must_be_immutable
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    return Scaffold(
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black : Colors.amber[50],
      appBar: AppBarDesign(
        titleAppBar: "Meonk Book",
      ),
      drawer: DrawerDesign(),
      floatingActionButton: SpeedDialDesign(
        listItem: booksList,
        isDialOpen: isDialOpen,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 650 || global.isGridModeEnabled) {
            return MainMenuGrid();
          }
          return MainMenu(
            isDialOpen: isDialOpen,
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class AppBarDesign extends StatefulWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(55);
  AppBarDesign({required this.titleAppBar});

  final String titleAppBar;

  @override
  _AppBarDesignState createState() =>
      _AppBarDesignState(titleAppBar: titleAppBar);
}

class _AppBarDesignState extends State<AppBarDesign> {
  _AppBarDesignState({required this.titleAppBar});
  final String titleAppBar;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: AppBar(
        brightness:
            global.isDarkModeEnabled ? Brightness.dark : Brightness.light,
        title: Text(
          titleAppBar,
          style: TextStyle(
            color: global.isDarkModeEnabled ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor:
            global.isDarkModeEnabled ? Colors.black26 : Colors.amber[300],
        foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
        iconTheme: IconThemeData(
            color: global.isDarkModeEnabled ? Colors.white : Colors.black),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       showSearch(
          //           context: context,
          //           delegate: SearchBar(
          //             book: booksList,
          //           ));
          //     },
          //     icon: Icon(Icons.search)),
          MediaQuery.of(context).size.width < 650
              ? ChangeToGridButton()
              : Container()
        ],
      ),
    ));
  }
}

class ChangeToGridButton extends StatefulWidget {
  @override
  ChangeToGridButtonState createState() => ChangeToGridButtonState();
}

class ChangeToGridButtonState extends State<ChangeToGridButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        global.isGridModeEnabled = !global.isGridModeEnabled;
        runApp(MyApp());
      },
      icon: Icon(Icons.auto_awesome_mosaic_outlined),
    );
  }
}

class DrawerDesign extends StatefulWidget {
  @override
  _DrawerDesignState createState() => _DrawerDesignState();
}

class _DrawerDesignState extends State<DrawerDesign> {
  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    print(currentRoute);
    return SafeArea(
      child: Drawer(
        child: Container(
          color: global.isDarkModeEnabled ? Colors.black87 : Colors.amber[100],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 120,
                child: Image.asset(
                  'images/cat4.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.menu_book,
                  color: global.isDarkModeEnabled ? Colors.white : null,
                ),
                title: Text(
                  'Beranda',
                  style: TextStyle(
                      color: global.isDarkModeEnabled ? Colors.white : null),
                ),
                onTap: () {
                  if (currentRoute != '/') {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                  leading: Icon(
                    Icons.favorite_outline_rounded,
                    color: global.isDarkModeEnabled ? Colors.white : null,
                  ),
                  title: Text(
                    'Favorite',
                    style: TextStyle(
                        color: global.isDarkModeEnabled ? Colors.white : null),
                  ),
                  onTap: () {
                    if (currentRoute != '/favorite') {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoriteScreen()));
                    } else {
                      Navigator.pop(context);
                    }
                  }),
              // ListTile(
              //   leading: Icon(
              //     Icons.coffee_sharp,
              //     color: global.isDarkModeEnabled ? Colors.white : null,
              //   ),
              //   title: Text(
              //     'Saweria',
              //     style: TextStyle(
              //         color: global.isDarkModeEnabled ? Colors.white : null),
              //   ),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return FavoriteScreen();
              //         },
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SpeedDialDesign extends StatefulWidget {
  SpeedDialDesign({required this.listItem, required this.isDialOpen});
  var isDialOpen;
  List<dynamic> listItem;
  @override
  _SpeedDialDesignState createState() =>
      _SpeedDialDesignState(listItem: listItem, isDialOpen: isDialOpen);
}

class _SpeedDialDesignState extends State<SpeedDialDesign> {
  _SpeedDialDesignState({required this.listItem, required this.isDialOpen});
  var isDialOpen;
  List<dynamic> listItem;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      elevation: 0,
      animatedIcon: AnimatedIcons.menu_close,
      openCloseDial: isDialOpen,
      activeIcon: Icons.remove,
      backgroundColor:
          global.isDarkModeEnabled ? Colors.blue : Colors.amber[500],
      foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
      renderOverlay: false,
      overlayOpacity: 0,
      visible: global.isScrollDown ? false : true,
      closeManually: false,
      children: [
        SpeedDialChild(
          elevation: 0,
          child: Icon(
            global.isDarkModeEnabled ? Icons.light_mode : Icons.dark_mode,
            color: global.isDarkModeEnabled ? Colors.white : null,
          ),
          backgroundColor:
              global.isDarkModeEnabled ? Colors.black : Colors.amber,
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => setState(() {
            global.isDarkModeEnabled = !global.isDarkModeEnabled;
            runApp(MyApp());
          }),
        ),
        SpeedDialChild(
          elevation: 0,
          child: Icon(
            Icons.sort_by_alpha,
            color: global.isDarkModeEnabled ? Colors.white : null,
          ),
          backgroundColor:
              global.isDarkModeEnabled ? Colors.black : Colors.amber,
          onTap: () {
            global.isOrderByAlphabetical = !global.isOrderByAlphabetical;
            if (global.isOrderByAlphabetical) {
              listItem.sort((a, b) {
                print("isOrder true");
                return a.title
                    .toString()
                    .toLowerCase()
                    .compareTo(b.title.toString().toLowerCase());
              });
              runApp(MyApp());
            } else {
              listItem.sort((a, b) {
                print("isOrder false");
                return b.title
                    .toString()
                    .toLowerCase()
                    .compareTo(a.title.toString().toLowerCase());
              });
              runApp(MyApp());
            }
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.keyboard_voice),
          backgroundColor: Colors.green,
          label: 'Third',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => print('THIRD CHILD'),
          onLongPress: () => print('THIRD CHILD LONG PRESS'),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  SearchBar({required this.book});
  final List<Book> book;
  @override
  _SearchBarState createState() => _SearchBarState(book: book);
}

class _SearchBarState extends State<SearchBar> {
  _SearchBarState({required this.book});
  final List<Book> book;
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = TextEditingController();
    return Column(
      children: [
        Expanded(
          child: TextField(
            controller: editingController,
            decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)))),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
// class ExitPrompt extends StatefulWidget {
//   ExitPrompt({required this.child});
//   Widget child;
//   @override
//   _ExitPromptState createState() => _ExitPromptState(child: child);
// }

// class _ExitPromptState extends State<ExitPrompt> {
//   _ExitPromptState({required this.child});
//   DateTime? currentBackPressTime;
//   Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(child: child, onWillPop: onWillPop);
//   }

//   Future<bool> onWillPop() {
//     DateTime now = DateTime.now();
//     if (currentBackPressTime == null ||
//         now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
//       currentBackPressTime = now;
//       final snackBar = SnackBar(content: Text("Tap again to exit"));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       return Future.value(false);
//     }
//     return Future.value(true);
//   }
// }

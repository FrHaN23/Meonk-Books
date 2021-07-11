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
      initialRoute: '/',
      routes: {
        '/': (context) => Main(),
        '/favorite': (context) => FavoriteScreen()
      },
      theme: ThemeData(),
    );
  }
}

// ignore: must_be_immutable
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarDesign(
        titleAppBar: "Meonk Book",
      ),
      drawer: DrawerDesign(),
      floatingActionButton: SpeedDialDesign(
        listItem: booksList,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 650 || global.isGridModeEnabled) {
            return MainMenuGrid();
          }
          return MainMenu();
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
    return AppBar(
      brightness: global.isDarkModeEnabled ? Brightness.dark : Brightness.light,
      title: Text(
        titleAppBar,
        style: TextStyle(
          color: global.isDarkModeEnabled ? Colors.white : Colors.black,
        ),
      ),
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black87 : Colors.amber[300],
      foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
      iconTheme: IconThemeData(
          color: global.isDarkModeEnabled ? Colors.white : Colors.black),
      actions: [ChangeToGridButton()],
    );
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
    return Drawer(
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
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
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
                Navigator.pop(context);
                Navigator.pushNamed(context, '/favorite');
              }),
          ListTile(
            leading: Icon(
              Icons.coffee_sharp,
              color: global.isDarkModeEnabled ? Colors.white : null,
            ),
            title: Text(
              'Saweria',
              style: TextStyle(
                  color: global.isDarkModeEnabled ? Colors.white : null),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return FavoriteScreen();
                },
              ));
            },
          ),
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class SpeedDialDesign extends StatefulWidget {
  SpeedDialDesign({required this.listItem});
  List<dynamic> listItem;
  @override
  _SpeedDialDesignState createState() =>
      _SpeedDialDesignState(listItem: listItem);
}

class _SpeedDialDesignState extends State<SpeedDialDesign> {
  _SpeedDialDesignState({required this.listItem});
  List<dynamic> listItem;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      icon: Icons.keyboard_control,
      activeIcon: Icons.remove,
      overlayColor: Colors.white,
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black : Colors.amber[500],
      foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
      renderOverlay: false,
      overlayOpacity: 0,
      visible: global.isScrollDown ? false : true,
      closeManually: false,
      children: [
        SpeedDialChild(
          child: Icon(
            global.isDarkModeEnabled ? Icons.light_mode : Icons.dark_mode,
            color: global.isDarkModeEnabled ? Colors.white : null,
          ),
          backgroundColor: global.isDarkModeEnabled ? Colors.black54 : null,
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () => setState(() {
            global.isDarkModeEnabled = !global.isDarkModeEnabled;
            runApp(MyApp());
          }),
        ),
        SpeedDialChild(
          child: Icon(
            Icons.sort_by_alpha,
            color: global.isDarkModeEnabled ? Colors.white : null,
          ),
          backgroundColor:
              global.isDarkModeEnabled ? Colors.blue : Colors.amber,
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

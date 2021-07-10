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
      theme: ThemeData(),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  bool isGridModeEnabled = false;
  bool isOrderByAlphabetical = false;
  @override
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        brightness:
            global.isDarkModeEnabled ? Brightness.dark : Brightness.light,
        title: Text(
          'Buku Meonk',
          style: TextStyle(
            color: global.isDarkModeEnabled ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor:
            global.isDarkModeEnabled ? Colors.black87 : Colors.amber[300],
        foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
        iconTheme: IconThemeData(
            color: global.isDarkModeEnabled ? Colors.white : Colors.black),
        actions: [
          IconButton(
            onPressed: () {
              isGridModeEnabled = !isGridModeEnabled;
              runApp(MyApp());
            },
            icon: Icon(Icons.auto_awesome_mosaic_outlined),
          )
        ],
      ),
      drawer: Drawer(
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Main();
                  },
                ));
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return FavoriteScreen();
                  },
                ));
              },
            ),
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
      )),
      floatingActionButton: SpeedDial(
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
              isOrderByAlphabetical = !isOrderByAlphabetical;
              if (isOrderByAlphabetical) {
                booksList.sort((a, b) {
                  print("isOrder true");
                  return a.title
                      .toString()
                      .toLowerCase()
                      .compareTo(b.title.toString().toLowerCase());
                });
                runApp(MyApp());
              } else {
                booksList.sort((a, b) {
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
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 650 || isGridModeEnabled) {
            return MainMenuGrid();
          }
          return MainMenu();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:buku_meonk/menu.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buku Meonk',
          style: TextStyle(
              color: global.isDarkModeEnabled ? Colors.white : Colors.black),
        ),
        backgroundColor:
            global.isDarkModeEnabled ? Colors.black87 : Colors.amber[300],
        foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
        iconTheme: IconThemeData(
            color: global.isDarkModeEnabled ? Colors.white : Colors.black),
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
        overlayOpacity: 0.3,
        visible: true,
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
            onLongPress: () => print('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child: Icon(Icons.brush),
            backgroundColor: Colors.blue,
            label: 'Second',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('SECOND CHILD'),
            onLongPress: () => print('SECOND CHILD LONG PRESS'),
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
          return MainMenu();
        },
      ),
    );
  }
}

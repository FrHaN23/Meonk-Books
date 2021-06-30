import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:buku_meonk/menu.dart';

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
        title: Text('Buku Meonk'),
      ),
      drawer: Drawer(
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
              leading: Icon(Icons.nightlife),
              title: Text('item 1'),
              onTap: () {
                //where should it go
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.switch_left),
              title: Text('item 2'),
              onTap: () {
                //where should it go
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('item 2'),
              onTap: () {
                //where should it go
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.remove,
        overlayColor: Colors.white,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        renderOverlay: false,
        overlayOpacity: 0.5,
        visible: true,
        closeManually: false,
        children: [
          SpeedDialChild(
            child: Icon(Icons.accessibility),
            backgroundColor: Colors.red,
            label: 'First',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => print('FIRST CHILD'),
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

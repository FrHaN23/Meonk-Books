import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Image.asset(
                'images/cat3.png',
                fit: BoxFit.fill,
              ),
            ),
            ListTile(
              title: Text('item 1'),
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

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Book book = booksList[index];
        return InkWell(
          onTap: () {},
          child: Card(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      book.bookThumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              book.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              book.author,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            //Text('Rating'),
                            SizedBox(
                              height: 5,
                            ),
                            //Text(
                            //    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                          ],
                        ))),
                Expanded(
                  flex: 1,
                  child: Bookmarked(),
                )
              ],
            ),
          )),
        );
      },
      itemCount: booksList.length,
    );
  }
}

class Bookmarked extends StatefulWidget {
  @override
  _BookmarkedState createState() => _BookmarkedState();
}

class _BookmarkedState extends State<Bookmarked> {
  bool isMarked = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isMarked = !isMarked;
        });
      },
      icon: Icon(
        isMarked ? Icons.bookmark : Icons.bookmark_outline,
        size: 30,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buku_meonk/global.dart' as global;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:buku_meonk/info.dart';
import 'package:buku_meonk/main.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext contex, BoxConstraints constrains) {
      return FavoriteScreenMobile();
    });
  }
}

class FavoriteScreenMobile extends StatefulWidget {
  @override
  FavoriteScreenMobileState createState() => FavoriteScreenMobileState();
}

class FavoriteScreenMobileState extends State<FavoriteScreenMobile> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black26 : Colors.amber[50],
      appBar: AppBar(
        brightness:
            global.isDarkModeEnabled ? Brightness.dark : Brightness.light,
        title: Text(
          'Favorite',
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
      body: Container(
          color: global.isDarkModeEnabled ? Colors.white12 : Colors.amber[50],
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: favoriteBookList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Book favorited = favoriteBookList[index];

              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoScreen(
                      book: favorited,
                      isMarked: false,
                    );
                  }));
                },
                child: Card(
                  shadowColor: Colors.black,
                  color: global.isDarkModeEnabled
                      ? Colors.black87
                      : Colors.amber[100],
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              favorited.bookThumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 4,
                            child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      favorited.title,
                                      style: TextStyle(
                                          fontSize: _width < 500 ? 16 : 18,
                                          fontWeight: FontWeight.bold,
                                          color: global.isDarkModeEnabled
                                              ? Colors.white
                                              : null),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      favorited.author,
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontSize: _width < 500 ? 14 : 16,
                                          color: global.isDarkModeEnabled
                                              ? Colors.white
                                              : null),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        AbsorbPointer(
                                          child: RatingBar(
                                            initialRating: favorited.rating,
                                            updateOnDrag: false,
                                            tapOnlyMode: false,
                                            itemSize: 20,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            ratingWidget: RatingWidget(
                                                full: Icon(Icons.star,
                                                    color: Colors.orange),
                                                half: Icon(
                                                  Icons.star_half,
                                                  color: Colors.orange,
                                                ),
                                                empty: Icon(
                                                  Icons.star_outline,
                                                  color: Colors.orange,
                                                )),
                                            onRatingUpdate: (value) {},
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          favorited.rating.toString(),
                                          style: TextStyle(
                                            color: global.isDarkModeEnabled
                                                ? Colors.white
                                                : null,
                                            fontSize: _width < 600 ? 12 : 16,
                                          ),
                                        )
                                      ],
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      favorited.description,
                                      maxLines: _width > 660
                                          ? 12
                                          : _width > 660
                                              ? 15
                                              : 8,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: global.isDarkModeEnabled
                                            ? Colors.white
                                            : null,
                                        fontSize: _width < 600 ? 12 : 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //Text(
                                    //    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                                  ],
                                ))),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

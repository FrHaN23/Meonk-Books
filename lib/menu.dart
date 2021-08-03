import 'dart:ui';

import 'package:buku_meonk/main.dart';
import 'package:buku_meonk/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:buku_meonk/info.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buku_meonk/global.dart' as global;

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
    double _width = MediaQuery.of(context).size.width;
    print(_width);
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
          child: Container(
              color:
                  global.isDarkModeEnabled ? Colors.black87 : Colors.amber[50],
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                // controller: _scrollController,
                itemCount: booksList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final Book book = booksList[index];
                  var isMarked = favoriteBookList.contains(book);

                  return InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(goToInfoScreen(book, isMarked));
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
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  book.bookThumbnail,
                                  height: 250,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : CircularProgressIndicator(
                                            color: Colors.amber,
                                          );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      book.title,
                                      style: TextStyle(
                                          fontSize: _width < 400 ? 16 : 18,
                                          fontWeight: FontWeight.bold,
                                          color: global.isDarkModeEnabled
                                              ? Colors.white
                                              : null),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      book.author,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: _width < 500 ? 12 : 16,
                                        color: global.isDarkModeEnabled
                                            ? Colors.white
                                            : null,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        AbsorbPointer(
                                          child: RatingBar(
                                            initialRating: book.rating,
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
                                          book.rating.toString(),
                                          style: TextStyle(
                                            color: global.isDarkModeEnabled
                                                ? Colors.white
                                                : null,
                                            fontSize: _width < 500 ? 12 : 14,
                                          ),
                                        )
                                      ],
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      book.description,
                                      maxLines: _width <= 500 ? 9 : 7,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: global.isDarkModeEnabled
                                            ? Colors.white
                                            : null,
                                        fontSize: _width < 400
                                            ? 12
                                            : _width <= 500
                                                ? 13.5
                                                : 16,
                                      ),
                                    ),

                                    //Text(
                                    //    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (isMarked) {
                                      favoriteBookList.remove(book);
                                    } else {
                                      favoriteBookList.add(book);
                                    }
                                  });
                                },
                                icon: Icon(
                                  isMarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                  size: _width < 500
                                      ? 30
                                      : _width < 600
                                          ? 35
                                          : 40,
                                ),
                                color: global.isDarkModeEnabled
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
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
    double _width = MediaQuery.of(context).size.width;
    print(_width.toString());
    return Scrollbar(
      child: Container(
        color: global.isDarkModeEnabled ? Colors.white10 : Colors.amber[50],
        child: Padding(
          padding: EdgeInsets.all(15),
          child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: _width < 400
                ? 2
                : _width < 600
                    ? 2
                    : _width < 900
                        ? 3
                        : _width < 1200
                            ? 4
                            : 5,
            children: booksList.map(
              (book) {
                var isMarked = favoriteBookList.contains(book);
                return InkWell(
                  onDoubleTap: () {
                    setState(
                      () {
                        if (isMarked) {
                          favoriteBookList.remove(book);
                          final snackBar = SnackBar(
                            content: Text('Removed from favorite'),
                            duration: Duration(seconds: 1),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                favoriteBookList.add(book);
                                runApp(MyApp());
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          favoriteBookList.add(book);
                          final snackBar = SnackBar(
                            content: Text('Added to favorite'),
                            duration: Duration(seconds: 1),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                favoriteBookList.remove(book);
                                runApp(MyApp());
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                    );
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return InfoScreen(book: book, isMarked: isMarked);
                        },
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  book.bookThumbnail,
                                  width: 300,
                                  height: 300,
                                  loadingBuilder: (context, child, progress) {
                                    return progress == null
                                        ? child
                                        : Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.amber,
                                            ),
                                          );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: isMarked
                                  ? Colors.black.withOpacity(0.19)
                                  : null,
                            ),
                          ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            color: Colors.black.withOpacity(0.4),
                            child: Text(
                              book.title,
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _width < 600 ? 11 : 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}

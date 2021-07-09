import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:buku_meonk/info.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buku_meonk/global.dart' as global;

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() => MainMenuState();
}

class MainMenuState extends State<MainMenu> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _scrollController.addListener(scrolled);
    super.initState();
  }

  void scrolled() {
    if (_scrollController.hasClients) {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        //TODO
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        //TODO
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Container(
          color: global.isDarkModeEnabled ? Colors.black87 : Colors.amber[50],
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: booksList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final Book book = booksList[index];
              var isMarked = favoriteBookList.contains(book);

              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoScreen(
                      book: book,
                      isMarked: isMarked,
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
                              book.bookThumbnail,
                              height: 250,
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
                                      book.title,
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
                                      maxLines: _width < 500
                                          ? 5
                                          : _width < 600
                                              ? 7
                                              : 10,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: global.isDarkModeEnabled
                                            ? Colors.white
                                            : null,
                                        fontSize: _width < 600
                                            ? 14
                                            : _width < 700
                                                ? 14
                                                : 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    //Text(
                                    //    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
                                  ],
                                ))),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (isMarked) {
                                  favoriteBookList.remove(book);
                                } else {
                                  favoriteBookList.add(book);
                                  print(favoriteBookList);
                                }
                              });
                            },
                            icon: Icon(
                              isMarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              size: _width > 660
                                  ? 35
                                  : _width > 600
                                      ? 40
                                      : _width > 500
                                          ? 35
                                          : 27,
                            ),
                            color:
                                global.isDarkModeEnabled ? Colors.white : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    ));
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
    return Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: _width < 600 ? 2 : 4,
            children: booksList.map((book) {
              var isMarked = favoriteBookList.contains(book);
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoScreen(book: book, isMarked: isMarked);
                  }));
                },
                child: Card(
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            book.bookThumbnail,
                          ),
                        )),
                        Expanded(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(15, 35, 0, 5),
                                  width: 100,
                                  child: Text(
                                    book.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ))
                            ]))
                      ],
                    )),
              );
            }).toList(),
          ),
        ));
  }
}

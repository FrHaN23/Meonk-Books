import 'dart:ui';
import 'package:buku_meonk/main.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;

class InfoScreen extends StatefulWidget {
  final Book book;
  final bool isMarked;
  InfoScreen({required this.book, required this.isMarked});
  @override
  InfoScreenState createState() =>
      InfoScreenState(book: book, isMarked: isMarked);
}

class InfoScreenState extends State<InfoScreen> {
  final Book book;
  final bool isMarked;
  InfoScreenState({required this.book, required this.isMarked});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext contex, BoxConstraints constrains) {
      if (constrains.maxWidth < 830) {
        return InfoScreenMobile(book: book, isMarked: isMarked);
      }
      return InfoScreenWeb(book: book);
    });
  }
}

class InfoScreenMobile extends StatefulWidget {
  final Book book;
  final bool isMarked;
  InfoScreenMobile({required this.book, required this.isMarked});
  @override
  InfoScreenMobileState createState() =>
      InfoScreenMobileState(book: book, isMarked: isMarked);
}

class InfoScreenMobileState extends State<InfoScreenMobile> {
  final Book book;
  final bool isMarked;
  InfoScreenMobileState({required this.book, required this.isMarked});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    var isMarked = favoriteBookList.contains(book);
    return Scaffold(
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black54 : Colors.amber[100],
      appBar: AppBar(
        backgroundColor:
            global.isDarkModeEnabled ? Colors.black12 : Colors.amber[300],
        foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
        iconTheme: IconThemeData(
          color: global.isDarkModeEnabled ? Colors.white : Colors.black,
        ),
        actions: [
          IconButton(
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
              isMarked ? Icons.bookmark : Icons.bookmark_outline,
              size: _width > 660 ? 35 : 27,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  book.bookCover,
                                ),
                                fit: BoxFit.fill),
                          ),
                          width: _width,
                          height: _width > 1200 ? 500 : 400,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0)),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                        width: _width,
                        height: _width > 1200 ? 400 : 350,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: _width > 1200 ? 100 : 55),
                          child: Center(
                              child: Image.network(book.bookCover,
                                  loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : CircularProgressIndicator(
                                    color: Colors.amber,
                                  );
                          })),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 15,
                        ),
                        child: Center(
                          child: Text(
                            book.title,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: global.isDarkModeEnabled
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Center(
                          child: Text(
                            "By " + book.author,
                            style: TextStyle(
                              fontSize: 14,
                              color: global.isDarkModeEnabled
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                            child: AbsorbPointer(
                              child: RatingBar(
                                initialRating: book.rating,
                                updateOnDrag: false,
                                tapOnlyMode: false,
                                itemSize: 19,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                    full:
                                        Icon(Icons.star, color: Colors.orange),
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 5),
                          child: Text(
                            book.rating.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: global.isDarkModeEnabled
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5, top: 5),
                        child: Center(
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              color: global.isDarkModeEnabled
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 5, 30, 10),
                        child: Center(
                          child: Text(
                            book.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: _width < 400
                                  ? 12
                                  : _width < 600
                                      ? 14
                                      : 16,
                              color: global.isDarkModeEnabled
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 260,
                  padding: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: book.reviewer.map((reviewer) {
                      return Wrap(
                        children: [
                          Card(
                            color: global.isDarkModeEnabled
                                ? Colors.black12
                                : Colors.amber[200],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 100,
                                          padding: EdgeInsets.all(5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                                reviewer.photoProfile),
                                          ),
                                        ),
                                        Container(
                                            child: Text(
                                          reviewer.name,
                                          style: TextStyle(
                                              color: global.isDarkModeEnabled
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                        Container(
                                          width: 200,
                                          padding: EdgeInsets.only(
                                              bottom: 5, top: 5),
                                          child: Text(
                                            reviewer.subject,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: global.isDarkModeEnabled
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                        Container(
                                          child: AbsorbPointer(
                                            child: RatingBar(
                                              initialRating: reviewer.rating,
                                              updateOnDrag: false,
                                              tapOnlyMode: false,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                full: Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                ),
                                                half: Icon(
                                                  Icons.star_half,
                                                  color: Colors.orange,
                                                ),
                                                empty: Icon(Icons.star_outline,
                                                    color: Colors.orange),
                                              ),
                                              onRatingUpdate: (value) {},
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          width: 200,
                                          height: 200,
                                          child: Text(
                                            reviewer.description,
                                            maxLines: 5,
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: global.isDarkModeEnabled
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//wide Version//
class InfoScreenWeb extends StatefulWidget {
  final Book book;
  InfoScreenWeb({required this.book});
  @override
  InfoScreenWebState createState() => InfoScreenWebState(book: book);
}

//wide Version//
class InfoScreenWebState extends State<InfoScreenWeb> {
  final Book book;
  InfoScreenWebState({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: global.isDarkModeEnabled ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(bottom: 3),
            child: Text(book.author),
          ),
          preferredSize: Size(0, -10),
        ),
        backgroundColor:
            global.isDarkModeEnabled ? Colors.black12 : Colors.amber[300],
        foregroundColor: global.isDarkModeEnabled ? Colors.white : Colors.black,
        iconTheme: IconThemeData(
          color: global.isDarkModeEnabled ? Colors.white : Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 1200,
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                          child: Container(
                              width: 370,
                              child: Image.network(
                                book.bookCover,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 50, 10),
                                  child: Card(
                                      child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      book.description,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                                ),
                              ],
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Expanded(
                //         child: Container(
                //           padding: EdgeInsets.fromLTRB(25, 0, 50, 10),
                //           child: Text(
                //             book.description,
                //             textAlign: TextAlign.justify,
                //             style: TextStyle(fontSize: 18),
                //           ),
                //         ),
                //       ),
                //     ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

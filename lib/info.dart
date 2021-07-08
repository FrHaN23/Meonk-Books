import 'dart:ui';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;

class InfoScreen extends StatefulWidget {
  final Book book;
  InfoScreen({required this.book});
  @override
  InfoScreenState createState() => InfoScreenState(book: book);
}

class InfoScreenState extends State<InfoScreen> {
  final Book book;

  InfoScreenState({required this.book});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext contex, BoxConstraints constrains) {
      return InfoScreenMobile(book: book);
    });
  }
}

class InfoScreenMobile extends StatefulWidget {
  final Book book;
  InfoScreenMobile({required this.book});
  @override
  InfoScreenMobileState createState() => InfoScreenMobileState(
        book: book,
      );
}

class InfoScreenMobileState extends State<InfoScreenMobile> {
  final Book book;
  InfoScreenMobileState({required this.book});
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                                image: NetworkImage(book.bookCover),
                                fit: BoxFit.fill),
                          ),
                          width: _width,
                          height: 400,
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
                        height: 350,
                        child: Container(
                          padding: EdgeInsets.only(top: 55),
                          child: Center(
                              child: Image.network(
                            book.bookCover,
                          )),
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
                        padding: EdgeInsets.fromLTRB(15, 5, 30, 30),
                        child: Center(
                          child: Text(
                            book.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: _width < 500 ? 12 : 16,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Web Version//
class InfoScreenWeb extends StatefulWidget {
  final Book book;
  InfoScreenWeb({required this.book});
  @override
  InfoScreenWebState createState() => InfoScreenWebState(book: book);
}

//web Version//
class InfoScreenWebState extends State<InfoScreenWeb> {
  final Book book;
  InfoScreenWebState({required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
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
                          width: 260,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                book.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    book.author,
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 50, 10),
                      child: Text(
                        book.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}

import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:buku_meonk/global.dart' as global;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class InfoScreenWeb extends StatefulWidget {
  final Book book;
  final bool isMarked;
  InfoScreenWeb({required this.book, required this.isMarked});
  @override
  InfoScreenWebState createState() =>
      InfoScreenWebState(book: book, isMarked: isMarked);
}

//wide Version//
class InfoScreenWebState extends State<InfoScreenWeb> {
  final Book book;
  final bool isMarked;
  InfoScreenWebState({required this.book, required this.isMarked});
  @override
  Widget build(BuildContext context) {
    var isMarked = favoriteBookList.contains(book);
    return Scaffold(
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black87 : Colors.amber[100],
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(top: 5),
          child: IconButton(
            iconSize: 34,
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            book.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: global.isDarkModeEnabled ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 5),
            child: IconButton(
              iconSize: 30,
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
                isMarked ? Icons.bookmark : Icons.bookmark_outline,
              ),
            ),
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(bottom: 0),
            child: Text(
              book.author,
              style: TextStyle(
                  color:
                      global.isDarkModeEnabled ? Colors.white : Colors.black),
            ),
          ),
          preferredSize: Size(0, 0),
        ),
        backgroundColor:
            global.isDarkModeEnabled ? Colors.black : Colors.amber[300],
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
                              loadingBuilder: (context, child, progress) {
                                return progress == null
                                    ? child
                                    : Center(
                                        child: CircularProgressIndicator(
                                          color: Colors.amber,
                                        ),
                                      );
                              },
                            ),
                          ),
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
                                      color: global.isDarkModeEnabled
                                          ? Colors.black26
                                          : Colors.amber[200],
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        child: Text(
                                          book.description,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: global.isDarkModeEnabled
                                                  ? Colors.white
                                                  : Colors.black),
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
                Row(children: [
                  Container(
                    padding: EdgeInsets.only(left: 55, right: 10),
                    alignment: Alignment.center,
                    child: AbsorbPointer(
                      child: RatingBar(
                        initialRating: book.rating,
                        updateOnDrag: false,
                        tapOnlyMode: false,
                        itemSize: 40,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.orange),
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
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                      book.rating.toString(),
                      style: TextStyle(
                          fontSize: 24,
                          color: global.isDarkModeEnabled
                              ? Colors.white
                              : Colors.black),
                    ),
                  )
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Divider(),
                    Container(
                      height: 250,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  color:
                                                      global.isDarkModeEnabled
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
                                                    color:
                                                        global.isDarkModeEnabled
                                                            ? Colors.white
                                                            : Colors.black),
                                              ),
                                            ),
                                            Container(
                                              child: AbsorbPointer(
                                                child: RatingBar(
                                                  initialRating:
                                                      reviewer.rating,
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
                                                    empty: Icon(
                                                        Icons.star_outline,
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
                                              height: 100,
                                              child: Text(
                                                reviewer.description,
                                                maxLines: 4,
                                                textAlign: TextAlign.justify,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color:
                                                        global.isDarkModeEnabled
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

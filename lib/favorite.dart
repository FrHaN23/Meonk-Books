import 'package:flutter/cupertino.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buku_meonk/global.dart' as global;
import 'package:buku_meonk/info.dart';
import 'package:buku_meonk/main.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          global.isDarkModeEnabled ? Colors.black54 : Colors.amber[50],
      appBar: AppBarDesign(
        titleAppBar: "Favorite",
      ),
      drawer: DrawerDesign(),
      floatingActionButton: SpeedDialDesign(
        listItem: favoriteBookList,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 650 || global.isGridModeEnabled) {
            return FavoriteGrid();
          }
          return FavoriteScreenMobile();
        },
      ),
    );
  }
}

class FavoriteScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
          color: global.isDarkModeEnabled ? Colors.black54 : Colors.amber[50],
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
                                      maxLines: _width < 400
                                          ? 10
                                          : _width < 500
                                              ? 5
                                              : 7,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: global.isDarkModeEnabled
                                            ? Colors.white
                                            : null,
                                        fontSize: _width < 600 ? 15 : 16,
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

class FavoriteGrid extends StatefulWidget {
  @override
  FavoriteGridState createState() => FavoriteGridState();
}

class FavoriteGridState extends State<FavoriteGrid> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    print(_width.toString());
    return Scrollbar(
      child: Container(
        color: global.isDarkModeEnabled ? Colors.black87 : Colors.amber[50],
        child: Padding(
          padding: EdgeInsets.all(15),
          child: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: _width < 700
                ? 1
                : _width < 1100
                    ? 2
                    : _width < 1300
                        ? 3
                        : _width < 1600
                            ? 4
                            : 5,
            children: favoriteBookList.map(
              (book) {
                var isMarked = favoriteBookList.contains(book);
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return InfoScreen(book: book, isMarked: isMarked);
                    }));
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
                              child: Image.network(
                                book.bookThumbnail,
                                width: 300,
                                height: 300,
                                fit: BoxFit.cover,
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
                              child: Container(
                            color: isMarked ? null : null,
                          ))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            color: Colors.black.withOpacity(0.7),
                            child: Text(
                              book.title,
                              style: TextStyle(
                                  color: Colors.white,
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

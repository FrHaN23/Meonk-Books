import 'package:flutter/material.dart';
import 'package:buku_meonk/model/books.dart';
import 'package:buku_meonk/routes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:buku_meonk/global.dart' as global;

// ignore: must_be_immutable
class ListViewMain extends StatefulWidget {
  ListViewMain({Key? key, required this.list}) : super(key: key);
  List<dynamic> list;

  @override
  _ListViewMainState createState() => _ListViewMainState(list: list);
}

class _ListViewMainState extends State<ListViewMain> {
  _ListViewMainState({required this.list});
  ScrollController _scrollController = ScrollController();

  List list;
  int viewListLength = 5;
  var isOutOfRange = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter > list.length) {
      setState(() {
        isOutOfRange = true;
      });
    }
    if (_scrollController.position.extentAfter < list.length) {
      setState(() {
        viewListLength += 1;
      });
    }
  }

  Widget getBody() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height,
      color: global.isDarkModeEnabled ? Colors.black87 : Colors.amber[50],
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: list.length < 5
            ? list.length
            : isOutOfRange
                ? list.length
                : viewListLength,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          final Book book = list[index];
          var isMarked = favoriteBookList.contains(book);

          return InkWell(
            onTap: () {
              Navigator.of(context).push(goToInfoScreen(book, isMarked));
            },
            child: Card(
              shadowColor: Colors.black,
              color:
                  global.isDarkModeEnabled ? Colors.black87 : Colors.amber[100],
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: book.bookThumbnail,
                          child: Image.network(
                            book.bookThumbnail,
                            height: 250,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.amber,
                                    ));
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          isMarked ? Icons.bookmark : Icons.bookmark_outline,
                          size: _width < 500
                              ? 30
                              : _width < 600
                                  ? 35
                                  : 40,
                        ),
                        color: global.isDarkModeEnabled ? Colors.white : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}

// ignore: must_be_immutable
class GridViewMain extends StatefulWidget {
  GridViewMain({Key? key, required this.list}) : super(key: key);
  List<dynamic> list;
  @override
  _GridViewMainState createState() => _GridViewMainState(list: list);
}

class _GridViewMainState extends State<GridViewMain> {
  _GridViewMainState({required this.list});
  List<dynamic> list;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    int crossAxisCountLimit = _width < 400
        ? 2
        : _width < 600
            ? 3
            : _width < 1200
                ? 4
                : 5;
    return Scrollbar(
      child: Container(
        color: global.isDarkModeEnabled ? Colors.black87 : Colors.amber[50],
        child: GridView.count(
          crossAxisCount: crossAxisCountLimit,
          children: list.map(
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
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  );
                },
                onTap: () {
                  Navigator.of(context).push(goToInfoScreen(book, isMarked));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Hero(
                                tag: book.bookThumbnail,
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
                                ? Colors.black.withOpacity(0.16)
                                : null,
                          ),
                        ))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Container(
                            width: 300,
                            margin: EdgeInsets.only(left: 8, right: 8),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            color: Colors.black.withOpacity(0.24),
                            child: Text(
                              book.title,
                              softWrap: true,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: _width < 600 ? 11 : 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
